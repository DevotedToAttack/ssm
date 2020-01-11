package cn.service;


import cn.domain.Orders;
import cn.domain.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll(Integer page,Integer pageSize) throws Exception;
    void save(Product product) throws Exception;

    List<Product> findString(Integer page, Integer pageSize, String findString) throws Exception;

    void alter(Product product) throws Exception;

    Product findById(String orderId) throws Exception;

    List<Orders> findByIdOrders(Integer page, Integer pageSize,String productId) throws Exception;
}
