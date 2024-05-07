package com.DoAn.NgoManhHung.services;
import org.springframework.stereotype.Service;

import com.DoAn.NgoManhHung.model.Role;
import com.DoAn.NgoManhHung.model.User;

@Service
public class RegisterService extends BaseService<User>{
	@Override
	protected Class<User> clazz() {
		return User.class;
	}
	public void registerNewUser(User user) {
        user.setUsername(user.getUsername());
        user.setPassword(user.getPassword());
        user.setEmail(user.getEmail());
        
        // Lấy vai trò "GUEST" từ cơ sở dữ liệu
        Role guestRole = getDefaultRole();
        
        // Thêm vai trò "GUEST" vào danh sách vai trò của người dùng
        user.addRoles(guestRole);
      
    }
	private Role getDefaultRole() {
        // Thực hiện truy vấn để lấy vai trò "GUEST" từ cơ sở dữ liệu
        return entityManager.createQuery("SELECT r FROM Role r WHERE r.name = :name", Role.class)
                            .setParameter("name", "GUEST")
                            .getSingleResult();
    }
}
