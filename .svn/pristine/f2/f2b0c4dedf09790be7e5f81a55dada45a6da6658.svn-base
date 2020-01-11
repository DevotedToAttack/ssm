package cn.dao;

import cn.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("sysLogDao")
public interface ISysLogDao {
    @Insert("insert into syslog(visitTime,username,ip,url,executionTime,method) values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void save(SysLog sysLog) throws Exception;

    @Select("select * from sysLog")
    List<SysLog> findAll()throws Exception;

    @Select("select * from sysLog where id like '%${findString}%'" +
            " or visitTime like '%${findString}%'" +
            " or username like '%${findString}%'" +
            " or ip like '%${findString}%'" +
            " or url like '%${findString}%'" +
            " or executionTime like '%${findString}%'" +
            " or method like '%${findString}%'")
    List<SysLog> findString(@Param("findString") String findString)throws Exception;
}
