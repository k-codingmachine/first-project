package com.shop.repository;

import com.shop.constant.ItemSellStatus;
import com.shop.entitiy.com.Item;
import org.hibernate.cache.spi.support.AbstractReadWriteAccess;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

import java.time.LocalDateTime;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
@TestPropertySource(locations = "classpath:application.properties")
class ItemRepositoryTest {
    @Autowired
    ItemRepository itemRepository;

    @Test
    @DisplayName("상품 저장 테스트")
    public void createItemTest(){
        Item item = new Item();
        item.setItemNm("테스트 상품");
        item.setPrice(10000);
        item.setItemDetail("테스트 상품 상세 설명");
        item.setItemSellStatus(ItemSellStatus.SELL);
        item.setStockNumber(100);
        item.setRegTime(LocalDateTime.now());
        item.setUpdateTime(LocalDateTime.now());
        Item savedItem = itemRepository.save(item);
        System.out.println(savedItem.toString());
    }

    @Test
    @DisplayName("상품 저장 테스트")
    public void findItemTest(){
        //   createItemTest();
        List<Item> items =  itemRepository.findAll();
        System.out.println("============================");
        System.out.println(items.get(0).toString());

        List<Item> items2 = itemRepository.findByStockNumber(0);
        System.out.println("============================");
        System.out.println(items2.get(0).toString());

        System.out.println("전체 자료의 개수" + itemRepository.count());
    }

}
