package com.shop.entitiy.com;

import com.shop.constant.ItemSellStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@SequenceGenerator(
        name="ITEM_SEQ_GEN", //시퀀스 제너레이터 이름
        sequenceName="ITEMSEQ", //오라클에서 만들어둔 시퀀스 이름
        initialValue=100, //시작값
        allocationSize=1 //메모리를 통해 할당할 범위 사이즈
)
@Table(name="shopitem")
@Getter
@Setter
@ToString
public class Item {
    @Id
    @Column(name = "shopId")
    @GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="USER_SEQ_GEN" //식별자 생성기를 설정해놓은  USER_SEQ_GEN으로 설정
    )
    private  Long id;
    @Column(nullable = false, length = 50)
    private String itemNm;
    @Column(name = "price", nullable = false)
    private int price;

    @Column(nullable = false)
    private int stockNumber;
    @Lob
    @Column(nullable = false)
    private String itemDetail;
    @Enumerated(EnumType.STRING)
    private ItemSellStatus itemSellStatus;

    private LocalDateTime regTime;
    private LocalDateTime updateTime;
}
