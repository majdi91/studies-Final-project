package com.websystique.springsecurity.service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mongodb.BasicDBObject;
import com.mongodb.BasicDBObjectBuilder;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.websystique.springsecurity.model.Bill;
import com.websystique.springsecurity.model.Comment;
import com.websystique.springsecurity.model.Email;
import com.websystique.springsecurity.model.Message;
import com.websystique.springsecurity.model.Paiement;
import com.websystique.springsecurity.model.Project;
import com.websystique.springsecurity.model.Publication;
import com.websystique.springsecurity.model.Utilisateur;
import com.websystique.springsecurity.model.Vote;;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	
	private static final AtomicLong counter = new AtomicLong();
	
	private static List<Utilisateur> users;
	private static List<Publication> pubs;
	private static List<Project> projects;
	private static List<Comment> comments;
	private static List<Paiement> pays;
	private static List<Message> messages;
	private static List<Vote> votes;
	private static List<Bill> bills;
	private static List<Email> mails;
	static{
		users= populateDummyUtilisateurs();
		pubs= populateDummyPubs();
		projects= populateDummyProjects();
		comments=populateDummycomments();
		pays=populateDummyPays();
		messages=populateDummyMessges();
		votes=populateDummyVotes();
		bills = populateDummyBills();
		mails = populateDummyMails();
	}
	public List<Paiement> findAllPays() {
		return pays;
	}
	public List<Vote> getVote() {
		return votes;
	}
	public List<Message> getmessage() {
		return messages;
	}

	public List<Comment> findAllComments() {
		return comments;
	}
	public List<Utilisateur> findAllUtilisateurs() {
		return users;
	}
	public List<Publication> findAllPubs() {
		return pubs;
	}
	
	public List<Project> findAllProjects() {
		return projects;
	}
	public List<Bill> findAllBills() {
		return bills;
	}
	public List<Email> findAllMails() {
		return mails;
	}
	
	public void AddComment(Comment c){
		try{
			
		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Comments");
    	DBObject document =  new BasicDBObject();
    	
		document.put("txtcomment", c.getTxt());
		document.put("project_id", c.getProject().getId());
		document.put("user", c.getUser().getUsername());
		coll.insert(document);
		}
		catch(Exception e){
	    	 e.printStackTrace();
	     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	     }
		comments.add(c);
	}
	public void sendmail (Email e)
	{
try{
			
    		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
        	DB db = mongoClient.getDB( "Persons" );
        	DBCollection coll = db.getCollection("Email");
        	DBObject document =  new BasicDBObject();
        	
    		document.put("from", e.getFrom());
    		document.put("to", e.getTo());
    		document.put("object", e.getObject());
    		document.put("budy", e.getBudy());
    		document.put("firstName", e.getFirstName());
    		document.put("lastName", e.getLastName());
    		coll.insert(document);
    		}
    		catch(Exception err){
    	    	 err.printStackTrace();
    	     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
    	     }
	}
	public void addmessage(Message m){
		try{
			
		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Message");
    	DBObject document =  new BasicDBObject();
    	
		document.put("txt", m.getTxt());
		document.put("sender", m.getSender());
		coll.insert(document);
		}
		catch(Exception e){
	    	 e.printStackTrace();
	     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	     }
		
	}
	public void AddBill(Bill b){
		try{
			
		MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Bill");
    	DBObject document =  new BasicDBObject();
    	
		document.put("invoice", b.getInvoice());
		document.put("order_id", b.getId());
		document.put("firstName", b.getFirstName());
		document.put("lastName", b.getLastName());
		document.put("email", b.getEmail());
		document.put("montant", b.getMontant());
		document.put("address", b.getAddress());
		document.put("phone", b.getPhone());
		document.put("date", b.getDate());
		coll.insert(document);
		}
		catch(Exception e){
	    	 e.printStackTrace();
	     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	     }
		
	}
	private static List<Bill> populateDummyBills(){
		List<Bill> ps = new ArrayList<Bill>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Bill");
        System.out.println("Collection Bill selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Vote: "+i); 
           DBObject dbo = cursor.next();
           Bill b = new Bill();
           
           //System.out.println("ID: "+dbo.get("id"));
           b.setFirstName((String)dbo.get("firstName"));
           b.setLastName((String)dbo.get("lastName"));
           b.setId((String)dbo.get("order_id"));
           b.setInvoice((String)dbo.get("invoice"));
           b.setEmail((String)dbo.get("email"));
           b.setPhone((String)dbo.get("phone"));
           b.setAddress((String)dbo.get("address"));
           b.setMontant((Double)dbo.get("montant"));
           b.setDate((String)dbo.get("date"));
           ps.add(b);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Email> populateDummyMails(){
		List<Email> ps = new ArrayList<Email>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Email");
        System.out.println("Collection Email selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Email: "+i); 
           DBObject dbo = cursor.next();
           Email b = new Email();
           
           //System.out.println("ID: "+dbo.get("id"));
          
           b.setFrom((String)dbo.get("from"));
           b.setTo((String)dbo.get("to"));
           b.setObject((String)dbo.get("object"));
           b.setBudy((String)dbo.get("budy"));
           b.setFirstName((String)dbo.get("firstName"));
           b.setLastName((String)dbo.get("lastName"));
           ps.add(b);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Vote> populateDummyVotes(){
		List<Vote> ps = new ArrayList<Vote>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Vote");
        System.out.println("Collection Vote selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Vote: "+i); 
           DBObject dbo = cursor.next();
           Vote v = new Vote();
           
           //System.out.println("ID: "+dbo.get("id"));
           v.setUser((String)dbo.get("user"));
           v.setProject_id((String)dbo.get("project_id"));
           v.setLike((Integer)dbo.get("like"));
           v.setDislike((Integer)dbo.get("dislike"));
           ps.add(v);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Publication> populateDummyPubs(){
		List<Publication> ps = new ArrayList<Publication>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Publication");
        System.out.println("Collection Publication selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Publication: "+i); 
           DBObject dbo = cursor.next();
           Publication p = new Publication();
           
           //System.out.println("ID: "+dbo.get("id"));
           p.setId((String)dbo.get("id"));
           p.setLib((String)dbo.get("lib"));
           p.setFile_name((List<String>)dbo.get("file_name"));
           p.setFile_size((List<String>)dbo.get("file_size"));
           p.setFile_date((List<String>)dbo.get("file_date"));
           p.setFile_type((List<String>)dbo.get("file_type"));
           ps.add(p);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Message> populateDummyMessges(){
		List<Message> ps = new ArrayList<Message>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Message");
        System.out.println("Collection Message selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Message: "+i); 
           DBObject dbo = cursor.next();
           Message p = new Message();
           
           //System.out.println("ID: "+dbo.get("id"));
           p.setTxt((String)dbo.get("txt"));
           p.setSender((String)dbo.get("sender"));
           
           ps.add(p);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Paiement> populateDummyPays(){
		List<Paiement> ps = new ArrayList<Paiement>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("payment");
        System.out.println("Collection Payment selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Payment: "+i); 
           DBObject dbo = cursor.next();
           Paiement p = new Paiement();
           
           //System.out.println("ID: "+dbo.get("id"));
           p.setMontant((Double)dbo.get("montant"));
           p.setUser((String)dbo.get("user"));
           p.setEtat((String)dbo.get("etat"));
           p.setDate((String)dbo.get("date"));
           
           ps.add(p);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Project> populateDummyProjects(){
		List<Project> ps = new ArrayList<Project>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("project");
        System.out.println("Collection Project selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Projects: "+i); 
           DBObject dbo = cursor.next();
           Project p = new Project();
           
           //System.out.println("ID: "+dbo.get("id"));
           p.setId((String)dbo.get("project_id"));
           p.setDesc((String)dbo.get("dsec"));
           p.setTitre((String)dbo.get("titre"));
           p.setCat((String)dbo.get("cat"));
           p.setBudget((double)dbo.get("budget"));
           p.setEtat((String)dbo.get("etat"));
           p.setDate_deb((String)dbo.get("date_deb"));
           p.setDate_fin((String)dbo.get("date_fin"));
           p.setAvancement((Integer)dbo.get("avancement"));
           ps.add(p);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
	private static List<Comment> populateDummycomments(){
		List<Comment> ps = new ArrayList<Comment>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("Comments");
        System.out.println("Collection Comment selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document in Comment: "+i); 
           DBObject dbo = cursor.next();
           Comment c = new Comment();
           
           //System.out.println("ID: "+dbo.get("id"));
           c.setTxt((String)dbo.get("txtcomment"));
           c.setProject_id((String)dbo.get("project_id"));
           c.setUtilisateur((String)dbo.get("user"));
           
           
           ps.add(c);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}
public void deleteUserById(String username) {
	for (Iterator<Utilisateur> iterator = users.iterator(); iterator.hasNext(); ) {
	    Utilisateur user = iterator.next();
	    if (user.getUsername() == username) {
	        iterator.remove();
		
		    try{
		    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
		    	DB db = mongoClient.getDB( "Persons" );
		    	DBCollection coll = db.getCollection("user");
				DBObject document = BasicDBObjectBuilder.start().add("username", user.getUsername()).get();
				coll.remove(document);
		    }
		    catch (Exception e)
		    {
		    	e.printStackTrace();
		    }
		    }
		}
	}
	public void updateUser(Utilisateur user) {
		int index = users.indexOf(user);
		users.set(index, user);
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("user");
			DBObject document = BasicDBObjectBuilder.start()
					.add("username", user.getUsername())
					.add("firstName", user.getFirstName())
					.add("lastName", user.getLastName())
					.add("email", user.getEmail())
					.add("passwd", user.getPassword())
					.add("role", user.getRole()).get();
			BasicDBObject searchQuery = new BasicDBObject().append("username", user.getUsername());
			coll.update(searchQuery, document);
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	public Publication findPubById(String titre) {
		for(Publication pub : pubs){
			if(pub.getTitre() == titre){
				return pub;
			}
		}
		return null;
	}
	
	
	public Utilisateur findByName(String name) {
		for(Utilisateur user : users){
			if(user.getUsername().equalsIgnoreCase(name)){
				return user;
			}
		}
		return null;
	}
	public Paiement findByUserName(String name) {
		for(Paiement p : pays){
			if(p.getUser().equalsIgnoreCase(name)){
				return p;
			}
		}
		return null;
	}
	public Project findProject(String id) {
		for(Project p : projects){
			if(p.getId().equalsIgnoreCase(id)){
				return p;
			}
		}
		return null;
	}
	
	public void saveUtilisateur(Utilisateur user) {
		
		
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("user");
			DBObject document =  new BasicDBObject();
			
			document.put("firstName", user.getFirstName());
			document.put("username", user.getUsername());
			document.put("passwd", user.getPassword());
			document.put("email", user.getEmail());
			document.put("lastName", user.getLastName());
			document.put("role", user.getRole());
			coll.insert(document);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
			users.add(user);
	}
		public void vote(Vote v) {
		
		
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("Vote");
			DBObject document =  new BasicDBObject();
			
			document.put("user", v.getUser());
			document.put("project_id", v.getProject_id());
			document.put("like", v.getLike());
			document.put("dislike", v.getDislike());
			
			coll.insert(document);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
			votes.add(v);
	}
public void saveProject(Project p) {
		
		
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("project");
			DBObject document =  new BasicDBObject();
			
			document.put("project_id", p.getId());
			document.put("cat", p.getCat());
			document.put("dsec", p.getDesc());
			document.put("titre", p.getTitre());
			document.put("budget", p.getBudget());
			document.put("date_deb", p.getDate_deb());
			document.put("date_fin", p.getDate_fin());
			coll.insert(document);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
			projects.add(p);
	}
public void savePub(Publication pub) {
		
		
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("Publication");
	    	
			DBObject document =  new BasicDBObject();
			document.put("id", pub.getTitre());
			document.put("desc", pub.getDesc());
			document.put("lib", pub.getCat());
			document.put("user", pub.getUser().getUsername());
			document.put("file_name", pub.getFile_name());
			document.put("file_size", pub.getFile_size());
			document.put("file_date", pub.getFile_date());
			document.put("file_type", pub.getFile_type());
			coll.insert(document);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
			pubs.add(pub);
	}

	public void updateUtilisateur(Utilisateur user) {
		
		try{
	    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
	    	DB db = mongoClient.getDB( "Persons" );
	    	DBCollection coll = db.getCollection("user");
			DBObject document = BasicDBObjectBuilder.start()
					
					
					.add("username", user.getUsername())
					.add("firstName", user.getFirstName())
					.add("lastName", user.getLastName())
					.add("role", user.getRole())
					.add("passwd", user.getPassword())
					.add("email", user.getEmail()).get();
			BasicDBObject searchQuery = new BasicDBObject().append("username", user.getUsername());
			coll.update(searchQuery, document);
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}



	public boolean isUtilisateurExist(Utilisateur user) {
		return findByName(user.getUsername())!=null;
	}
	
	public void deleteAllUtilisateurs(){
		users.clear();
	}

	private static List<Utilisateur> populateDummyUtilisateurs(){
		List<Utilisateur> ps = new ArrayList<Utilisateur>();
    	try{
    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
    	DB db = mongoClient.getDB( "Persons" );
    	DBCollection coll = db.getCollection("user");
        System.out.println("Collection User selected successfully");
        DBCursor cursor = coll.find();
        int i = 1;
			
        while (cursor.hasNext()) { 
           System.out.println("fetched Document: "+i); 
           DBObject dbo = cursor.next();
           Utilisateur p = new Utilisateur();
           
           //System.out.println("ID: "+dbo.get("id"));
           p.setUsername((String)dbo.get("username"));
           p.setFirstName((String)dbo.get("firstName"));
           p.setLastName((String)dbo.get("lastName"));
           //System.out.println("username: "+dbo.get("username"));
           p.setRole((String)dbo.get("role"));
           //System.out.println("address :"+dbo.get("address"));
           p.setEmail((String)dbo.get("email"));
           //System.out.println("Email :"+dbo.get("email"));
           ps.add(p);
           i++;
        }
     }catch(Exception e){
    	 e.printStackTrace();
     //   System.err.println( e.getClass().getName() + ": " + e.getMessage() );
     }
    	 return ps;
	}

//	@Override
//	public Utilisateur findById(long id) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	
public void deleteUtilisateurByusername(Utilisateur u) {
		
		
		    
		    try{
		    	MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
		    	DB db = mongoClient.getDB( "Persons" );
		    	DBCollection coll = db.getCollection("user");
				DBObject document = BasicDBObjectBuilder.start().add("username", u.getUsername()).get();
				coll.remove(document);
				System.out.println("deleted: "+u.getUsername());
		    }
		    catch (Exception e)
		    {
		    	e.printStackTrace();
		    }
		    }
		
	
	
	public boolean isPubExist(Publication pub) {
		return findPubById(pub.getTitre())!=null;
	}
	public boolean isDetailsExist(Paiement p) {
		return findByUserName(p.getUser())!=null;
	}
	public boolean isProjectExist(Project p) {
		return findPubById(p.getId())!=null;
	}
}
