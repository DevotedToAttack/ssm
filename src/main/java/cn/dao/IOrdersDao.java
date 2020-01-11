package cn.dao;

import cn.domain.Member;
import cn.domain.Orders;
import cn.domain.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersDao")
public interface IOrdersDao {
    @Select("select * from orders")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product",javaType = Product.class,
                    one = @One(select = "cn.dao.IProductDao.findById"))
    })
    List<Orders> findAll()throws Exception;

    @Select("select * from orders where id=#{ordersId}")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product",javaType = Product.class,
                    one = @One(select = "cn.dao.IProductDao.findById")),
            @Result(column = "memberId",property = "member",javaType = Member.class,
                    one = @One(select = "cn.dao.IMemberDao.findById")),
            @Result(column = "id",property = "travellers",javaType = List.class,
                    many = @Many(select = "cn.dao.ITravellerDao.findByOrdersId"))
    })
    Orders findById(String ordersId) throws Exception;

    @Select("select * from orders limit #{page},#{pageSize}")
    List<Orders> findAllByPage(@Param("page")Integer page,@Param("pageSize")Integer pageSize) throws Exception;

    @Select("select * from orders where id like '%${findString}%' " +
            "or orderNum like '%${findString}%' " +
            "or orderTime like '%${findString}%' " +
            "or peopleCount like '%${findString}%' " +
            "or orderDesc like '%${findString}%' " +
            "or payType like '%${findString}%' " +
            "or orderStatus like '%${findString}%' " +
            "or productId like '%${findString}%' " +
            "or memberId like '%${findString}%'")
    List<Orders> findString(@Param("findString") String findString)throws Exception;

    @Delete("delete from orders where id=#{userId}")
    void deleteById(String id)throws Exception;

    //,paytype=#{payType},orderstatus=#{orderStatus}
    @Update("update orders set ordernum=#{orderNum},peoplecount=#{peopleCount},orderdesc=#{orderDesc} where id=#{id}")
    void alter(Orders orders)throws Exception;

    //根据productId查询订单信息，支付者信息，游客信息
    @Select("select * from orders where productId=#{productId}")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "memberId",property = "member",javaType = Member.class,
                    one = @One(select = "cn.dao.IMemberDao.findById")),
            @Result(column = "id",property = "travellers",javaType = List.class,
                    many = @Many(select = "cn.dao.ITravellerDao.findByOrdersId"))
    })
    List<Orders> findByProductIdOrders(String productId);

    //通过productId查询订单
    @Select("select * from orders where productId=#{productId}")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product",javaType = Product.class,
                    one = @One(select = "cn.dao.IProductDao.findById"))
    })
    List<Orders> findByproductIdOrders(String productId);
}
