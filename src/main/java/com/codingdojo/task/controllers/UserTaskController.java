package com.codingdojo.task.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.task.models.Task;
import com.codingdojo.task.models.User;
import com.codingdojo.task.services.TaskService;
import com.codingdojo.task.services.UserService;
@Controller
public class UserTaskController {
	private final UserService uS;
	private final TaskService tS;

	
	public UserTaskController(UserService uS, TaskService tS) {
		this.uS=uS;
		this.tS=tS;

	}
	@GetMapping("/users")
	public String showRegister(@ModelAttribute("user") User user, HttpSession session) {
		session.invalidate();
		return "register.jsp";
	}
	@PostMapping("/users")
	public String register(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			return "register.jsp";
	} else {

		if(!user.getPassword().equals(user.getConfirm())) {
			model.addAttribute("userError", "password not match");
			return "register.jsp";
		} else {
			String pw= BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(pw);
			User exists = uS.findByEmail(user.getEmail());
			
			if (exists != null) {
				model.addAttribute("userError", "user already exist");
				return "register.jsp";
			}else {
				User u=uS.create(user);
				session.setAttribute("user", u.getId());
				return "redirect:/users/dashboard";
			}
		}
	}
	}
	@PostMapping("/users/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
		User u = uS.findByEmail(email);
		if (u == null) {
			model.addAttribute("loginError", "The email doesnt exist");
			model.addAttribute("user",new User());
			return "register.jsp";
		} else {
			boolean matches=BCrypt.checkpw(password, u.getPassword());
			if (matches) {
				session.setAttribute("user", u.getId());
				return "redirect:/users/dashboard";
			} else {
				model.addAttribute("loginError", "Password does not match");
				model.addAttribute("user",new User());
				return "register.jsp";
			}
		}
		
	}
	@GetMapping("/users/dashboard")
	public String dashboard(Model model, HttpSession session) {
		System.out.println("in dashboard");
		Long id = (Long)session.getAttribute("user");
		if(id == null) {
			return "redirect:/users";
		}else {
			User u = uS.findById(id);
			model.addAttribute("user", u);
			ArrayList<Task> task=tS.findall();
			model.addAttribute("task", task);
			return "dashboard.jsp";
		}
	}
	@GetMapping("/users/{id}/task/new")
	public String createTask(@ModelAttribute("task") Task task, @PathVariable ("id") Long id, Model model,  HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/users/login";
		} else {
			User u= uS.findById(id);
			model.addAttribute("user", u);
			ArrayList<User> users=uS.findAll();
			model.addAttribute("all", users);
			return "newTask.jsp";
		}
	}
	@PostMapping("/users/{id}/task/new")
	public String createTask(@Valid @ModelAttribute("task") Task task, BindingResult res, @PathVariable ("id") Long id, Model model, HttpSession session) {
		if(res.hasErrors()) {
			System.out.println("in show1");
			ArrayList<User> users=uS.findAll();
			model.addAttribute("all", users);
			return "newTask.jsp";
		}else {
			ArrayList<User> users=uS.findAll();
			model.addAttribute("all", users);
			long user_id = (long)session.getAttribute("user");
			User user = uS.findById(user_id);
			Task t=tS.createTask(new Task(user, task.getTaskName(), task.getAssignee(), task.getPriority()));
			System.out.println("in task");
			return "redirect:/users/dashboard";
		}
		
	}

	@GetMapping("/users/task/{id}")
	public String show(@PathVariable ("id") Long id, Model model, HttpSession session) {
		System.out.println("in show1");
		Long userId = (Long) session.getAttribute("user");
		if(userId == null) {
			System.out.println("in show3");
			return "redirect:/users/dashboard";
		} else {	
			System.out.println("in show2");
			Task t = tS.findTask(id);
			User u = uS.findById(userId);
			model.addAttribute("task", t);
			System.out.println("in show");
			if(t.getCreator().getId()==u.getId()) {
				t.setDisabled(true);	
			}
			if(t.getAssignee().getId()==u.getId()) {
				t.setComplete(true);
			}
			
			return "showTask.jsp";
		}
		
	}
	@GetMapping("/users/task/{id}/edit")
	public String update(@PathVariable ("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("user");
		if (userId != null) {
			Task t = tS.findTask(id);
			User u = uS.findById(userId);
			if(t.getCreator().getId()==u.getId()) {
				model.addAttribute("task", t);
				ArrayList<User> users=uS.findAll();
				model.addAttribute("all", users);
				return "editTask.jsp";
			}
			return "redirect:/users/task/{id}";
		}
		return "redirect:/users/task/{id}";
	}
	@PutMapping("/users/task/{id}/edit")
	public String update(@Valid @ModelAttribute("task") Task task, BindingResult res, @PathVariable ("id") Long id, Model model, HttpSession session) {
		long user_id = (long)session.getAttribute("user");
		if(res.hasErrors()) {
			System.out.println(res);
			
			User u = uS.findById(user_id);
			
			ArrayList<User> users=uS.findAll();
			model.addAttribute("all", users);
			return "editTask.jsp";
			
		}
//		long user_id = (long)session.getAttribute("user");
		User currentUser = uS.findById(user_id);
		if(currentUser == null) {
			session.invalidate();
			return "redirect:/users/login";
		}
		task.setCreator(currentUser);
		tS.update(task);
		return "redirect:/users/dashboard";
	}

	
	@PostMapping("/users/task/{id}/delete")
	public String delete(@ModelAttribute("task") Task task, BindingResult result, @PathVariable(value="id") Long id) {
		if (result.hasErrors()) {
			System.out.println("in delete");
			return "redirect:/users/task/{id}";
			
		}else {
			tS.destroy(id);
			return "redirect:/users/dashboard";
		}
	}

	
}
