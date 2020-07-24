package com.yinhai;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@ServletComponentScan
@SpringBootApplication  //(exclude = DataSourceAutoConfiguration.class)
@EnableTransactionManagement
@EnableAsync
@EnableScheduling
@ImportResource({"classpath:app-context.xml"})
public class StartsystemApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(StartsystemApplication.class);
        try {
            application.run(args);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}