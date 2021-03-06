package com.jxf.svc.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.util.UriUtils;

import com.jxf.svc.config.Global;


/**
 * 查看CK上传的图片
 * @author jxf
 * @version 1.0 2015-07-10
 */
public class UserfilesDownloadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Logger logger = LoggerFactory.getLogger(getClass());

	public void fileOutputStream(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String filepath = req.getRequestURI();
		int index = filepath.indexOf(Global.CKFINDER_UPLOAD_BASE_URL);
		if(index >= 0) {
			filepath = filepath.substring(index + Global.CKFINDER_UPLOAD_BASE_URL.length());
		}
		filepath = UriUtils.decode(filepath, "UTF-8");
		File file = new File(Global.getBaseStaticPath() + Global.CKFINDER_UPLOAD_BASE_URL + filepath);
		try {
			FileCopyUtils.copy(new FileInputStream(file), resp.getOutputStream());
			resp.setHeader("Content-Type", "application/octet-stream");
			return;
		} catch (FileNotFoundException e) {
			req.setAttribute("exception", new FileNotFoundException("请求的文件不存在"));
			req.getRequestDispatcher("/WEB-INF/views/admin/error/404.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		fileOutputStream(req, resp);
	}
}
