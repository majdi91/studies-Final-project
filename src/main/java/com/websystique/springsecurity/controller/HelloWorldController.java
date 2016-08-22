package com.websystique.springsecurity.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import com.websystique.springsecurity.model.Bill;
import com.websystique.springsecurity.model.Comment;
import com.websystique.springsecurity.model.Email;
import com.websystique.springsecurity.model.FileBucket;
import com.websystique.springsecurity.model.Message;
import com.websystique.springsecurity.model.MultiFileBucket;
import com.websystique.springsecurity.model.Paiement;
import com.websystique.springsecurity.model.Project;
import com.websystique.springsecurity.model.Publication;
import com.websystique.springsecurity.model.Utilisateur;
import com.websystique.springsecurity.model.Vote;
import com.websystique.springsecurity.service.UserService;
import com.websystique.springsecurity.util.FileValidator;
import com.websystique.springsecurity.util.MultiFileValidator;

@Controller
public class HelloWorldController {
	@Autowired
    UserService userService;
	
private static String UPLOAD_LOCATION="C:/Users/Tij/Desktop/test/SpringSecurityRoleBasedLogin/src/main/webapp/static/folder/";
	
	@Autowired
	FileValidator fileValidator;
	

	@Autowired
	MultiFileValidator multiFileValidator;

	
	@InitBinder("fileBucket")
	protected void initBinderFileBucket(WebDataBinder binder) {
	   binder.setValidator(fileValidator);
	}


	@InitBinder("multiFileBucket")
	protected void initBinderMultiFileBucket(WebDataBinder binder) {
	   binder.setValidator(multiFileValidator);
	}

	
	@RequestMapping(value={"/upload",}, method = RequestMethod.GET)
	public String getHomePage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "welcome_upload";
	}

	@RequestMapping(value="/singleUpload_get", method = RequestMethod.GET)
	public String getSingleUploadPage(ModelMap model) {
		FileBucket fileModel = new FileBucket();
		model.addAttribute("fileBucket", fileModel);
		model.addAttribute("user", getPrincipal());
		return "singleFileUploader";
	}

	@RequestMapping(value="/singleUpload", method = RequestMethod.POST)
	public String singleFileUpload(@Valid FileBucket fileBucket, BindingResult result, ModelMap model) throws IOException {

		if (result.hasErrors()) {
			System.out.println("validation errors");
			return "singleFileUploader";
		} else {			
			System.out.println("Fetching file");
			MultipartFile multipartFile = fileBucket.getFile();

			//Now do something with file...
			FileCopyUtils.copy(fileBucket.getFile().getBytes(), new File(UPLOAD_LOCATION + fileBucket.getFile().getOriginalFilename()));
			
			String fileName = multipartFile.getOriginalFilename();
			model.addAttribute("fileName", fileName);
			return "success";
		}
	}

	
	@RequestMapping(value="/multiUpload", method = RequestMethod.GET)
	public String getMultiUploadPage(ModelMap model) {
		MultiFileBucket filesModel = new MultiFileBucket();
		model.addAttribute("multiFileBucket", filesModel);
		model.addAttribute("user", getPrincipal());
		return "multiFileUploader";
	}

	@RequestMapping(value="/multiUpload", method = RequestMethod.POST)
	public String multiFileUpload(@Valid MultiFileBucket multiFileBucket, BindingResult result, ModelMap model) throws IOException {

		
		if (result.hasErrors()) {
			System.out.println("validation errors in multi upload");
			return "multiFileUploader";
		} else {			
			System.out.println("Fetching files");
			List<String> fileNames= new ArrayList<String>();
			
			//Now do something with file...
			for(FileBucket bucket : multiFileBucket.getFiles()){
				FileCopyUtils.copy(bucket.getFile().getBytes(), new File(UPLOAD_LOCATION + bucket.getFile().getOriginalFilename()));
				fileNames.add(bucket.getFile().getOriginalFilename());
			}
			
			model.addAttribute("fileNames", fileNames);
			return "multiSuccess";
		}
	}
	//------------------Payments ------------------------------
	@RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ResponseEntity<List<Paiement>> listAllpays() {
        List<Paiement> users = userService.findAllPays();
        if(users.isEmpty()){
            return new ResponseEntity<List<Paiement>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Paiement>>(users, HttpStatus.OK);
    }
	//------------------vote ------------------------------
			@PreAuthorize("hasRole('syndic') and hasRole('proprietaire')and hasRole('locataire')")
			@RequestMapping(value = "/vote/", method = RequestMethod.POST)
		    public ResponseEntity<Void> voting(@RequestBody Vote v,    UriComponentsBuilder ucBuilder) {
		        System.out.println("Voting! " );
		        userService.vote(v);
		        HttpHeaders headers = new HttpHeaders();
		        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/vote/").buildAndExpand(v.getProject_id()).toUri());
		        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
		    }
	
	//------------------add comment ------------------------------
		@PreAuthorize("hasRole('syndic') and hasRole('proprietaire')and hasRole('locataire')")
		@RequestMapping(value = "/project/comment/", method = RequestMethod.POST)
	    public ResponseEntity<Void> addcomment(@RequestBody Comment c,    UriComponentsBuilder ucBuilder) {
	        System.out.println("Creating comment! " );
	        userService.AddComment(c);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/project/comment/").buildAndExpand(c.getTxt()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
		//------------------add bill ------------------------------
				@PreAuthorize("hasRole('syndic') and hasRole('proprietaire')and hasRole('locataire')")
				@RequestMapping(value = "/add_bill/", method = RequestMethod.POST)
			    public ResponseEntity<Void> addbill(@RequestBody Bill b,    UriComponentsBuilder ucBuilder) {
			        System.out.println("Creating a bill! " );
			        userService.AddBill(b);
			        HttpHeaders headers = new HttpHeaders();
			        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/add_bill/").buildAndExpand(b.getId()).toUri());
			        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
			    }
	//-----------------------create project -----------------------
	@RequestMapping(value = "/project/add/", method = RequestMethod.POST)
    public ResponseEntity<Void> createproject(@RequestBody Project p,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating Project " + p.getTitre());
        userService.saveProject(p);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/project/add/{id}").buildAndExpand(p.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
	//----------------------------send email----------------------------------------
	
		@RequestMapping(value = "/email/", method = RequestMethod.POST)
	    public ResponseEntity<Void> send(@RequestBody Email em,    UriComponentsBuilder ucBuilder) {
	        System.out.println("Saving email " + em.getObject());
	        userService.sendmail(em);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/send/").buildAndExpand(em.getObject()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
	//-----------------------chat -----------------------
		@RequestMapping(value = "/chat/message/", method = RequestMethod.POST)
	    public ResponseEntity<Void> chat(@RequestBody Message m,    UriComponentsBuilder ucBuilder) {
	        System.out.println("adding message! " );
	        userService.addmessage(m);
	        HttpHeaders headers = new HttpHeaders();
	        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/message/").buildAndExpand(m.getTxt()).toUri());
	        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	    }
		//-----------------------chat -----------------------
				@RequestMapping(value = "/sms/", method = RequestMethod.GET)
			    public ResponseEntity<List<Message>>  chat_sms() {
			        System.out.println("Getting messages! " );
			        List<Message> users = userService.getmessage();
			        return new ResponseEntity<List<Message>>(users, HttpStatus.OK);
			    }
	//---------------------Create pub-----------------------------
	@RequestMapping(value = "/ann/add/", method = RequestMethod.POST)
    public ResponseEntity<Void> createAnn(@RequestBody Publication pub,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating annonce " + pub.getTitre());
  
        if (userService.isPubExist(pub)) {
            System.out.println("A anounce with name " + pub.getTitre() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
  
        userService.savePub(pub);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/pub/add/{id}").buildAndExpand(pub.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
	//-------------------Create a User--------------------------------------------------------
	@RequestMapping(value = "/user/", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody Utilisateur user,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating User " + user.getUsername());
  
        if (userService.isUtilisateurExist(user)) {
            System.out.println("A User with name " + user.getUsername() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
  
        userService.saveUtilisateur(user);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("SpringSecurityRoleBasedLoginExample/user/add/{username}").buildAndExpand(user.getUsername()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
	//-------------------------Update User----------------------------------------------------------
	@RequestMapping(value = "/update/{username}", method = RequestMethod.PUT)
    public ResponseEntity<Utilisateur> updateUtilisateur(@PathVariable("username") String username, @RequestBody Utilisateur Utilisateur) {
        System.out.println("Updating Utilisateur " + username);   
        userService.updateUtilisateur(Utilisateur);
        System.out.println("Utilisateur with id " + username + " Updated!");
        return new ResponseEntity<Utilisateur>(Utilisateur, HttpStatus.OK);
    }
 
	//-------------------Retrieve Single User--------------------------------------------------------
	@RequestMapping(value = "/admin/edit/{username}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Utilisateur> getUser(@PathVariable("username") String username) {
        System.out.println("Fetching User with id " + username);
        Utilisateur user = userService.findByName(username);
        if (user == null) {
            System.out.println("User with id " + username + " not found");
            return new ResponseEntity<Utilisateur>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Utilisateur>(user, HttpStatus.OK);
    }
	//-------------------Retrieve details--------------------------------------------------------
		@RequestMapping(value = "/details/{username}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	    public ResponseEntity<Paiement> getDetails(@PathVariable("username") String username) {
	        System.out.println("Fetching Details of " + username);
	        Paiement p = userService.findByUserName(username);
	        if (p == null) {
	            System.out.println("details of " + username + " not found");
	            return new ResponseEntity<Paiement>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<Paiement>(p, HttpStatus.OK);
	    }
	//--------------------find a project ----------------------------------------

		@RequestMapping(value = "/details/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	    public ResponseEntity<Project> getProject(@PathVariable("id") String id) {
	        System.out.println("Fetching project with id " + id);
	        Project p = userService.findProject(id);
	        if (p == null) {
	            System.out.println("project with id " + id + " not found");
	            return new ResponseEntity<Project>(HttpStatus.NOT_FOUND);
	        }
	        return new ResponseEntity<Project>(p, HttpStatus.OK);
	    }
	//--------------------all users--------------------------------------------------
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	    public ResponseEntity<List<Utilisateur>> listAllUsers() {
	        List<Utilisateur> users = userService.findAllUtilisateurs();
	        if(users.isEmpty()){
	            return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	        }
	        return new ResponseEntity<List<Utilisateur>>(users, HttpStatus.OK);
	    }
	//--------------------all Mails--------------------------------------------------
		@RequestMapping(value = "/mails", method = RequestMethod.GET)
		    public ResponseEntity<List<Email>> listAllMails() {
		        List<Email> m = userService.findAllMails();
		        if(m.isEmpty()){
		            return new ResponseEntity<List<Email>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		        }
		        return new ResponseEntity<List<Email>>(m, HttpStatus.OK);
		    }
	//--------------------all bills--------------------------------------------------
		@RequestMapping(value = "/bills", method = RequestMethod.GET)
		    public ResponseEntity<List<Bill>> listAllBills() {
		        List<Bill> bills = userService.findAllBills();
		        if(bills.isEmpty()){
		            return new ResponseEntity<List<Bill>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		        }
		        return new ResponseEntity<List<Bill>>(bills, HttpStatus.OK);
		    }
	//-------------------all votes--------------------------------------------
		@RequestMapping(value = "/getvotes/", method = RequestMethod.GET)
	    public ResponseEntity<List<Vote>> listAllVotes() {
	        List<Vote> c = userService.getVote();
	        if(c.isEmpty()){
	            return new ResponseEntity<List<Vote>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	        }
	        return new ResponseEntity<List<Vote>>(c, HttpStatus.OK);
	    }
	//-------------------all comments--------------------------------------------
	@RequestMapping(value = "/comments", method = RequestMethod.GET)
    public ResponseEntity<List<Comment>> listAllComments() {
        List<Comment> c = userService.findAllComments();
        if(c.isEmpty()){
            return new ResponseEntity<List<Comment>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Comment>>(c, HttpStatus.OK);
    }
	//--------------------all pubs--------------------------------------------------
		@RequestMapping(value = "/annonces/", method = RequestMethod.GET)
		    public ResponseEntity<List<Publication>> listAllPubs() {
		        List<Publication> pubs = userService.findAllPubs();
		        if(pubs.isEmpty()){
		            return new ResponseEntity<List<Publication>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		        }
		        return new ResponseEntity<List<Publication>>(pubs, HttpStatus.OK);
		    }
		
		//--------------------all projects--------------------------------------------------
				@RequestMapping(value = "/project/", method = RequestMethod.GET)
				    public ResponseEntity<List<Project>> listAllProjects() {
				        List<Project> pubs = userService.findAllProjects();
				        if(pubs.isEmpty()){
				            return new ResponseEntity<List<Project>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
				        }
				        return new ResponseEntity<List<Project>>(pubs, HttpStatus.OK);
				    }
				
	//------------------- Delete a User --------------------------------------------------------
	 @PreAuthorize("hasRole('syndic')")
	    @RequestMapping(value = "/delete/{username}", method = RequestMethod.DELETE)
	 public ResponseEntity<Utilisateur> deleteUser(@PathVariable("username") String username) {
	        System.out.println("Fetching & Deleting User with id " + username);
	  
	        Utilisateur user = userService.findByName(username);
	        
	        if (user == null) {
	            System.out.println("Unable to delete. User with id " + username + " not found");
	            return new ResponseEntity<Utilisateur>(HttpStatus.NOT_FOUND);
	        }
	  
	        userService.deleteUtilisateurByusername(user);
	        return new ResponseEntity<Utilisateur>(HttpStatus.NO_CONTENT);
	    }
	  
//	 @RequestMapping(value = { "/home" }, method = RequestMethod.GET)
//		public String homePage(ModelMap model) {
//			model.addAttribute("user", getPrincipal());
//			return "home";
//		}
	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String welcomePage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "welcome";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "admin";
	}
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chatPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "chat";
	}
	
	@RequestMapping(value = "/db", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "dba";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null){    
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}

	public   String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}