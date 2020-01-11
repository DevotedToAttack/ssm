package cn.service;


import cn.domain.Orders;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ordersService")
public interface IOrdersService {
    List<Orders> findAll(Integer page,Integer pageSize) throws Exception;

    List<Orders> findAllByPage(Integer page,Integer pageSize) throws Exception;

    Orders findById(String ordersId) throws Exception;
    //模糊查询
    List<Orders> findString(Integer page, Integer pageSize, String findString)throws Exception;

    void deleteById(String id)throws Exception;

    void alter(Orders orders)throws Exception;
}
