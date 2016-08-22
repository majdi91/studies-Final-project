package com.websystique.springsecurity.service;



import java.util.List;

import com.websystique.springsecurity.model.Bill;
import com.websystique.springsecurity.model.Comment;
import com.websystique.springsecurity.model.Email;
import com.websystique.springsecurity.model.Message;
import com.websystique.springsecurity.model.Paiement;
import com.websystique.springsecurity.model.Project;
import com.websystique.springsecurity.model.Publication;
import com.websystique.springsecurity.model.Utilisateur;
import com.websystique.springsecurity.model.Vote;
 
 
 
public interface UserService {
     
   // Utilisateur findById(long id);
	 void updateUser(Utilisateur user);
	 public void deleteUserById(String username);
	 public void sendmail(Email e);
	public List<Publication> findAllPubs();
	public List<Bill> findAllBills();
	public List<Email> findAllMails();
	public List<Paiement> findAllPays();
	public List<Project> findAllProjects();
	public List<Comment> findAllComments();
    public void AddComment(Comment c); 
    public void addmessage(Message m);
    public void AddBill(Bill b);
    public void vote(Vote v);
    public List<Vote> getVote();
    public Utilisateur findByName(String name);
    public  Project findProject(String id);
    public void saveUtilisateur(Utilisateur user);
    public void savePub(Publication pub);
    public void saveProject(Project p);
    public Paiement findByUserName(String name);
    public void updateUtilisateur(Utilisateur user);
    public  List<Message> getmessage(); 
    public void deleteUtilisateurByusername(Utilisateur u);
 
    public List<Utilisateur> findAllUtilisateurs(); 
     
    public void deleteAllUtilisateurs();
     
    public boolean isUtilisateurExist(Utilisateur user);
    public boolean isDetailsExist(Paiement p);
    public boolean isPubExist(Publication user);
    public boolean isProjectExist(Project p);
     
}
