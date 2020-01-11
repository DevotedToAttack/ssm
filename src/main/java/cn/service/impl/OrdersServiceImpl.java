package cn.service.impl;

import cn.dao.IOrdersDao;
import cn.domain.Orders;
import cn.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("ordersService")
@Transactional//添加事务
public class OrdersServiceImpl implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;

    public List<Orders> findAll(Integer page,Integer pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return ordersDao.findAll();
    }

    public List<Orders> findAllByPage(Integer page,Integer pageSize) throws Exception {
        return ordersDao.findAllByPage(page,pageSize);
    }

    public Orders findById(String ordersId) throws Exception {
        return ordersDao.findById(ordersId);
    }

    @Override
    public List<Orders> findString(Integer page, Integer pageSize, String findString) throws Exception {
        PageHelper.startPage(page,pageSize);
        return ordersDao.findString(findString);
    }

    @Override
    public void deleteById(String id) throws Exception {
        ordersDao.deleteById(id);
    }

    @Override
    public void alter(Orders orders) throws Exception {
        ordersDao.alter(orders);
    }
}
