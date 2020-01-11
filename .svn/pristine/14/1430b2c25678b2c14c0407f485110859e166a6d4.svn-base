package cn.controller;

import cn.domain.Orders;
import cn.domain.Product;
import cn.service.IProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;

    //查询全部产品信息
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name="page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Product> products=productService.findAll(page,pageSize);
        PageInfo pageInfo=new PageInfo(products);
        mv.addObject("pageInfo",pageInfo);
//        mv.addObject("productList",products);
        mv.setViewName("product-list");
        return mv;
    }

    //保存修改
    @RequestMapping("/alter.do")
    public String alter(Product product) throws Exception {
        productService.alter(product);
        return "redirect:findAll.do";
    }

    //产品添加
    @RequestMapping("/save.do")
    @Secured({"ROLE_ADMIN","ROLE_USER"})//设置访问权限
    public String save(Product product) throws Exception {
        productService.save(product);
        return "redirect:findAll.do";
    }

    //根据id查询产品详情
    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(name="page",required = true,defaultValue = "0")Integer page,
                                 @RequestParam(name="pageSize",required = true,defaultValue = "5")Integer pageSize,
                                 @RequestParam(name="id",required =true)String productId) throws Exception {
        ModelAndView mv=new ModelAndView();

        List<Orders> orders=productService.findByIdOrders(page,pageSize,productId);
        PageInfo pageInfo=new PageInfo(orders);

        Product product=productService.findById(productId);

        mv.setViewName("/product-show");
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("product",product);
        return mv;
    }

    //根据id查询要修改的产品信息
    @RequestMapping("/findByIdAlter.do")
    public ModelAndView findByIdOnlyOrder(@RequestParam(name="id",required =true)String productId) throws Exception {
        ModelAndView mv=new ModelAndView();
        Product product=productService.findById(productId);
        mv.setViewName("/product-alter");
        mv.addObject("product",product);
        return mv;
    }

    //根据id查询产品对应的所有订单信息
    @RequestMapping("/findByIdOrders.do")
    public ModelAndView findByIdOrders(@RequestParam(name="page",required = true,defaultValue = "1")Integer page,
                                       @RequestParam(name="pageSize",required = true,defaultValue = "5")Integer pageSize,
                                       @RequestParam(name="id",required =true)String productId) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Orders> orders=productService.findByIdOrders(page,pageSize,productId);
        PageInfo pageInfo=new PageInfo(orders);
        mv.setViewName("/product-orders");
        mv.addObject("pageInfo",pageInfo);
        return mv;
    }

    //对产品进行模糊查询
    @RequestMapping("/findString.do")
    public ModelAndView findString(@RequestParam(name = "page",required = true,defaultValue ="1")Integer page,
                                   @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize,
                                   @RequestParam(name = "findString",required = true,defaultValue = "")String findString)throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Product> products=productService.findString(page,pageSize,findString);
        PageInfo pageInfo=new PageInfo(products);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-list");
        return mv;
    }
}
