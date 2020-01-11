package cn.service.impl;

import cn.dao.IPermissionDao;
import cn.domain.Permission;
import cn.service.IPermissionService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("permissionSerivce")
public class PermissionServiceImpl implements IPermissionService{
    @Autowired
    private IPermissionDao permissionDao;

    public List<Permission> findAll(Integer page,Integer pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception {
        permissionDao.save(permission);
    }

    @Override
    public Permission findById(String permissionId)  throws Exception{
        return permissionDao.findById(permissionId);
    }

    @Override
    public List<Permission> findString(Integer page, Integer pageSize, String findString) throws Exception {
        PageHelper.startPage(page,pageSize);
        return permissionDao.findString(findString);
    }
}
