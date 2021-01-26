package com.kgc;

import com.kgc.dao.PostinfoMapper;
import com.kgc.entity.Postinfo;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression.DateTime;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * @ClassName PostinfoMapperTest
 * @Author linkcc
 * @Date 2021/1/24 14:33
 * @Description :
 */
public class PostinfoMapperTest {
    private ApplicationContext app;
    private PostinfoMapper postinfoMapper;

    @Before
    public void before() {
        app = new ClassPathXmlApplicationContext("classpath:spring/applicationContext*.xml");
        postinfoMapper = (PostinfoMapper) app.getBean("postinfoMapper", PostinfoMapper.class);
    }

    @Test
    public void testFindAll(){
        Postinfo postinfo = new Postinfo();
        List<Postinfo> all = postinfoMapper.findAll(postinfo);
        for (Postinfo postinfo1 : all) {
            System.out.println(postinfo1);
        }
    }

    @Test
    public void testInsert(){
        Postinfo postinfo = new Postinfo();
        postinfo.setPosttime(new Date("2017/12/21 20:13:14"));
        postinfo.setTitle("B11223");
        postinfo.setTopicid(1);
        postinfoMapper.insertSelective(postinfo);
    }
}
