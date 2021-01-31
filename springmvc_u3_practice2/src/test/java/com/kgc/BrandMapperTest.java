package com.kgc;

import com.kgc.dao.BrandMapper;
import com.kgc.entity.Brand;
import com.kgc.entity.BrandExample;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @ClassName BrandMapperTest
 * @Author linkcc
 * @Date 2021/1/31 17:15
 * @Description :
 */
public class BrandMapperTest {
    private ApplicationContext app;
    private BrandMapper brandMapper;

    @Before
    public void before() {
        app = new ClassPathXmlApplicationContext("classpath:spring/applicationContext*.xml");
        brandMapper = (BrandMapper) app.getBean("brandMapper", BrandMapper.class);
    }

    @Test
    public void testFindAll(){
        BrandExample brandExample = new BrandExample();
        BrandExample.Criteria criteria = brandExample.createCriteria();
        List<Brand> list = brandMapper.selectByExample(brandExample);
        for (Brand brand : list) {
            System.out.println(brand);
        }
    }
}
