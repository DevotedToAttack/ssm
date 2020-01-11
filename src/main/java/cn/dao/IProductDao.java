package cn.dao;

import cn.domain.Orders;
import cn.domain.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("productDao")
public interface IProductDao {
    //查询所有的产品信息
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    @Select("select * from product where id =#{productId}")
    @Results({
            @Result(id=true,property = "id",column = "id"),
            @Result(property = "productNum",column = "productNum"),
            @Result(property = "productName",column = "productName"),
            @Result(property = "cityName",column = "cityName"),
            @Result(property = "departureTime",column = "departureTime"),
            @Result(property = "productPrice",column = "productPrice"),
            @Result(property = "productDesc",column = "productDesc"),
            @Result(property = "productStatus",column = "productStatus"),
            @Result(property = "orders",column = "id",javaType = java.util.List.class,
                    many=@Many(select = "cn.dao.IOrdersDao.findByProductIdOrders"))
    })
    Product findById(String productId) throws Exception;

    @Insert("insert into product(productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus)values(#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);

    @Select("select * from product where id like '%${findString}%'" +
            " or productNum like '%${findString}%'" +
            " or productName like '%${findString}%'" +
            " or cityName like '%${findString}%'" +
            " or DepartureTime like '%${findString}%'" +
            " or productPrice like '%${findString}%'" +
            " or productDesc like '%${findString}%'" +
            " or productStatus like '%${findString}%'")
    List<Product> findString(@Param("findString") String findString)throws Exception;

    @Update("update product set productNum=#{productNum},productName=#{productName},cityName=#{cityName},DepartureTime=#{departureTime}," +
            "productPrice=#{productPrice},productDesc=#{productDesc},productStatus=#{productStatus} where id=#{id}")
    void alter(Product product);
}
