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
		return "/auth/login";
	}

//	회원가입 화면
	@GetMapping("/register")
	public String registerView() {
		return "auth/register";
	}

	// 로그인 진행 : 로그인 버튼 클릭시 실행 : 보안(post) get방식(id/password 노출)

	@PostMapping("/loginProcess")
	public String login(@ModelAttribute MembersVO loginVO,
			HttpServletRequest request
	)throws Exception{

		MembersVO membersVO = membersService.authenticateMembers(loginVO);

		if (membersVO == null) {
			throw new Exception("회원이 없습니다.");
		}
		// 2) 인증 OK(DB 에 유저가 있으면) : 세션에 email/password 넣기
		request.getSession().setAttribute("memberVO", membersVO);
		return "redirect:/";
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
