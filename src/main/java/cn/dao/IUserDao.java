package cn.dao;

import cn.domain.Role;
import cn.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("userDao")
public interface IUserDao {
    @Select("select * from users where username=#{username}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,
                    many=@Many(select = "cn.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findByUsername(String username)throws UsernameNotFoundException;

    @Select("select * from users")
    List<UserInfo> findAll() throws Exception;

    @Insert("Insert into users (email,username,password,phoneNum,status) values(#{email},#{username},#{password},#{phoneNum},#{status})")
    void saveUser(UserInfo userInfo)throws Exception;

    @Select("select * from users where id=#{userId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "email",column = "email"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = java.util.List.class,
                    many=@Many(select = "cn.dao.IRoleDao.findRoleByUserId"))
    })
    UserInfo findById(String userId)throws Exception;

    @Select("select * from role where id not in(select roleId from users_role where userId=#{userId})")
    List<Role> findOtherRoles(String userId)throws Exception;

    @Insert("insert into users_role (userId,roleId) values(#{userId},#{roleId})")
    void addRoleToUser(@Param("userId")String userId, @Param("roleId")String roleId);

    @Select("select * from users where id like '%${findString}%'" +
            " or email like '%${findString}%'" +
            " or username like '%${findString}%'" +
            " or PASSWORD like '%${findString}%'" +
            " or phoneNum like '%${findString}%'" +
            " or STATUS like '%${findString}%'")
    List<UserInfo> findString(@Param("findString") String findString)throws Exception;

    @Delete("delete from users where id=#{userId}")
    void delete(String userId)throws Exception;

    @Update("update users set email=#{email},username=#{username},password=#{password},phoneNum=#{phoneNum},status=#{status} where id=#{id}")
    void alter(UserInfo userInfo)throws Exception;
}
