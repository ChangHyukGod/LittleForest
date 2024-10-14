/**
 * 
 */
package com.simplecoding.repositoryexam.controller.faq;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.simplecoding.repositoryexam.service.basic.FaqService;
import com.simplecoding.repositoryexam.vo.basic.FaqVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : GameInfoController.java
 * @author : KTE
 * @since : 2024. 9. 20. description :
 */
@Controller
public class FaqController {

    @Autowired
    FaqService faqService;

    @Resource(name = "beanValidator")
    protected DefaultBeanValidator beanValidator;

    @GetMapping("/faq")
    public String faqmain() {
	return "faq/faqmain";
    }

    /*
     * @GetMapping("/faqlogin") public String faqlogin() { return "faq/faqlogin"; }
     */

    @GetMapping("/faqemail")
    public String faqemail() {
	return "faq/faqemail";
    }

    @GetMapping("/faqadd")
    public String faqadd() {
	return "faq/faqadd";
    }

    @GetMapping("/faqedit")
    public String faqsearch(@RequestParam("id") int id, Model model) throws Exception {
	FaqVO faqVO = faqService.selectFaqById(id);
	model.addAttribute("faqVO", faqVO);
	return "faq/faqedit";
    }

    @GetMapping("/faqlogin")
    public String faqList(@ModelAttribute("searchVO") Criteria searchVO, Model model) throws Exception {
	// 디버그용 로그 추가
	System.out.println("Search Keyword: " + searchVO.getSearchKeyword());

	searchVO.setPageUnit(10);
	searchVO.setPageSize(4);
	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	paginationInfo.setPageSize(searchVO.getPageSize());
	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	// 검색어가 올바르게 설정되어 있는지 확인
	System.out.println("Criteria Object: " + searchVO.toString());

	List<?> faqs = faqService.selectFaqList(searchVO);
	model.addAttribute("faqs", faqs);

	int totCnt = faqService.selectFaqListTotCnt(searchVO);
	paginationInfo.setTotalRecordCount(totCnt);
	model.addAttribute("paginationInfo", paginationInfo);

	return "faq/faqlogin"; // JSP 파일 경로에 맞게 수정
    }

    @PostMapping("/faq/add")
    public String AddFaq(@ModelAttribute FaqVO faqVO, BindingResult bindingResult) throws Exception {
	beanValidator.validate(faqVO, bindingResult);
	if (bindingResult.hasErrors()) {
	    return "/faqadd";
	}
	faqService.insertFaqVO(faqVO);
	return "redirect:/faqlogin";
    }

    @PostMapping("/faq/edit")
    public String EditFaq(@ModelAttribute FaqVO faqVO) throws Exception {
	faqService.updateFaq(faqVO);
	return "redirect:/faqlogin";
    }

    @PostMapping("/faq/delete")
    public String deleteFaq(@ModelAttribute FaqVO faqVO) throws Exception {
	faqService.deleteFaq(faqVO);
	return "redirect:/faqlogin";
    }
    
//  헤더 장바구니 카운터
    @ModelAttribute
    public void addCartItems(Model model, HttpSession session) {
        List<String> cart = (List<String>) session.getAttribute("cart");
        int cartCount = (cart != null) ? cart.size() : 0;
        model.addAttribute("cartCount", cartCount);
    }
}
