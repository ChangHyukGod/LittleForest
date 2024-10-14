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
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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

   // 회원가입 화면
   @GetMapping("/register")
   public String registerView() {
      return "auth/register";
   }

   // 마이페이지 화면
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
      // request.getSession()이 먼저 호출되고, 그 다음에 setAttribute("memberVO", membersVO)가
      // 실행됩니다.
      // 1단계: 세션을 가져오거나 새로 생성합니다.
      // 2단계: 그 세션에 사용자 정보를 저장합니다.
      return "redirect:/";

//      요약:
//         getSession():
//         현재의 세션 객체를 가져오거나, 세션이 없다면 새로 생성합니다.

//         setAttribute(String name, Object value):
//         세션 객체에 데이터를 저장하는 메서드입니다. 특정 키(name)와 값을(value) 쌍으로 저장합니다.

//         getAttribute(String name):
//         세션 객체에서 특정 키에 해당하는 데이터를 가져오는 메서드입니다.

//         <중요한 점>
//         **setSession**이라는 메서드는 존재하지 않습니다. 세션에 데이터를 저장하고 관리하는 것은 항상 setAttribute와 getAttribute를 사용하여 이루어집니다.
//         이 세 가지 메서드가 세션을 다루는 기본적인 방법이니, 이 점을 기억하시면 좋습니다!
   }

   // 로그아웃
   @GetMapping("/logout")
   public String logout(HttpSession httpSession) {
//      1) 세션에 memberVO 객체 삭제
      httpSession.removeAttribute("memberVO");
//      2) 세션 무효화 실행
      httpSession.invalidate();
      return "redirect:/login";
   }

   // 회원가입 버튼 클릭
   @PostMapping("/register/addition")
   public String register(@ModelAttribute MembersVO membersVO, Model model) {
      try {
         // 중복 사용자 체크
         MembersVO memberVO2 = membersService.authenticateMembers(membersVO);
         if (memberVO2 != null) {
            model.addAttribute("errorMessage", "이미 가입된 사용자가 있습니다.");
            return "auth/register";
         }

         // 회원 등록
         membersService.registerMembers(membersVO);

         return "redirect:/login";

      } catch (DuplicateKeyException e) {
         model.addAttribute("errorMessage", "이미 가입된 사용자가 있습니다.");
         return "auth/register";
      } catch (Exception e) {
         model.addAttribute("errorMessage", "이미 가입된 사용자가 있습니다.");
         return "auth/register";
      }
   }

   @GetMapping("/test")
   private String test(@RequestParam String username, Model model) {
      // TODO Auto-generated method stub
      log.info("테스트" + username);

      return "redirect:/register";

   }

   // id 중복 확인
   @GetMapping("/auth/check-username")
   public ResponseEntity<String> checkUsernameDuplicate(@RequestParam String username) {
      boolean isDuplicate = membersService.isUsernameDuplicate(username);
      // boolean isDuplicate엔 1또는0이 들어오고, 1이면 참, 0이면 거짓임
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.TEXT_PLAIN);
      headers.set("Content-Type", "text/plain; charset=UTF-8");

      // 1이면 즉, 이미 db에 id가있으면
      if (isDuplicate) {
         return new ResponseEntity<>("중복된 아이디입니다.", headers, HttpStatus.CONFLICT);
      }
      // 0이면 즉, 이미 db에 id가없으면
      else {
         return new ResponseEntity<>("사용 가능한 아이디입니다.", headers, HttpStatus.OK);
      }
   }

   // email 중복 확인
   @GetMapping("/auth/check-email")
   public ResponseEntity<String> checkUseremailDuplicate(@RequestParam String email) {
      boolean isDuplicate = membersService.isUseremailDuplicate(email);
      // boolean isDuplicate엔 1또는0이 들어오고, 1이면 참, 0이면 거짓임
      HttpHeaders headers = new HttpHeaders();
      headers.setContentType(MediaType.TEXT_PLAIN);
      headers.set("Content-Type", "text/plain; charset=UTF-8");

      // 1이면 즉, 이미 db에 id가있으면
      if (isDuplicate) {
         return new ResponseEntity<>("이미 존재하는 이메일입니다.", headers, HttpStatus.CONFLICT);
      }
      // 0이면 즉, 이미 db에 id가없으면
      else {
         return new ResponseEntity<>("사용 가능한 이메일입니다.", headers, HttpStatus.OK);
      }
   }

   @GetMapping("/passwordCheck")
   public String password() {

      return "auth/passwordcheck";
   }

   @PostMapping("/passwordChecking")
   public String passwordcheck(@ModelAttribute("password") String inputPassword, HttpSession session, Model model) {
      MembersVO membersVO = (MembersVO) session.getAttribute("memberVO");

      // 회원이 세션에 없을 경우 null 처리
      if (membersVO == null) {
         model.addAttribute("error", "로그인이 필요합니다.");
         return "/auth/login"; // 로그인 페이지로 리다이렉트
      }
      String hashedPassword = membersVO.getPassword();
      if (!BCrypt.checkpw(inputPassword, hashedPassword)) {
         model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
         return "/auth/passwordcheck"; // 비밀번호 확인 페이지로 리다이렉트
      }

      return "/auth/infofix";
   }

   // 회원 정보 수정
   @PostMapping("/infofix")
   public String infofix(@RequestParam String membername, @ModelAttribute MembersVO membersVO, HttpSession session) throws Exception {
       // 비밀번호 수정 및 해시화된 비밀번호 반환
       String hashedPassword = membersService.infofix(membersVO);
       
       // 세션에서 현재 로그인된 회원 정보 가져오기
       MembersVO loggedInMember = (MembersVO) session.getAttribute("memberVO");
       
       // 세션의 회원 정보를 업데이트
       if (loggedInMember != null) {
           // 해시화된 비밀번호로 업데이트
           loggedInMember.setPassword(hashedPassword); // 해시화된 비밀번호로 업데이트
           
           // 필요한 다른 정보도 업데이트
           loggedInMember.setPhonenumber(membersVO.getPhonenumber()); // 예: 전화번호 업데이트

           // 세션에 업데이트된 회원 정보 다시 설정
           session.setAttribute("memberVO", loggedInMember);
       }

       return "redirect:/";
   }

   // 헤더 장바구니 카운터
   @ModelAttribute
   public void addCartItems(Model model, HttpSession session) {
      List<String> cart = (List<String>) session.getAttribute("cart");
      int cartCount = (cart != null) ? cart.size() : 0;
      model.addAttribute("cartCount", cartCount);
   }
}
