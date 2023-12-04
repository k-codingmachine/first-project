package com.shard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shard.domain.ItemVO;
import com.shard.domain.PageVO;

public interface ItemSearchMapper {

	public List<ItemVO> getSearchAll(PageVO vo);
	public List<ItemVO> getRPrice(PageVO vo);
	public List<ItemVO> getHPrice(PageVO vo);
//	public List<ItemVO> getColor(PageVO pageVO);
	public List<ItemVO> ColorWithPaging(@Param("color")String color,@Param("vo") PageVO vo);
	public List<ItemVO> getCategory(PageVO pageVO);
	public List<ItemVO> CategoryWithPaging(int categoryNum, PageVO pageVO);
//	public List<ItemVO> getItemSearch(PageVO pageVO);
	public List<ItemVO> getItemSearchWithPaging(@Param("itemName") String itemName, @Param("vo")PageVO pageVO);
	public List<ItemVO> getSearchAllWithPaging(PageVO pagevo);
	public int getItemNameCount(@Param("itemName")String itemName);
	public int getColorCount(@Param("color")String color);
	public int getItemColorCount(@Param("itemName") String itemName, @Param("color")String color);
	public int getTotalCount();	

}
