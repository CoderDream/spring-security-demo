package com.cnblogs.yjmyzz.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;

import com.cnblogs.yjmyzz.model.User;
import com.cnblogs.yjmyzz.util.SpringUtil;

public class UserDao {

    private JdbcTemplate jdbcT;

    public void setJdbcT(JdbcTemplate jdbcT) {
        this.jdbcT = jdbcT;
    }

    public List<Map<String, Object>> findALL() {
        String sql = "select * from t_users";
        return jdbcT.queryForList(sql);
    }

    public List<Map<String, Object>> queryAuthoritiesByUsername(String username) {
        String sql = "select d_username username, d_role role from t_user_roles where d_username=?";
        return jdbcT.queryForList(sql, new Object[] { username });
    }

    public List<Map<String, Object>> queryUsersByUsername(String username) {
        String sql = "select d_username username,d_password password, d_enabled enabled from t_users where d_username=?";
        return jdbcT.queryForList(sql, new Object[] { username });
    }

    public List<User> findALLUsers() {
        List<User> Users = new ArrayList<User>();
        String sql = "select * from t_users";
        List<Map<String, Object>> list = jdbcT.queryForList(sql);
        Iterator<Map<String, Object>> iterator = list.iterator();
        User User = null;
        while (iterator.hasNext()) {
            Map<String, Object> map4User = (Map<String, Object>) iterator.next();
            User = new User();
            User.setUsername(((String) map4User.get("d_username")));
            User.setPassword((String) map4User.get("d_password"));
            User.setEnabled((Integer) map4User.get("d_enabled"));
            Users.add(User);
        }
        return Users;
    }

    public int delete(String username) {
        String sql = "delete from t_users where t_username =?";
        return jdbcT.update(sql, new Object[] { username });
    }

    public static void main(String[] args) {
        UserDao dao = (UserDao) SpringUtil.getBean("userDao");
        List<User> Users = dao.findALLUsers();
        for (User User : Users) {
            System.out.println(User.getUsername() + "," + User.getPassword() + "," + User.getEnabled());
        }
        System.out.println("---------------------------------");

        List<Map<String, Object>> list = dao.findALL();
        for (Iterator<Map<String, Object>> it = list.iterator(); it.hasNext();) {
            System.out.println(it.next());
        }
        
        List<Map<String, Object>> list2 = dao.queryAuthoritiesByUsername("yjmyzz");
        for (Iterator<Map<String, Object>> it = list2.iterator(); it.hasNext();) {
            System.out.println(it.next());
        }
        
        List<Map<String, Object>> list3 = dao.queryUsersByUsername("yjmyzz");
        for (Iterator<Map<String, Object>> it = list3.iterator(); it.hasNext();) {
            System.out.println(it.next());
        }
    }
}