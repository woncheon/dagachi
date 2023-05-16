package com.sbs.dagachi.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.dagachi.service.FavPhoneService;
import com.sbs.dagachi.service.MemberService;
import com.sbs.dagachi.service.Phone_Book_Service;
import com.sbs.dagachi.vo.FavPhoneVO;
import com.sbs.dagachi.vo.Member;
import com.sbs.dagachi.vo.Phone_BookVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class Phone_Book_Controller {

	private Phone_Book_Service phone_Book_Service;
	private MemberService memberService;
	private FavPhoneService favPhoneService;
	
	public Phone_Book_Controller(Phone_Book_Service phone_Book_Service,MemberService memberService, FavPhoneService favPhoneService) {
		this.phone_Book_Service = phone_Book_Service;
		this.memberService=memberService;
		this.favPhoneService=favPhoneService;
		
	}

	
	
	@RequestMapping("dagachi/phoneBook/showList")
	public String showList(String searchType, String keyword,
			String phone_book_type, String phone_book_register,Model model,@RequestParam(defaultValue = "1") int page) {
		
		//페이지네이션
		int typeInt=Integer.parseInt(phone_book_type);
		int phoneBookCount=phone_Book_Service.getPhoneBookCount(searchType,keyword,typeInt,phone_book_register);
		int itemsCountInAPage=10;
		int pagesCount=(int)Math.ceil((double)phoneBookCount/itemsCountInAPage);
		//리스트 출력 용
		List<Phone_BookVO>list=phone_Book_Service.getPhoneBookList(searchType, keyword, typeInt, phone_book_register,itemsCountInAPage, page);
		
		
		
		
		
		//즐겨찾기 등록 되있나 안되있나 확인용
		List<FavPhoneVO>favCheckList=favPhoneService.getFavApp(phone_book_register);
		List<Integer>favIdList=new ArrayList<Integer>();
		
		for(FavPhoneVO fav: favCheckList) {
			int favId=fav.getPhone_Book_Id();
			favIdList.add(favId);
		}
		System.out.println(list.size());
		System.out.println(favIdList);
		System.out.println(page);
		
		System.out.println(phoneBookCount);
		model.addAttribute("favIdList", favIdList);
		model.addAttribute("favCheckList", favCheckList);
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("phoneBookCount",phoneBookCount);
		model.addAttribute("phoneBookList",list);
		model.addAttribute("phoneBookType", phone_book_type);
		
		
		return "phoneBook/shareList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("dagachi/phoneBook/companyPhoneBookList")
	public String showCompanyPhoneBookList(Model model) {
		List<Member>companyPhoneBookList=memberService.getMember();
		model.addAttribute("companyPhoneBookList",companyPhoneBookList);
		return "phoneBook/companyPhoneBookList";
	}

	@RequestMapping("dagachi/phoneBook/companyPhoneBookDetail")
	public String showDetail(String member_id,Model model) {
		Member phoneBook=memberService.getMemberById(member_id);
		model.addAttribute("phoneBook",phoneBook);
		return "phoneBook/companyPhoneDetail";
		
	}
	@RequestMapping("dagachi/phoneBook/detail")
	public String showDetail(int phone_Book_Id,Model model) {
		Phone_BookVO phoneBook=phone_Book_Service.getPhoneBookDetail(phone_Book_Id);
		
		String phones=phoneBook.getPhone_Book_Phone();
		String[]phoneArr=phones.split("-");
		if(phoneArr.length==3){
			
			model.addAttribute("phone1",phoneArr[0]);
			model.addAttribute("phone2",phoneArr[1]);
			model.addAttribute("phone3",phoneArr[2]);
		}
		
		
		String emails=phoneBook.getPhone_Book_Email();
		String[]emailArr=emails.split("@");
		if(emailArr.length==2){
			model.addAttribute("email1",emailArr[0]);
			model.addAttribute("email2",emailArr[1]);
		}
		
		model.addAttribute("phoneBook",phoneBook);
		
		

		
		return "phoneBook/detail";
		
	}

	@RequestMapping("dagachi/phoneBook/liid")
	@ResponseBody
	public int liid() {
		return phone_Book_Service.getLastInsertId();
	}


	@RequestMapping("dagachi/phoneBook/regist")
	public String registPhone_Book(String phone_Book_Name, String phone_Book_Email, String phone_Book_Phone,
			String phone_Book_Company, String phone_Book_Tag, String phone_Book_Fax, String phone_Book_Dep,
			String phone_Book_Rank, String phone_Book_Address, String phone_Book_Web, String phone_Book_Register,
			@RequestParam(defaultValue = "1")String phone_Book_Type,HttpServletRequest req, Model model) {
		
		
		HttpSession session=req.getSession();
//		Member member=(Member)session.getAttribute("");
//		String phone_Book_Register=member.getMember_id();
		
		//로그인 세션 받으면 지워랑

		
		int phone_Book_Type2=Integer.parseInt(phone_Book_Type);
		
		phone_Book_Service.registPhone_Book(phone_Book_Name, phone_Book_Email, phone_Book_Phone,
				phone_Book_Company, phone_Book_Tag, phone_Book_Fax, phone_Book_Dep,
				phone_Book_Rank, phone_Book_Address, phone_Book_Web,
				phone_Book_Register, phone_Book_Type2);
			
			model.addAttribute("phone_book_type", phone_Book_Type2);
			model.addAttribute("phone_book_register", phone_Book_Register);
			return "phoneBook/registSuccess";
	}
	
	@RequestMapping("dagachi/phoneBook/registForm")
	public String showPhoneBookRegistForm(Model model,String phone_book_register) {
		List<String>tags=phone_Book_Service.getTagList();
		model.addAttribute("tags",tags);
		model.addAttribute("phone_book_register", phone_book_register);
		return "phoneBook/regist";
	}
	
	
	
	@RequestMapping("dagachi/phoneBook/modifyForm")
	public String showPhoneBookModifyForm(int phone_Book_Id, String phone_Book_Register, Model model) {
		Phone_BookVO phoneBook=phone_Book_Service.getPhoneBookDetail(phone_Book_Id);
		
		List<String>tags=phone_Book_Service.getTagList();
		model.addAttribute("tags",tags);
		
		String phones=phoneBook.getPhone_Book_Phone();
		String[]phoneArr=phones.split("-");
		if(phoneArr.length==3){
			
			model.addAttribute("phone1",phoneArr[0]);
			model.addAttribute("phone2",phoneArr[1]);
			model.addAttribute("phone3",phoneArr[2]);
		}
		
		
		String emails=phoneBook.getPhone_Book_Email();
		String[]emailArr=emails.split("@");
		if(emailArr.length==2){
			model.addAttribute("email1",emailArr[0]);
			model.addAttribute("email2",emailArr[1]);
		}
		
		String addedTags=phoneBook.getPhone_Book_Tag();
		if(addedTags.contains(",")) {
		String[]addedTagArr=addedTags.split(",");
		List<String>addedTagList=Arrays.asList(addedTagArr);
		model.addAttribute("addedTag", addedTagList);
		}
		model.addAttribute("addedTag", addedTags);
		
		
		model.addAttribute("phone_Book_register", phone_Book_Register);
		model.addAttribute("phoneBook",phoneBook);
		return "phoneBook/modify";
	}

	
	@RequestMapping("dagachi/phoneBook/modify")
	public String modifyPhone_Book(String phone_Book_Id, String phone_Book_Name, String phone_Book_Email, String phone_Book_Phone,
			String phone_Book_Company, String phone_Book_Tag, String phone_Book_Fax, String phone_Book_Dep,
			String phone_Book_Team, String phone_Book_Rank, String phone_Book_Address, String phone_Book_Web,
			String phone_Book_Register, String phone_Book_Type,Model model) {
		
		int phoneBookId=Integer.parseInt(phone_Book_Id);


		
		int phone_Book_Type2=Integer.parseInt(phone_Book_Type);
			
		phone_Book_Service.modifyPhone_Book(phoneBookId, phone_Book_Name, phone_Book_Email, phone_Book_Phone,
		  		phone_Book_Company, phone_Book_Tag, phone_Book_Fax, phone_Book_Dep,
				phone_Book_Team, phone_Book_Rank, phone_Book_Address, phone_Book_Web,
				phone_Book_Register, phone_Book_Type2);
	
		model.addAttribute("register", phone_Book_Register);	



		return "phoneBook/modifySuccess";
	}
	
	@RequestMapping("dagachi/phoneBook/moveTrash")
	public void moveTrashPhone_Book(int phone_Book_Id) {
		phone_Book_Service.moveTrashPhone_Book(phone_Book_Id);
		
	}
	
	@RequestMapping("dagachi/phoneBook/moveTrashCb")
	public String moveTrashCb(String[]checkedIdArr, String phoneBookType, String register, String searchType, String keyword,
			@RequestParam(defaultValue = "1")int page, Model model) {
		for(int i=0;i<checkedIdArr.length;i++) {
			int checkedId=Integer.parseInt(checkedIdArr[i]);
			phone_Book_Service.moveTrashPhone_Book(checkedId);
		}
		if(register==null) {
			register="";
		}
		
		int phone_book_type=Integer.parseInt(phoneBookType);
		
		int phoneBookCount=phone_Book_Service.getPhoneBookCount(searchType,keyword,phone_book_type,register);
		int itemsCountInAPage=10;
		int pagesCount=(int)Math.ceil((double)phoneBookCount/itemsCountInAPage);
		
		List<Phone_BookVO>list=phone_Book_Service.getPhoneBookList(searchType, keyword, phone_book_type, register,itemsCountInAPage, page);
		
		model.addAttribute("phoneBookList", list);
		
		
		
		return "phoneBook/ResultTable";
	}
	
	
	@RequestMapping("dagachi/phoneBook/recoveryPhoneBook")
	public String recoveryPhoneBook(String[] phone_Book_Id, String phone_Book_Type,Model model, String register, String searchType, String keyword,
			@RequestParam(defaultValue = "1")int page) {
		for(int i=0;i<phone_Book_Id.length;i++) {
			int phoneBookId= Integer.parseInt(phone_Book_Id[i]);
			phone_Book_Service.modifyType(phoneBookId, phone_Book_Type);
		}
		int phone_book_type=Integer.parseInt(phone_Book_Type);
		
		int phoneBookCount=phone_Book_Service.getPhoneBookCount(searchType,keyword,phone_book_type,register);
		int itemsCountInAPage=10;
		int pagesCount=(int)Math.ceil((double)phoneBookCount/itemsCountInAPage);
		
		List<Phone_BookVO>list=phone_Book_Service.getPhoneBookList(searchType, keyword, 3, register,itemsCountInAPage, page);
		
		model.addAttribute("phoneBookList", list);
		
		
		return "phoneBook/ResultTable";
	}
	
	@RequestMapping("dagachi/phoneBook/eliminatePhoneBook")
	public String eliminatePhoneBook(String phone_Book_Id) {
		int phoneBookId= Integer.parseInt(phone_Book_Id);
		phone_Book_Service.removePhone_Book(phoneBookId);
		
		return "phoneBook/eliminateSuccess";
	}
	
	@RequestMapping("dagachi/phoneBook/eliminateCb")
	public String eliminateCb(String[]checked_EIdArr, String phoneBookType, String register, String searchType, String keyword,
			@RequestParam(defaultValue = "1")int page, Model model) {
		for(int i=0;i<checked_EIdArr.length;i++) {
			int checkedId=Integer.parseInt(checked_EIdArr[i]);
			phone_Book_Service.removePhone_Book(checkedId);
		}
		if(register==null) {
			register="";
		}
		
		int phone_book_type=Integer.parseInt(phoneBookType);
		
		int phoneBookCount=phone_Book_Service.getPhoneBookCount(searchType,keyword,phone_book_type,register);
		int itemsCountInAPage=10;
		int pagesCount=(int)Math.ceil((double)phoneBookCount/itemsCountInAPage);
		
		List<Phone_BookVO>list=phone_Book_Service.getPhoneBookList(searchType, keyword, phone_book_type, register,itemsCountInAPage, page);
		
		model.addAttribute("phoneBookList", list);
		
		
		
		return "phoneBook/ResultTable";
	}
	
	
	@RequestMapping("dagachi/phoneBook/recoveryPhoneBookAtDetail")
	public String recoveryPhoneBookAtDetail(String phone_Book_Id,String phone_Book_Type) {
		int phoneBookId= Integer.parseInt(phone_Book_Id);
		phone_Book_Service.modifyType(phoneBookId, phone_Book_Type);
		
		return "phoneBook/recoverySuccess";
	}
	
	@RequestMapping("dagachi/phoneBook/registFav")
	public String registFavAtPhoneBook(String userId, String phone_Book_Id) {
		int phoneBookId=Integer.parseInt(phone_Book_Id);
		favPhoneService.registFav(phoneBookId, userId);
		return "phoneBook/ResultTable";
	}
	
	@RequestMapping("dagachi/phoneBook/removeFav")
	public String removeFavAtPhoneBook(String userId, String phone_Book_Id) {
		int phoneBookId=Integer.parseInt(phone_Book_Id);
		favPhoneService.removeFavAtPhone(phoneBookId,userId);
		return "phoneBook/ResultTable";
	}
	
	
}