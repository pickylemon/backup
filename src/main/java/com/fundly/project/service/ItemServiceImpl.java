package com.fundly.project.service;

import com.fundly.project.model.ItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService{
    @Autowired
    ItemDao itemDao;

    @Override
    public int getItemCount() throws Exception {
        return itemDao.count();
    }
}
