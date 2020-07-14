package com.jxf.wx.api.utils;

import java.util.Map;
import java.util.TreeMap;

import com.jxf.wx.api.message.aes.SHA1;

/***
 * 
 * @类功能说明： 
 * @类修改者： 
 * @修改日期： 
 * @修改说明： 
 * @公司名称：北京金信服科技有限公司
 * @作者：Administrator 
 * @创建时间：2016年10月11日 下午5:09:24 
 * @版本：V1.0
 */
public class JsApiUtil {
    /**
     * 计算 wx.config() 中需要使用的签名。每个页面都需要进行计算
     *
     * @param jsApiTicket 微信 js-sdk提供的ticket
     * @param nonceStr    随机字符串
     * @param timestame   时间戳
     * @param url         当前网页的URL，不包含#及其后面部分
     * @return 合法的签名
     * @throws Exception 获取签名异常
     */
    public static String sign(String jsApiTicket, String nonceStr, long timestame, String url) throws Exception {
        Map<String, String> paramMap = new TreeMap<String, String>();
        paramMap.put("jsapi_ticket", jsApiTicket);
        paramMap.put("noncestr", nonceStr);
        paramMap.put("timestamp", Long.toString(timestame));
        paramMap.put("url", url);

        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : paramMap.entrySet()) {
            sb.append("&").append(entry.toString());
        }
        return SHA1.getSHA1HexString(sb.substring(1));
    }

}