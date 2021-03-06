package com.jxf.cms.service;

import com.jxf.cms.entity.CmsAdPosition;
import com.jxf.svc.sys.crud.service.CrudService;

/**
 * 广告位置Service
 * @author JINXINFU
 * @version 2016-04-25
 */
public interface CmsAdPositionService extends CrudService<CmsAdPosition> {

	/**
	 * 
	 * 函数功能说明 
	 * HUOJIABAO  2016年6月16日 
	 * 修改者名字 修改日期 
	 * 修改内容 
	 * @参数： @param positionNo
	 * @参数： @return     
	 * @return ShopAdPosition    
	 * @throws
	 */
	CmsAdPosition getByPositionNo(String positionNo, boolean useCache);
	
}