package com.fundly.project.controller;

import com.fundly.project.service.ItemService;
import com.fundly.project.service.ItemServiceImpl;
import com.persistence.dto.ItemDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/project")
public class ProjectController {
    @Autowired
    ItemServiceImpl itemService;

    @GetMapping("/reward")
    public String makeGift(){
        //itemService로부터 itemDtoList를 꺼내와서 뷰에 전달함
        //뷰단에서는 itemDtoList가 empty면 보여줄 화면과 empty가 아니면 보여줄 화면이 나뉨.

        return "project/reward";
    }
    @PostMapping("/item")
    @ResponseBody
    public ResponseEntity<ItemDto> makeItem(@RequestBody ItemDto itemDto){
        System.out.println("itemDto = " + itemDto);

        return new ResponseEntity<>(itemDto, HttpStatus.OK);

    }
}
