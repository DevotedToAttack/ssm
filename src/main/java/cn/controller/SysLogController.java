package cn.controller;

import cn.domain.SysLog;
import cn.service.ISysLogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller("sysLogController")
@RequestMapping("/sysLog")
public class SysLogController {
    @Autowired
    ISysLogService sysLogService;

    /**
     * 查询所有日志信息
     * @param page
     * @param pageSize
     * @return
     * @throws Exception
     */
    @RequestMapping("/findAll.do")
    @Secured({"ROLE_admin","ROLE_user"})//设置访问权限
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue ="1")Integer page,
                                @RequestParam(name="pageSize",required = true,defaultValue = "10")Integer pageSize) throws Exception {
        ModelAndView mv=new ModelAndView();
        List<SysLog> sysLogs=sysLogService.findAll(page,pageSize);
        PageInfo pageInfo=new PageInfo(sysLogs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }

    /**
     * 对日志表进行模糊查询
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
        List<SysLog> sysLogs=sysLogService.findString(page,pageSize,findString);
        PageInfo pageInfo=new PageInfo(sysLogs);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
