package com.fundly.project.service;

import config.RootContext;
import config.ServletContext;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;

import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

@Slf4j
@SpringJUnitWebConfig(classes = {RootContext.class, ServletContext.class})
class ItemServiceImplTest {
    @Autowired
    ItemService itemService;

    @SneakyThrows
    @Test
    public void getCountTest(){
        int cnt = itemService.getItemCount();
        System.out.println("cnt = " + cnt);

    }

}