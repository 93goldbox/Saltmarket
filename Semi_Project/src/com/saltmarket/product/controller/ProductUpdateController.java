package com.saltmarket.product.controller;

import static com.saltmarket.common.JDBCTemplate.close;
import static com.saltmarket.common.JDBCTemplate.getConnection;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
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
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.product.model.dao.ProductRegistrationDao;
import com.saltmarket.product.model.service.ProductRegistrationService;
import com.saltmarket.product.model.service.ProductService;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class ProductUpdateController
 */
@WebServlet("/ProductUpdate.pr")
public class ProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateController() {
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
					int productNo = Integer.parseInt(multiRequest.getParameter("productNo"));
					String productName = multiRequest.getParameter("productName");
					int categoryNo = Integer.parseInt(multiRequest.getParameter("category"));
					int regionNo = Integer.parseInt(multiRequest.getParameter("region"));
					int price = Integer.parseInt(multiRequest.getParameter("price"));
					String description = multiRequest.getParameter("description");
					String productStatus = multiRequest.getParameter("productStatus");
		
					// Product로 가공
					Product p = new Product();
					p.setProductNo(productNo);
					p.setProductName(productName);
					p.setCategoryNo(categoryNo);
					p.setRegionNo(regionNo);
					p.setPrice(price);
					p.setDescription(description);
					p.setProductStatus(productStatus);
					
					// ImgFile은 첨부파일이 있다면 insert 없다면 insert 안함
					
					// 첨부파일 객체(배열) null 값으로 초기화
					
					// 첨부파일이 있다면 그때 객체(배열) 생성
					// => 원본명, 수정명, 폴더경로, 썸네일 여부 뽑아서 필드에 담아두기
					
					ImgFile img = null;
					img = new ImgFile();
					
					img.setOriginName(multiRequest.getOriginalFileName("reUpFile1"));
					img.setChangeFileName(multiRequest.getFilesystemName("reUpFile1"));
					img.setFilePath("resources/product_upfiles/");
					// 기본 파일의 파일 번호, 새로운 파일의 원본명, 수정명, 저장경로
					
					img.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
					
					
					// 4. 서비스 요청 후 결과 받기 (p, 이미지 객체(배열) 둘다 넘김)
					int result = new ProductRegistrationService().updateProduct(p, img);
				
					//  결과에 따른 응답페이지 지정
					
					if (result > 0) { // 성공 
						
						// 성공 alert 메세지
						request.getSession().setAttribute("alertMsg", "매물 수정에 성공했습니다.");
						
						// 성공 이후 넘어갈 페이지
						response.sendRedirect(request.getContextPath());
						
					} else { // 실패 => 에러페이지로 포워딩
						
						// 실패 alert 메세지
						request.setAttribute("errorMsg", "매물 수정에 실패했습니다.");
						
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
