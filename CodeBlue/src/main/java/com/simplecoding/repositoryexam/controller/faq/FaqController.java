/**
 * 
 */
package com.simplecoding.repositoryexam.controller.faq;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.simplecoding.repositoryexam.service.basic.FaqService;
import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.extern.log4j.Log4j;

/**
 * @fileName : GameInfoController.java
 * @author : KTE
 * @since : 2024. 9. 20. description :
 */
@Log4j
@Controller
public class FaqController {

    @Autowired
    FaqService faqService;

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

    @GetMapping("/faquselimited")
    public String faquselimited() {
	return "faq/faquselimited";
    }

    @GetMapping("/faqbuy")
    public String faqbuy() {
	return "faq/faqbuy";
    }

    @GetMapping("/faqsearch")
    public String faqsearch() {
	return "faq/faqsearch";
    }

    @GetMapping("/faqlogin")
    public String faqList(@ModelAttribute("searchVO") Criteria searchVO, Model model) throws Exception {

	searchVO.setPageUnit(40);
	searchVO.setPageSize(4);
	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
	paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
	paginationInfo.setPageSize(searchVO.getPageSize());
	searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
	searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

	List<?> faqs = faqService.selectFaqList(searchVO);
	model.addAttribute("faqs", faqs);
	int totcnt = faqService.selectFaqListTotCnt(searchVO);
	paginationInfo.setTotalRecordCount(totcnt);
	model.addAttribute("paginationInfo", paginationInfo);

	return "faq/faqlogin"; // 해당 JSP 파일 이름
    }

}
