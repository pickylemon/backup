package com.persistence.dto;


import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor //기본생성자 꼭 필요(맵핑)
@Builder
public class ItemDto {
    private Integer item_id;
    private String pj_id;
    private String item_name;
    private String item_option_type;
    private String item_option;
    private LocalDateTime item_reg_dtm;
    private LocalDateTime dba_reg_dtm;
    private String dba_reg_id;
    private LocalDateTime dba_mod_dtm;
    private String dba_mod_id;

    public ItemDto(String pj_id, String item_name, String item_option_type, String item_option){
        this.pj_id = pj_id;
        this.item_name = item_name;
        this.item_option_type = item_option_type;
        this.item_option = item_option;
    }
    public ItemDto(String pj_id, String item_name, String item_option_type){
        this.pj_id = pj_id;
        this.item_name = item_name;
        this.item_option_type = item_option_type;
    }

    @Override
    public String toString() {
        return "ItemDto{" +
                "item_id=" + item_id +
                ", pj_id='" + pj_id + '\'' +
                ", item_name='" + item_name + '\'' +
                ", item_option_type='" + item_option_type + '\'' +
                ", item_option='" + item_option + '\'' +
                ", item_reg_dtm=" + item_reg_dtm +
                ", dba_reg_dtm=" + dba_reg_dtm +
                ", dba_reg_id='" + dba_reg_id + '\'' +
                ", dba_mod_dtm=" + dba_mod_dtm +
                ", dba_mod_id='" + dba_mod_id + '\'' +
                '}';
    }
}
