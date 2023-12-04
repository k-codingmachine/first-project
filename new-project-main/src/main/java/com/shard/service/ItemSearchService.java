package com.shard.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shard.domain.ItemVO;
import com.shard.domain.PageVO;

public interface ItemSearchService {

	public List<ItemVO> Search(PageVO pagevo);
	public List<ItemVO> RPrice(PageVO vo);
	public List<ItemVO> HPrice(PageVO vo);
//	public List<ItemVO> Color(@Param("itemName") String itemName);
	public List<ItemVO> ColorWithPaging(String color, PageVO pageVO);
//	public List<ItemVO> Category(@Param("itemName") int categoryNum);
	public List<ItemVO> CategoryWithPaging(int categoryNum, PageVO pageVO);
//	public List<ItemVO> ItemSearch(@Param("itemName") String itemName);
	public List<ItemVO> ItemSearchWithPaging(String itemName, PageVO pageVO);
//	public List<ItemVO> searchWithPaging(PageVO pageVO);
	public int getItemNameCount(String itemName);
	public int getColorCount(String color);
	public int getItemColorCount(String itemName, @Param("color")String color);
	public int getTotalCount();
}
