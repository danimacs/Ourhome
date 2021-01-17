package com.ourhome.controller;

import com.ourhome.dto.Notifications;
import com.ourhome.service.NotificationsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/notifications")
public class NotificationsController {

	@Autowired
	NotificationsServiceImpl notificationsServiceImpl;

	@GetMapping("/{id}")
	public Notifications searchNotification(@PathVariable(name = "id") int id) {
		return notificationsServiceImpl.getNotification(id);
	}

	@GetMapping("/user/{user_id}")
	public List<Notifications> listNotificationByUser(@PathVariable(name = "user_id") int user_id){
		return notificationsServiceImpl.listNotificationByUser(user_id);
	}

	@PostMapping()
	public Notifications saveNotification(@RequestBody Notifications notification) {
		return notificationsServiceImpl.saveNotification(notification);
	}
	
	@DeleteMapping("{id}")
	public void deleteNotification(@PathVariable(name = "id") int id) {
		notificationsServiceImpl.deleteNotification(id);
	}
	
}
