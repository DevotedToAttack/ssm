package cn.controller;

import cn.domain.Role;
import cn.domain.UserInfo;
import cn.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;
    private static BCryptPasswordEncoder bCryptPasswordEncoder=new BCryptPasswordEncoder();

    /**
     * 给用户添加角色
     * @param userId
     * @param roleId
     * @return
     * @throws Exception
     */
    @RequestMapping("/addRoleToUser.do")
    public String addRoleToUser(@RequestParam(name="id",required = true)String userId,
                              @RequestParam(name = "ids",required = true)String[] roleId)throws Exception{
        userService.addRoleToUser(userId,roleId);
        return "redirect:findAll.do";
    }

    /**
     * 查询用户拥有的角色
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping("/findUserByIdAndAllRole.do")
    public ModelAndView findUserByIdAndAllRole(@RequestParam(name="id",required = true)String userId) throws Exception {
        ModelAndView mv=new ModelAndView();
        //根据用户id查询用户
        UserInfo userInfo=userService.findById(userId);
        //2根据用户id查询可以添加的角色
        List<Role> roles=userService.findOtherRoles(userId);
        mv.addObject("user",userInfo);
        mv.addObject("roleList",roles);
        mv.setViewName("user-role-add");
        return mv;
    }

    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    @Secured({"ROLE_admin","ROLE_user"})//设置访问权限
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(name="pageSize",required = true,defaultValue = "5")Integer pageSize) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<UserInfo> userList=userService.findAll(page,pageSize);
        PageInfo pageInfo=new PageInfo(userList);
        mv.addObject("pageInfo",pageInfo);
//        mv.addObject("userList",userList);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 查询当前用户的详细信息
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById.do")
    public ModelAndView findById(String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        UserInfo user=userService.findById(id);
        mv.addObject("user",user);
        mv.setViewName("user-show");
        return mv;
    }

    //修改订单信息时的数据查询
    @RequestMapping("/findByIdOnlyUser.do")
    public ModelAndView findByIdOnlyOrder(@RequestParam(name="id",required =true)String id) throws Exception {
        ModelAndView mv=new ModelAndView();
        UserInfo userInfo=userService.findById(id);
        mv.addObject("userInfo",userInfo);
        mv.setViewName("/user-alter");
        return mv;
    }
    //保存修改后的订单信息
    @RequestMapping("/alter.do")
    @Secured({"ROLE_admin"})//设置访问权限
    public String alter(UserInfo userInfo) throws Exception {
        System.out.println(userInfo);
        userService.alter(userInfo);
        return "redirect:findAll.do";
    }

    /**
     * 添加用户
     * @param userInfo
     * @return
     */
    @RequestMapping("/save.do")
    @Secured({"ROLE_admin"})//设置访问权限
    public String save(UserInfo userInfo) throws Exception {
        userService.saveUser(userInfo);
        return "redirect:findAll.do";
    }

    /**
     * 对用户信息进行模糊查询
     * @param page
     * @param pageSize
     * @param findString
     * @return
     * @throws Exception
     */
    @RequestMapping("/findString.do")
    public ModelAndView findString(@RequestParam(name = "page",required = true,defaultValue ="1")Integer page,
                                   @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize,
                                   @RequestParam(name = "findString",required = true,defaultValue = "")String findString)throws Exception{
        ModelAndView mv=new ModelAndView();
        List<UserInfo> userInfos=userService.findString(page,pageSize,findString);
        PageInfo pageInfo=new PageInfo(userInfos);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user-list");
        return mv;
    }

    /**
     * 删除选中的用户
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete.do")
    @Secured({"ROLE_admin"})//设置访问权限
    public String delete(@RequestParam(name = "id",required = true) String id) throws Exception {
        userService.deleteById(id);
        return "redirect:findAll.do";
    }
}
