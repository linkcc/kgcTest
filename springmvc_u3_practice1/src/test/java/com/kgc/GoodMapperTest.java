package com.kgc;

import com.kgc.dao.GoodMapper;
import com.kgc.entity.Good;
import com.kgc.entity.GoodExample;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @ClassName GoodMapperTest
 * @Author linkcc
 * @Date 2021/1/31 12:17
 * @Description :
 */
public class GoodMapperTest {
    private ApplicationContext app;
    private GoodMapper goodMapper;

    @Before
    public void before() {
        app = new ClassPathXmlApplicationContext("classpath:spring/applicationContext*.xml");
        goodMapper = (GoodMapper) app.getBean("goodMapper", GoodMapper.class);
    }

    @Test
    public void testFindAll(){
        GoodExample goodExample = new GoodExample();
        GoodExample.Criteria criteria = goodExample.createCriteria();
        criteria.andGoodtypeIdEqualTo(1);
        criteria.andGoodNameLike("%"+"1"+"%");
        List<Good> list = goodMapper.selectByExample(goodExample);
        for (Good good : list) {
            System.out.println(good);
        }
    }

    @Test
    public void testFindAll2(){
        Good good = new Good();
        List<Good> list = goodMapper.findAll(good);
        for (Good good1 : list) {
            System.out.println(good1);
        }
    }
}
