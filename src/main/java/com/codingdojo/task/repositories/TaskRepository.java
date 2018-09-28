package com.codingdojo.task.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.task.models.Task;
import com.codingdojo.task.models.User;

@Repository
public interface TaskRepository extends CrudRepository<Task, Long>{
	Optional<Task> findById(Long id);
	List<Task> findAll();

}
