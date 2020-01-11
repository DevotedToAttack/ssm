package cn.service.impl;

import cn.dao.IOrdersDao;
import cn.dao.IProductDao;
import cn.domain.Orders;
import cn.domain.Product;
import cn.service.IProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("productService")
@Transactional//添加事务
public class ProductServiceImpl implements IProductService {
    @Autowired
    private IProductDao productDao;
    @Autowired
    private IOrdersDao ordersDao;

    public void save(Product product) throws Exception {
        productDao.save(product);
    }

    public List<Product> findAll(Integer page,Integer pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return productDao.findAll();
    }

    @Override
    public List<Product> findString(Integer page, Integer pageSize, String findString) throws Exception {
        PageHelper.startPage(page,pageSize);
        return productDao.findString(findString);
    }

    @Override
    public void alter(Product product) throws Exception {
        productDao.alter(product);
    }

    @Override
    public Product findById(String productId) throws Exception {
        return productDao.findById(productId);
    }

    @Override
    public List<Orders> findByIdOrders(Integer page, Integer pageSize,String productId) throws Exception {
        PageHelper.startPage(page,pageSize);
        return ordersDao.findByproductIdOrders(productId);
    }
}
