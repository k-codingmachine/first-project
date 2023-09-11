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
