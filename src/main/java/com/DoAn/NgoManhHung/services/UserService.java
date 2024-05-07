package com.DoAn.NgoManhHung.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.DoAn.NgoManhHung.dto.OderSearchModel;
import com.DoAn.NgoManhHung.dto.UserSearchModel;
import com.DoAn.NgoManhHung.model.Role;
import com.DoAn.NgoManhHung.model.SaleOrder;
import com.DoAn.NgoManhHung.model.User;


@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_user u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	public PagerData<User> search(UserSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_user p WHERE p.status=1";
        
		if (searchModel != null) {
			if(searchModel.getSdt()!= null){
				sql += " and (p.phone  like '%" + searchModel.getSdt() + "%' )";
			
			}
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.username like '%" + searchModel.getKeyword() + "%')";
			}
		}

		// chi lay san pham chua xoa
//           				sql += " and p.status=1 ";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());

	}
	
}
