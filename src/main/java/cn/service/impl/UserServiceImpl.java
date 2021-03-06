package cn.service.impl;

import cn.dao.IUserDao;
import cn.domain.Role;
import cn.domain.UserInfo;
import cn.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service("userService")
public class UserServiceImpl implements IUserService, UserDetailsService {
    @Autowired
    private IUserDao userDao;
    //不调试的时候用这个
//    @Autowired
//    private BCryptPasswordEncoder bCryptPasswordEncoder;
    //调试的时候用这个
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();

    public UserDetails loadUserByUsername(String username)throws UsernameNotFoundException {
        UserInfo userInfo=userDao.findByUsername(username);
        User user=new User(userInfo.getUsername(),
                userInfo.getPassword(),
                userInfo.getStatus()==0 ? false: true,
                true,true,
                true,getAuthority(userInfo.getRoles()));
        return user;
    }
    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list=new ArrayList<>();
        for (Role role:roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }

    public List<UserInfo> findAll(Integer page,Integer pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return userDao.findAll();
    }

    public UserInfo findByUsername(String username){
        return userDao.findByUsername(username);
    }

    public void saveUser(UserInfo userInfo)throws Exception{
        //对密码进行加密
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.saveUser(userInfo);
    }

    @Override
    public UserInfo findById(String userId) throws Exception{
        return userDao.findById(userId);
    }

    @Override
    public List<Role> findOtherRoles(String userId) throws Exception{
        return userDao.findOtherRoles(userId);
    }

    @Override
    public void addRoleToUser(String userId, String[] roleIds) {
        for (String roleId:roleIds) {
            userDao.addRoleToUser(userId,roleId);
        }
    }

    @Override
    public List<UserInfo> findString(Integer page, Integer pageSize, String findString) throws Exception {
        PageHelper.startPage(page,pageSize);
        return userDao.findString(findString);
    }

    @Override
    public void deleteById(String userId) throws Exception {
        userDao.delete(userId);
    }

    @Override
    public void alter(UserInfo userInfo) throws Exception {
        //对密码进行加密
        userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
        userDao.alter(userInfo);
    }
}
