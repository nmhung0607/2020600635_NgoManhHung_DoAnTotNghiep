package com.DoAn.NgoManhHung.services;
import org.springframework.stereotype.Service;

import com.DoAn.NgoManhHung.model.User;

@Service
public class RegisterService extends BaseService<User>{
	@Override
	protected Class<User> clazz() {
		return User.class;
	}
}
