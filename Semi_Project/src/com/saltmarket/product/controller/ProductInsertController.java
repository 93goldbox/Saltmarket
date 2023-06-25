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
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.product.model.service.ProductRegistrationService;
import com.saltmarket.product.model.vo.Product;

import oracle.net.aso.b;

/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/productInsert.pr")
public class ProductInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 0. 인코딩 설정
		request.setCharacterEncoding("UTF-8");
				
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1-1. 전송파일 용량 제한
			int maxSize = 10 * 1024 * 1024;
			
			// 1-2. 저장할 상품 이미지 파일의 서버의 실제 폴더 경로 지정
			String savePath = request.getSession().getServletContext().getRealPath("/resources/product_upfiles/");
			
			// 2. 전달된 파일명 수정 
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. 요청 시 전달값 뽑기
			// 정보 뽑기
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String productName = multiRequest.getParameter("productName");
			int categoryNo = Integer.parseInt(multiRequest.getParameter("category"));
			int regionNo = Integer.parseInt(multiRequest.getParameter("region"));
			int price = Integer.parseInt(multiRequest.getParameter("price"));
			String description = multiRequest.getParameter("description");

			// Product로 가공
			Product p = new Product();
			p.setUserNo(userNo);
			p.setProductName(productName);
			p.setCategoryNo(categoryNo);
			p.setRegionNo(regionNo);
			p.setPrice(price);
			p.setDescription(description);
			
			// ImgFile은 첨부파일이 있다면 insert 없다면 insert 안함
			
			// 첨부파일 객체(배열) null 값으로 초기화
			
			// 첨부파일이 있다면 그때 객체(배열) 생성
			// => 원본명, 수정명, 폴더경로, 썸네일 여부 뽑아서 필드에 담아두기
			
			ImgFile img = new ImgFile();
			
					// 첨부파일이 존재할 경우 
					// ImgFile 객체 생성
					// + 원본명, 수정명, 폴더 경로, 파일레벨 필드 셋팅
					// => list 에 add
					
			img.setOriginName(multiRequest.getOriginalFileName("file1"));
			img.setChangeFileName(multiRequest.getFilesystemName("file1"));
			img.setFilePath("resources/product_upfiles/");
			img.setFileLevel(1);
			

			// 4. 서비스 요청 후 결과 받기 (p, 이미지 객체(배열) 둘다 넘김)
			int result = new ProductRegistrationService().insertProduct(p, img);
		
			//  결과에 따른 응답페이지 지정
			
			if (result > 0) { // 성공 
				
				// 성공 alert 메세지
				request.getSession().setAttribute("alertMsg", "매물 등록에 성공했습니다.");
				
				// 성공 이후 넘어갈 페이지
				response.sendRedirect(request.getContextPath());
				
			} else { // 실패 => 에러페이지로 포워딩
				
				// 실패 alert 메세지
				request.setAttribute("errorMsg", "매물 등록에 실패했습니다.");
				
				// 실패한 이후 넘어갈 페이지
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
