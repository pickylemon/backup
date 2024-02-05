//package com.fundly.project.service;
//
//import com.persistence.dto.ItemDto;
//import config.RootContext;
//import config.ServletContext;
//import lombok.SneakyThrows;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.junit.jupiter.api.extension.ExtendWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//
//import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
//
//import java.util.List;
//
//@Slf4j
//@SpringJUnitWebConfig(classes = {RootContext.class, ServletContext.class})
//class ItemServiceImplTest {
//    @Autowired
//    ItemService itemService;
//
//    @SneakyThrows
//    @Test
//    public void getCountTest(){
//        int cnt = itemService.getItemCount("abc1");
//        System.out.println("cnt = " + cnt);
//    }
//
//    @SneakyThrows
//    @Test
//    public void getItemList(){
//        for(int i=1; i<=20; i++){
////            ItemDto itemDto = new ItemDto("abc"+((i%4)+1),getRandomItem(),getRandomColor());
//            ItemDto itemDto = new ItemDto("abc"+i,"손수건","객관식","하늘색");
//            itemService.registerItem(itemDto);
//        }
//
//        List<ItemDto> totalList = itemService.getItemList();
//        List<ItemDto> list = itemService.getItemList("abc3");
//        System.out.println("list = " + list);
//        System.out.println("list.size() = " + list.size());
//        System.out.println("totalList = " + totalList);
//        System.out.println("totalList.size() = " + totalList.size());
//    }
//
//    //데이터 넣을 때 메서드 쓰면 순서가 꼬이는 것 같음...
//    public String getRandomItem(){
//        String[] itemArr = {"손수건","양말","목도리","가방","공책"};
//        int tmp = (int)(Math.random()*itemArr.length);
//        return itemArr[tmp];
//    }
//    public String getRandomColor(){
//        String[] colorArr = {"빨강","노랑","초록","파랑","보라"};
//        int tmp = (int)(Math.random()* colorArr.length);
//        return colorArr[tmp];
//    }
//}