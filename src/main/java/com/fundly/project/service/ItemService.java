package com.fundly.project.service;

import com.fundly.project.model.ItemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface ItemService {
    public int getItemCount() throws Exception;
}
