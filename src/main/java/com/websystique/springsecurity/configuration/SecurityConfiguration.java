package com.websystique.springsecurity.configuration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.websystique.springsecurity.model.Utilisateur;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	CustomSuccessHandler customSuccessHandler;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		List<Utilisateur> users = new ArrayList<Utilisateur>();
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("user");
	    	
	        System.out.println("Collection User selected successfully");
	        DBCursor cursor = coll.find();
	       
	        int i = 1;
				
	        while (cursor.hasNext()) { 
	           System.out.println("fetched Document user: "+i); 
	           DBObject dbo = cursor.next();
	           Utilisateur p = new Utilisateur();
	          
	           p.setUsername((String)dbo.get("username"));
	           //System.out.println("username: "+dbo.get("username"));
	           p.setAddress((String)dbo.get("address"));
	           //System.out.println("address :"+dbo.get("address"));
	           p.setEmail((String)dbo.get("email"));
	           //System.out.println("Email :"+dbo.get("email"));
	           p.setPasswd((String)dbo.get("passwd"));
	           p.setRole((String)dbo.get("role"));
	         System.out.println("role :"+dbo.get("role"));
	           users.add(p);
	           i++;
	        }
	       
	        
	     }catch(Exception e){
	    	 e.printStackTrace();
	     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	     }
		for (Utilisateur user : users){
			String username=user.getUsername();
			String password =user.getPassword();
			String role = user.getRole();
			auth.inMemoryAuthentication().withUser(username).password(password).roles(role);
		}
		
//		auth.inMemoryAuthentication().withUser("admin").password("root123").roles("ADMIN");
//		auth.inMemoryAuthentication().withUser("dba").password("root123").roles("ADMIN","DBA");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
	  http.authorizeRequests()
	  .antMatchers("/").permitAll()
	  .antMatchers("/chat").permitAll()
	  	.antMatchers("/admin/**").access("hasRole('syndic')")
	  	.antMatchers(HttpMethod.POST, "/admin/**").hasRole("syndic")
	  	.antMatchers(HttpMethod.GET, "/admin/**").hasRole("syndic")
	  	.antMatchers(HttpMethod.DELETE, "/admin/**").hasRole("syndic")
	  	.antMatchers(HttpMethod.PUT, "/admin/**").hasRole("syndic")
	  	.and().formLogin().loginPage("/login").successHandler(customSuccessHandler)
	  	.usernameParameter("ssoId").passwordParameter("password")
	  	
	  	.and().exceptionHandling().accessDeniedPage("/Access_Denied")
	  .and().csrf().disable();
	}

}
