package com.fundly.project.model;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ItemDao {
    int count() throws Exception;

}
