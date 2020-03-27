package com.chinasoft.hospital_manager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//方式1：这个是采用的是xml方式，这个扫描的是mapper的代理类
@MapperScan("com.chinasoft.hospital_manager.mapper")
//方法2：这个是将这个dao层里面的代理类与这个xml文件，合成为一个文件，直接采用注解的方式@select，@delete方式
//直接在dao层的函数上书写这个业务逻辑的sql语句，传递参数的时候可以利用这个@param注解
//@MapperScan("com.chinasoft.hospital_manager.dao")
public class HospitalManagerApplication {


 /*   这个是启动类：这个是原理
    这个按照@MapperScan("com.chinasoft.hospital_manager.mapper")这个参数去把mapper加载到内存里面
    同时在xml文件里面利用application.yml文件，去把xml文件加载到内存里面
    mybatis:
    type-aliases-package: com.chinasoft.hospital_manager.domain
    mapper-locations:classpath:mapper/admin/login/*.xml,mapper/admin/employee/*.xml
    然后这个两个文件又有连接的参数，所以在controller层到service层，到mapper层，也就是dao层
    */


    public static void main(String[] args) {
        SpringApplication.run(HospitalManagerApplication.class, args);
    }

}
