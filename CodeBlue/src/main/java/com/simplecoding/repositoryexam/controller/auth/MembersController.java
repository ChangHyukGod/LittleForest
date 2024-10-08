/**
 * 
 */
package com.simplecoding.repositoryexam.controller.auth;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.simplecoding.repositoryexam.service.auth.MembersService;

import com.simplecoding.repositoryexam.vo.auth.MembersVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.extern.log4j.Log4j;

/**
 * @fileName : MembersController.java
 * @author : KTE
 * @since : 2024. 9. 23. description :
 */
@Log4j
@Controller
public class MembersController {
	@Autowired
	MembersService membersService;

	// 로그인

	@GetMapping("/login")
	public String loginView() {
		return "auth/login";
	}

//	회원가입 화면
	@GetMapping("/register")
	public String registerView() {
		return "auth/register";
	}

	//	마이페이지 화면
	@GetMapping("/mypage")
	public String myPage() {
		return "auth/mypage";
	}
   
	// 로그인
	@PostMapping("/loginProcess")
	public String login(@ModelAttribute MembersVO loginVO, Model model, HttpServletRequest request) {
	    MembersVO membersVO = membersService.authenticateMembers(loginVO);

	    if (membersVO == null) {
	        model.addAttribute("errorMessage", "ID가 존재하지 않거나 비밀번호가 틀립니다.");
	        return "auth/login"; // 로그인 페이지로 포워딩
	    }
	    
	    // 로그인 성공 시 세션에 사용자 정보 저장
	    request.getSession().setAttribute("memberVO", membersVO);
    	// request.getSession()이 먼저 호출되고, 그 다음에 setAttribute("memberVO", membersVO)가 실행됩니다.
	    // 1단계: 세션을 가져오거나 새로 생성합니다.
	    // 2단계: 그 세션에 사용자 정보를 저장합니다.
		return "redirect:/";
		
//		요약:
//			getSession():
//			현재의 세션 객체를 가져오거나, 세션이 없다면 새로 생성합니다.
		
//			setAttribute(String name, Object value):
//			세션 객체에 데이터를 저장하는 메서드입니다. 특정 키(name)와 값을(value) 쌍으로 저장합니다.
		
//			getAttribute(String name):
//			세션 객체에서 특정 키에 해당하는 데이터를 가져오는 메서드입니다.
		
//			<중요한 점>
//			**setSession**이라는 메서드는 존재하지 않습니다. 세션에 데이터를 저장하고 관리하는 것은 항상 setAttribute와 getAttribute를 사용하여 이루어집니다.
//			이 세 가지 메서드가 세션을 다루는 기본적인 방법이니, 이 점을 기억하시면 좋습니다!
	}



	@GetMapping("/logout")
	public String logout(HttpSession httpSession) {
//		1) 세션에 memberVO 객체 삭제
		httpSession.removeAttribute("membersVO");
//		2) 세션 무효화 실행
		httpSession.invalidate();
		return "redirect:/login";
	}

	@PostMapping("/register/addition")
	public String register(@ModelAttribute MembersVO membersVO) throws Exception {

		MembersVO memberVO2 = membersService.authenticateMembers(membersVO);

		if (memberVO2 != null) {
			throw new Exception("이미 가입되었습니다.");
		}
		membersService.registerMembers(membersVO);
		return "redirect:/login";
	}

	@GetMapping("/test")
	private String test(@RequestParam String username, Model model) {
		// TODO Auto-generated method stub
		log.info("테스트" + username);

		return "redirect:/register";

	}

	@GetMapping("/infofix")
	public String infofix() {
		return "auth/infofix";
	}

	@GetMapping("/auth/check-username") // 경로를 수정해야 합니다.
	public ResponseEntity<String> checkUsernameDuplicate(@RequestParam String username) {
		boolean isDuplicate = membersService.isUsernameDuplicate(username);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.TEXT_PLAIN);
		headers.set("Content-Type", "text/plain; charset=UTF-8");
		if (isDuplicate) {
			return new ResponseEntity<>("중복된 아이디입니다.", headers, HttpStatus.CONFLICT);
		} else {
			return new ResponseEntity<>("사용 가능한 아이디입니다.", headers, HttpStatus.OK);
		}
	}
}
