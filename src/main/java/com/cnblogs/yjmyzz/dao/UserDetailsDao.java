package com.cnblogs.yjmyzz.dao;

import com.cnblogs.yjmyzz.model.UserAttempts;

public interface UserDetailsDao {

	void updateFailAttempts(String username);

	void resetFailAttempts(String username);

	UserAttempts getUserAttempts(String username);

}