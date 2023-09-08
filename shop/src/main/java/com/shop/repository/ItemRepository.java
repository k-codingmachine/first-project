package com.shop.repository;

import com.shop.entitiy.com.Item;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {
    public List<Item> findByItemNm(String itemNm);

    public List<Item> findByStockNumber(int stockNumber);
}
