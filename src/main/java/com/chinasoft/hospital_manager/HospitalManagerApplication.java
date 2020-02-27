package com.chinasoft.hospital_manager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.chinasoft.hospital_manager.mapper")
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
