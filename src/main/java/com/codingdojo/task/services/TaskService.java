package com.codingdojo.task.services;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.codingdojo.task.models.Task;
import com.codingdojo.task.repositories.TaskRepository;
@Service
public class TaskService {
	private final TaskRepository rep;
	public TaskService(TaskRepository rep) {
		this.rep=rep;
	}
	public Task createTask(Task task) {
		return rep.save(task);
	}
	public ArrayList<Task> findall(){
		return (ArrayList<Task>) rep.findAll();
	}
	public Task findTask(Long id) {
		return rep.findById(id).get();
	}
	public Task update( Task task){
		return rep.save( task);
	}
	
	public void destroy(Long id) {
		rep.deleteById(id);
	}

}
