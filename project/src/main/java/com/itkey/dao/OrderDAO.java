package com.itkey.dao;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;

public interface OrderDAO {

	List<OrderVO> select_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);
}
