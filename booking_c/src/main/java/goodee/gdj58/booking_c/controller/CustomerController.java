package goodee.gdj58.booking_c.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import goodee.gdj58.booking_c.service.CustomerService;
import goodee.gdj58.booking_c.util.FontColor;
import goodee.gdj58.booking_c.vo.Customer;
import goodee.gdj58.booking_c.vo.CustomerImg;
import goodee.gdj58.booking_c.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 고객 회원가입
	@GetMapping("/customer/addCustomer")
	public String addCustomer() {
		return "customer/addCustomer";
	}
	@PostMapping("/customer/addCustomer")
	public String addCustomer(Model model, Customer customer, TotalId totalId, CustomerImg customerImg, @RequestParam("file") MultipartFile file) {	
		
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		String fileKind = file.getContentType(); // kind
		long size = file.getSize(); // 파일 사이즈
		
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "${pageContext.request.contextPath}/view/upload";
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		int row = customerService.insertCustomer(customer);
		log.debug("\u001B[36m"+row+"<--row값");
		log.debug("\u001B[36m"+fileRealName+"<--fileRealName값");
		log.debug("\u001B[36m"+fileKind+"<--fileKind값");
		log.debug("\u001B[36m"+size+"<--size값");
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템 에러로 등록 실패");
			return "customer/addCustomer";
		}
		return "/customer/testPage";
	}
	
	//에약업체 세부사항 공통 + 홈 내용
	@GetMapping("/customer/booking/bookingCompanyDetailHome")
	public String bookingCompanyDetailHome(Model model
										, @RequestParam(value = "bkcId") String bkcId
										, @RequestParam(value = "bkciLevel", defaultValue = "") String bkciLevel) 
	{
		List<Map<String, Object>> bookingCompanyDetailCommon = customerService.getBookingCompanyDetailCommon(bkcId, bkciLevel);
		List<Map<String, Object>> bookingCompanyDetailHome = customerService.getBookingCompanyDetailHome(bkcId);
		//홈 내용 추가 예정
		model.addAttribute("bookingCompanyDetailCommon",bookingCompanyDetailCommon);
		model.addAttribute("bookingCompanyDetailHome",bookingCompanyDetailHome);
		model.addAttribute("bkcId",bkcId);
		model.addAttribute("bkciLevel",bkciLevel);
		
		return "customer/booking/bookingCompanyDetailHome";
	}
	
	
	//예약업체 리스트 출력
	@GetMapping("/customer/booking/bookingCompanyList")
	public String getBookingCompanyList(Model model
										, @RequestParam(value = "searchWord", defaultValue = "") String searchWord 
										, @RequestParam(value = "optionWord", defaultValue = "") String optionWord 
										, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
										, @RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage
										)
	{
		
		int firstPage = 1;
		int totalCount = customerService.bookingCompanyCount(searchWord);
		int lastPage = totalCount / rowPerPage;
		if(totalCount % rowPerPage != 0)
		{
			lastPage = lastPage+1;
		}
		List<Map<String, Object>> bookingCompanyList = customerService.getBookingCompanyList(currentPage, rowPerPage, searchWord, optionWord);
		
		model.addAttribute("bookingCompanyList",bookingCompanyList );
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("firstPage",firstPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("searchWord",searchWord);
		model.addAttribute("optionWord",optionWord);
		return "customer/booking/bookingCompanyList";
	}
}
