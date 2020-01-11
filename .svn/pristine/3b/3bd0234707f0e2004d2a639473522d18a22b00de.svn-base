package cn.dao;

import cn.domain.Member;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("memberDao")
public interface IMemberDao {
    @Select("select * from member")
    public List<Member> findAll() throws Exception;
    @Select("select * from member where id=#{id}")
    public Member findById(String id) throws Exception;
}
