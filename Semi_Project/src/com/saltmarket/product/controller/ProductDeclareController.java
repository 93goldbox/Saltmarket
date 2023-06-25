package com.saltmarket.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.saltmarket.common.MyFileRenamePolicy;
import com.saltmarket.common.model.vo.Declaration;
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.product.model.service.ProductService;

/**
 * Servlet implementation class ProductDeclareController
 */
@WebServlet("/declare.pr")
public class ProductDeclareController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeclareController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;	// 전송 파일 용량 제한
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/declare_upfiles/");
		
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			int userNo = Integer.parseInt(multiRequest.getParameter("uno"));
			int productNo = Integer.parseInt(multiRequest.getParameter("pno"));
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");

			Declaration d = new Declaration();
			d.setUserNo(userNo);
			d.setDeclareType("trade");
			d.setDeclareTitle(title);
			d.setDeclareContent(content);
			
			// 이미지 파일
			ArrayList<ImgFile> list = new ArrayList<>();
			
			for(int i = 1; i <= 3; i++) {
				String key = "file" + i;
				if(multiRequest.getOriginalFileName(key) != null) {
					ImgFile img = new ImgFile();
					img.setOriginName(multiRequest.getOriginalFileName(key));
					img.setChangeFileName(multiRequest.getFilesystemName(key));
					img.setFilePath("resources/declare_upfiles/");
					list.add(img);
				}
			}
			int result = new ProductService().insertDeclare(userNo, d, list);

			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "신고 처리가 완료되었습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.pr?pno=" + productNo);
			} else {
				request.setAttribute("errorMsg", "신고 처리 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}