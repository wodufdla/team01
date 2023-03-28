package com.itkey.service;

import java.util.List;

import com.itkey.pageutil.PageCriteria;
import com.itkey.vo.OrderVO;

public interface OrderService {

	List<OrderVO> read_list(PageCriteria criteria);
	int totalCounts(PageCriteria criteria);
}
