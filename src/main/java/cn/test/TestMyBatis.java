package cn.test;

import cn.dao.AccountDao;
import cn.domain.Account;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class TestMyBatis {
    @Test
    public void run1() throws IOException {
        InputStream in=Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactory factory= new SqlSessionFactoryBuilder().build(in);
        SqlSession session=factory.openSession();
        AccountDao accountDao=session.getMapper(AccountDao.class);
        List<Account> accounts=accountDao.findAll();
        for (Account account:accounts) {
            System.out.println(account);
        }
        session.commit();
        session.close();
        in.close();
    }
}
