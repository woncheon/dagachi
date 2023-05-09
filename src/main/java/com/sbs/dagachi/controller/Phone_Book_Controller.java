package com.sbs.dagachi.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.dagachi.service.MemberService;
import com.sbs.dagachi.service.Phone_Book_Service;
import com.sbs.dagachi.vo.Member;
import com.sbs.dagachi.vo.Phone_BookVO;

@Controller
public class Phone_Book_Controller {

	private Phone_Book_Service phone_Book_Service;
	private MemberService memberService;
	public Phone_Book_Controller(Phone_Book_Service phone_Book_Service,MemberService memberService) {
		this.phone_Book_Service = phone_Book_Service;
		this.memberService=memberService;
	}

	
	
	@RequestMapping("dagachi/phoneBook/showList")
	public String showList(String searchType, String keyword,
			@RequestParam(defaultValue = "1") int phone_book_type, String phone_book_register,Model model,@RequestParam(defaultValue = "1")int page) {
		int phoneBookCount=phone_Book_Service.getPhoneBookCount(searchType,keyword,phone_book_type);
		int itemsCountInAPage=10;
		int pagesCount=(int)Math.ceil((double)phoneBookCount/itemsCountInAPage);
		
		List<Phone_BookVO>list=phone_Book_Service.getPhoneBookList(searchType, keyword, phone_book_type, phone_book_register,itemsCountInAPage, page);
		
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
		model.addAttribute("phoneBook",phoneBook);
		return "phoneBook/detail";
		
	}

	@RequestMapping("dagachi/phoneBook/liid")
	@ResponseBody
	public int liid() {
		return phone_Book_Service.getLastInsertId();
	}


	@RequestMapping("dagachi/phoneBook/regist")
	@ResponseBody
	public Phone_BookVO registPhone_Book(String phone_Book_Name, String phone_Book_Email, String phone_Book_Phone,
			String phone_Book_Company, String phone_Book_Tag, String phone_Book_Fax, String phone_Book_Dep,
			String phone_Book_Team, String phone_Book_Rank, String phone_Book_Address, String phone_Book_Web,
			String phone_Book_Register, int phone_Book_Type) {

		phone_Book_Service.registPhone_Book(phone_Book_Name, phone_Book_Email, phone_Book_Phone,
				phone_Book_Company, phone_Book_Tag, phone_Book_Fax, phone_Book_Dep,
				phone_Book_Team, phone_Book_Rank, phone_Book_Address, phone_Book_Web,
				phone_Book_Register, phone_Book_Type);

		int phone_Book_Id=phone_Book_Service.getLastInsertId();

		return phone_Book_Service.getPhoneBookDetail(phone_Book_Id);
	}
	
	@RequestMapping("dagachi/phoneBook/registForm")
	public String showPhoneBookRegistForm() {
		return "phoneBook/regist";
	}
	
	@RequestMapping("dagachi/phoneBook/modifyForm")
	public String showPhoneBookModifyForm(int phone_Book_Id,Model model) {
		Phone_BookVO phoneBook=phone_Book_Service.getPhoneBookDetail(phone_Book_Id);
		model.addAttribute("phoneBook",phoneBook);
		return "phoneBook/modify";
	}
	
	@RequestMapping("dagachi/phoneBook/modify")
	@ResponseBody
	public Phone_BookVO modifyPhone_Book(int phone_Book_Id, String phone_Book_Name, String phone_Book_Email, String phone_Book_Phone,
			String phone_Book_Company, String phone_Book_Tag, String phone_Book_Fax, String phone_Book_Dep,
			String phone_Book_Team, String phone_Book_Rank, String phone_Book_Address, String phone_Book_Web,
			String phone_Book_Register, int phone_Book_Type) {

		phone_Book_Service.modifyPhone_Book(phone_Book_Id, phone_Book_Name, phone_Book_Email, phone_Book_Phone,
				phone_Book_Company, phone_Book_Tag, phone_Book_Fax, phone_Book_Dep,
				phone_Book_Team, phone_Book_Rank, phone_Book_Address, phone_Book_Web,
				phone_Book_Register, phone_Book_Type);



		return phone_Book_Service.getPhoneBookDetail(phone_Book_Id);
	}
	
	@RequestMapping("dagachi/phoneBook/moveTrash")
	public String moveTrashPhone_Book(int phone_Book_Id) {
		phone_Book_Service.moveTrashPhone_Book(phone_Book_Id);
		
		return "phoneBook/moveTrash";
	}

}