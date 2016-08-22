package com.websystique.springsecurity.model;

public class Utilisateur {
	private String username;
    private String firstName;
    public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	private String lastName;
	private String address;
     
    private String email;
    private String password ;
    private String role;
     
    public String getPassword() {
		return password;
	}

	public void setPasswd(String passwd) {
		this.password = passwd;
	}

	
     public Utilisateur (){
    	 
     }
    public  Utilisateur (String username, String email,String status){
        
        this.username = username;
        
        this.email = email;
        this.role=status;
        
    }
 
    public String getRole() {
		return role;
	}

	public void setRole(String status) {
		this.role = status;
	}

	
 
    
    public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }
 
    public String getEmail() {
        return email;
    }
 
    public void setEmail(String email) {
        this.email = email;
    }

}
