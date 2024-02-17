//package com.fundly.project.service;
//
//import com.persistence.dto.GiftDto;
//import config.RootContext;
//import config.ServletContext;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
//
//import java.math.BigInteger;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//
//@Slf4j
//@SpringJUnitWebConfig(classes = {RootContext.class, ServletContext.class})
//class GiftServiceImplTest {
//    @Autowired
//    GiftService giftService;
//
//    @SneakyThrows
//    @Test
//    @DisplayName("선물 등록")
//    void registerGift() {
//        GiftDto giftDto = new GiftDto("pj1","itm3",1,
//                "선물세트A","Y",350,5,
//                "20240310","Y",BigInteger.valueOf(36000),
//                0,350,"판매중","창작자1");
//
//        int rowCnt = giftService.registerGift(giftDto);
//        assertEquals(1,rowCnt);
//    }
//
//    @SneakyThrows
//    @Test
//    void getGift() {
//
//    }
//}