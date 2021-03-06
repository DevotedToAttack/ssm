package cn.controller;

import cn.domain.Orders;
import cn.domain.Product;
import cn.service.IOrdersService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersService ordersService;
    //查询所有订单信息
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name="page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize) throws Exception {
        List<Orders> ordersList=ordersService.findAll(page,pageSize);
        //PageInfo就是一个分页bean
        PageInfo pageInfo=new PageInfo(ordersList);
        for (Orders orders:ordersList) {
            System.out.println(orders.getProduct());
        }
        for (Object object:pageInfo.getList()) {
            Orders orders=(Orders) object;
            System.out.println("ffffff: "+orders.getProduct());
        }
        ModelAndView mv=new ModelAndView();
        mv.addObject("pageInfo",pageInfo);
//        mv.addObject("ordersList",ordersList);
        mv.setViewName("/orders-list");
        return mv;
    }
    //添加订单
    @RequestMapping("/save.do")
    @Secured({"ROLE_admin","ROLE_user"})//设置访问权限
    public String save(Orders orders) throws Exception {
//        ordersService.save(orders);
        return "redirect:findAll.do";
    }
    //通过id查询订单
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name="id",required =true)String orderId) throws Exception {
        ModelAndView mv=new ModelAndView();
        Orders orders=ordersService.findById(orderId);
        mv.setViewName("/orders-show");
        mv.addObject("orders",orders);
        return mv;
    }
    //修改订单信息时的数据查询
    @RequestMapping("/findByIdOnlyOrder.do")
    public ModelAndView findByIdOnlyOrder(@RequestParam(name="id",required =true)String orderId) throws Exception {
        ModelAndView mv=new ModelAndView();
        Orders orders=ordersService.findById(orderId);
        mv.setViewName("/orders-alter");
        mv.addObject("orders",orders);
        return mv;
    }
    //保存修改后的订单信息
    @RequestMapping("/alter.do")
    public String alter(Orders orders) throws Exception {
        System.out.println(orders);
        ordersService.alter(orders);
        return "redirect:findAll.do";
    }
    //模糊查询
    @RequestMapping("/findString.do")
    public ModelAndView findString(@RequestParam(name = "page",required = true,defaultValue ="1")Integer page,
                                   @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize,
                                   @RequestParam(name = "findString",required = true,defaultValue = "")String findString)throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Orders> orders=ordersService.findString(page,pageSize,findString);
        PageInfo pageInfo=new PageInfo(orders);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("orders-list");
        return mv;
    }
    //删除
    @RequestMapping("/delete.do")
    public String delete(@RequestParam(name = "id",required = true) String id) throws Exception {
        ordersService.deleteById(id);
        return "redirect:findAll.do";
    }
}
