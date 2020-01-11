package cn.dao;

import cn.domain.Permission;
import cn.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Repository("roleDao")
public interface IRoleDao {
    @Select("select * from role where id in(select roleId from users_role where userId=#{id})")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,
                    many = @Many(select = "cn.dao.IPermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByUserId(String id)throws Exception;

    @Select("select * from role")
    List<Role> findAll() throws Exception;
    @Insert("insert into role (roleName,roleDesc) values (#{roleName},#{roleDesc})")
    void save(Role role);

    @Insert("insert into role_permission (roleId,permissionId) values(#{roleId},#{permissionId})")
    void addPermissionToRole(@Param("roleId")String roleId,@Param("permissionId")String permissionId);

    @Select("select * from permission where id not in (select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermission(String roleId);

    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "roleName",column = "roleName"),
            @Result(property = "roleDesc",column = "roleDesc"),
            @Result(property = "permissions",column = "id",javaType = java.util.List.class,
                    many = @Many(select = "cn.dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(String roleId)throws Exception;

    @Select("select * from role where id like '%${findString}%'" +
            " or roleName like '%${findString}%'" +
            " or roleDesc like '%${findString}%'")
    List<Role> findString(@Param("findString") String findString)throws Exception;
}
