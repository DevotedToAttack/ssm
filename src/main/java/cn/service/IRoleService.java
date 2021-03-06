package cn.service;

import cn.domain.Permission;
import cn.domain.Role;

import java.util.List;

public interface IRoleService {
    List<Role> findAll(Integer page,Integer pageSize) throws Exception;

    void save(Role role);

    List<Permission> findOtherPermission(String roleId);

    void addPermissionToRole(String roleId, String[] permissions);

    Role findById(String roleId)throws Exception;

    List<Role> findString(Integer page, Integer pageSize, String findString)throws Exception;
}
