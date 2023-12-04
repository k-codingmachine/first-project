package com.shard.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shard.domain.ItemVO;
import com.shard.domain.PageResult;
import com.shard.domain.PageVO;
import com.shard.service.ItemSearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@CrossOrigin
@Controller
@RequestMapping("/itemSearch/*")
@Log4j
@RequiredArgsConstructor
public class ItemSearchController {

	private final ItemSearchService service;

//	@GetMapping("/list")
//	public void list(@RequestParam("pageNum") int pageNum, Model model) {
//		System.out.println(pageNum);
//		PageVO vo = new PageVO(pageNum, service.getTotalCount());
//		System.out.println(vo);
//		model.addAttribute("list", service.Search(vo));
//		model.addAttribute("pageMaker", vo);
//	}
	
	
	@GetMapping("/list")
	public void list(
		@RequestParam(name = "itemName", required = false) String itemName,	
		@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
	    @RequestParam(name = "color", required = false) String color,
	    Model model) {
	    System.out.println(pageNum); 
	    // color가 null이 아닌 경우에만 검색 조건을 설정
	    if (color != null) {
	    PageVO vo = new PageVO(pageNum, service.getColorCount(color));
	    model.addAttribute("list", service.ColorWithPaging(color, vo));
	    model.addAttribute("pageMaker", vo);
	    System.out.println("colorSelect >>" + vo);
	    }
	    // itemName이 null이 아닌 경우에만 검색
	    if (itemName != null) {
		    PageVO vo = new PageVO(pageNum, service.getItemNameCount(itemName));
		    List<ItemVO> searchResult = service.ItemSearchWithPaging(itemName, vo);
		    model.addAttribute("list", searchResult);
		    model.addAttribute("pageMaker", vo);
		    model.addAttribute("itemName", itemName);
		    System.out.println("itemNameSelect >>" + vo);
		 
	    }
	    // 그냥 페이지 전체 조회
	    else {
	    PageVO vo = new PageVO(pageNum, service.getTotalCount());
	    System.out.println("vo >>" +vo);
	    
	    model.addAttribute("list", service.Search(vo));
	    model.addAttribute("pageMaker", vo);
	    System.out.println("justSelect >> " + vo);
	   }
}

	
	
	
	

//	@GetMapping("/colorlist")
//	@ResponseBody
//	public ResponseEntity<PageResult<ItemVO>> getColorList(
//	    @RequestParam("color") String color,
//	    @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
//	    @RequestParam(name = "sortType", defaultValue = "") String sortType) {
//
//	    try {
//	        PageVO pageVO = new PageVO(pageNum, service.getItemNameCount(color));
//	        pageVO.setPageNum(pageNum);
//
//	        // 상품 목록과 함께 상품 개수 반환
//	        PageResult<ItemVO> pageResult = new PageResult<>(service.ColorWithPaging(color, pageVO), pageVO.getTotal());
//
//	        // 성공적으로 반환
//	        return ResponseEntity.ok().body(pageResult);
//	    } catch (Exception e) {
//	        // 오류 발생 시 예외 처리
//	        return ResponseEntity.status(500).body(null);
//	    }
//	}
	
//	@GetMapping("/item/category/{num}")
	


//	@GetMapping("/hrpricelist")
//	@ResponseBody
//	public ResponseEntity<List<ItemVO>> getHPriceList(@RequestParam("pageNum") int pageNum, @RequestParam("sortType") String sortType) {
//	    try {
//	        List<ItemVO> productList;
//
//	        if ("높은 가격순".equals(sortType)) {
//	            productList = service.HPrice(new PageVO(pageNum, service.getTotalCount()));
//	        } else if ("낮은 가격순".equals(sortType)) {
//	            productList = service.RPrice(new PageVO(pageNum, service.getTotalCount()));
//	        } else {
//	            productList = service.HPrice(new PageVO(pageNum, service.getTotalCount()));
//	        }
//
//	        // 제품 목록을 성공적으로 반환
//	        return ResponseEntity.ok().body(productList);
//	    } catch (Exception e) {
//	        // 오류 발생 시 예외 처리
//	        return ResponseEntity.status(500).body(null);
//	    }
//	}
	
//	@GetMapping("/searchlist")
//	public String searchlist(@RequestParam(name = "itemName", required = false) String itemName, 
//	                        @RequestParam(name = "pageNum", defaultValue = "1") int pageNum,
//	                        @RequestParam("color") String color,
//	                        Model model) {
//		System.out.println(pageNum);
//	    if (itemName == null) {
//	        return "/itemSearch/nosearch";
//	    }
//
//	    PageVO vo = new PageVO(pageNum, service.getItemNameCount(itemName));
//	    System.out.println(vo);
//	    List<ItemVO> searchResult = service.ItemSearchWithPaging(itemName, vo);
//
//	    if (searchResult.isEmpty()) {
//	        model.addAttribute("pageMaker", vo);
//	        return "/itemSearch/nosearch";
//	    }
//	    
//	    model.addAttribute("list", searchResult);
//	    model.addAttribute("pageMaker", vo);
//	    model.addAttribute("itemName", itemName);
//	    return "/itemSearch/list";
//	}


}



