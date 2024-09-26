/**
 * 
 */
package com.simplecoding.repositoryexam.controller.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @fileName : GameInfoController.java
 * @author : KTE
 * @since : 2024. 9. 20. description :
 */
@Controller
public class FaqController {
    @GetMapping("/faq")
    public String faqmain() {
	return "faq/faqmain";
    }

    @GetMapping("/faqlogin")
    public String faqlogin() {
	return "faq/faqlogin";
    }

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

    @GetMapping("/faqright")
    public String faqright() {
	return "faq/faqright";
    }

}