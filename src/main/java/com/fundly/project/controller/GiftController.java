package com.fundly.project.controller;

import com.fundly.project.service.GiftService;
import com.fundly.project.service.ItemService;
import com.persistence.dto.GiftDto;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

@Slf4j
@Controller
@RequestMapping("/project")
public class GiftController {
    ItemService itemService;
    GiftService giftService;
    MessageSource messageSource;
//    ObjectMapper objectMapper;

    @Autowired
    GiftController(ItemService itemService, GiftService giftService, MessageSource messageSource) {
        this.itemService = itemService;
        this.giftService = giftService;
        this.messageSource = messageSource;
//        this.objectMapper = new ObjectMapper();
//        this.objectMapper.registerModule(new JavaTimeModule());
    }

    //선물 등록하기
    @PostMapping("/gift")
    @ResponseBody
    public ResponseEntity<?> registerGift(@RequestBody @Valid GiftForm giftForm, BindingResult result, HttpSession session){
        log.error("\n\n giftForm={}\n\n",giftForm);
        String pj_id = "pj1"; //하드코딩. 나중에 바꿔주기
        //String id = (String)session.getAttribute("id");
        String id = "asdf"; //하드코딩. 세션으로부터 id 얻어오는 것으로 바꾸기.
        String gift_id = UUID.randomUUID().toString();
        //GiftRegister시에 Tx로 GiftItemDetailDto에 insert가 함께 발생, 즉 gift_id가 미리 존재해야한다. (ai라면 다시 꺼내기 애매함)

        giftForm.setPj_id(pj_id);
        giftForm.setDba_reg_id(id);
        giftForm.setGift_id(gift_id);
        log.error("\n\n giftForm={}\n\n",giftForm);
        log.error("\n\n bindingResult={} \n\n", result);

        log.error("binding result={}",result);
        log.error("**** error codes ****");
        result.getAllErrors().stream().forEach(
                error -> Arrays.stream(error.getCodes()).forEach(System.out::println)
        ); //어떤 에러코드가 출력되는지

        if(result.hasErrors()){
            //유효성 검사에 실패하면
            ErrorResult errorResult = new ErrorResult(result, messageSource);
            //에러메시지와 함께 400번 에러를 전달
            return new ResponseEntity<>(errorResult, HttpStatus.BAD_REQUEST);
        }

        //toDo
        // 같은 프로젝트에 이미 같은 이름의 선물이 있는지도 검증해야함(사실 아이템도 마찬가지)

        //유효성 검사에 성공한 후의 코드 진행
        try{
            //DB에 gift 등록(insert)
            int rowCnt = giftService.registerGift(giftForm);
            if(rowCnt!=1) { // insert 실패시
                throw new Exception("gift register failed");
            }
            //insert 성공하면
            List<GiftDto> list = giftService.getAllGiftList(pj_id);
            log.error("\n\n list={}\n\n",list);
            return new ResponseEntity<>(list, HttpStatus.OK);
        } catch(Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @InitBinder
    public void dataBind(WebDataBinder binder){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        binder.registerCustomEditor(LocalDateTime.class, new CustomDateEditor(df,false));
        //이건 item이 아니라 gift쪽에서 날짜 입력받을 때 쓰기.

        binder.setValidator(new GiftValidator());
        List<Validator> validatorList = binder.getValidators();
        log.error("validatorList = {}",validatorList);
    }

}