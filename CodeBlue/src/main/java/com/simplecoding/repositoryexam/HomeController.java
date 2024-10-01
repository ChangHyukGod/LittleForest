package com.simplecoding.repositoryexam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.simplecoding.repositoryexam.service.basic.MainService;
import com.simplecoding.repositoryexam.vo.basic.MainVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
 * @fileName : MainController.java
 * @author : KTE
 * @since : 2024. 9. 24. description :
 */
@Controller
public class HomeController{

   @Autowired
   MainService mainService;

   // (1) 전체조회
   @GetMapping("/")
   public String selectMainList(Model model, @ModelAttribute("searchVO") Criteria searchVO) throws Exception {

      List<?> mains = mainService.selectMainList(searchVO);

      model.addAttribute("main", mains);

      return "/home";
   }

   // (2) 추가 페이지 생성
   @GetMapping("/main/addition")
   public String createMainView() {

      return "main/add_main";
   }

   // (3) 저장 버튼 클릭시 insert함수 실행
   @PostMapping("/main/add")
   public String createMain(@RequestParam(defaultValue = "") String fileTitle,
         @RequestParam(defaultValue = "") String fileContent, @RequestParam(required = false) MultipartFile image,
         @RequestParam(defaultValue = "") String price, @RequestParam(defaultValue = "") String genre,
         @RequestParam(defaultValue = "") String company, @RequestParam(defaultValue = "") String rank,
         @RequestParam(defaultValue = "") String nalzza, @RequestParam(defaultValue = "") String info,
         @RequestParam(defaultValue = "") String video, @RequestParam(defaultValue = "") String winOperation,
         @RequestParam(defaultValue = "") String winProcess, @RequestParam(defaultValue = "") String winMemory,
         @RequestParam(defaultValue = "") String winGraphic, @RequestParam(defaultValue = "") String winDirectX,
         @RequestParam(defaultValue = "") String winStorage, @RequestParam(defaultValue = "") String macOperation,
         @RequestParam(defaultValue = "") String macProcess, @RequestParam(defaultValue = "") String macMemory,
         @RequestParam(defaultValue = "") String macGraphic, @RequestParam(defaultValue = "") String macStorage)
         throws Exception {

      // 생성자 실행
      MainVO mainVO = new MainVO(fileTitle, fileContent, image.getBytes(), price, genre, company, rank, nalzza, info,
            video, winOperation, winProcess, winMemory, winGraphic, winDirectX, winStorage, macOperation,
            macProcess, macMemory, macGraphic, macStorage);

      // insert 함수 실행2
      mainService.insert(mainVO);

      return "redirect:/";
   }

   // (4) 상세조회(이미지 나타내기)
   @GetMapping("/main/{uuid}")
   @ResponseBody
   public ResponseEntity<byte[]> fileDownload(@PathVariable String uuid) throws Exception {

      // 1) 상세조회 : 객체받기(첨부파일)
      MainVO mainVO = mainService.selectMain(uuid);

      // 2) 첨부파일 jsp 전송 : 규격대로 전송
      // 첨부파일 다운로드 응답 생성
      HttpHeaders headers = new HttpHeaders(); // html 문서 객체(머리말)
      headers.setContentDispositionFormData("attachment", mainVO.getUuid()); // 첨부파일1(문서형태)
      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 첨부파일2(문서형태)

      return new ResponseEntity<byte[]>(mainVO.getFileData(), headers, HttpStatus.OK); // 첨부파일 전송 + OK 신호 보냄
   }

   // (5) 상세조회 페이지 열기
   @GetMapping("main/edition")
   public String updateMainView(@RequestParam String uuid, Model model) {

      MainVO mainVO = mainService.selectMain(uuid);

      model.addAttribute("detail", mainVO);

      return "main/detail_main";
   }

   // (6) 결재 페이지 생성
   @GetMapping("/main/buy")
   public String goPayPage(@RequestParam String uuid, Model model) {
//            log.info("test " + uuid);
      MainVO mainVO2 = mainService.selectMain(uuid);
//            MainVO mainVO22 = mainService2.selectMain(uuid);

      model.addAttribute("buy", mainVO2);
//            model.addAttribute("buy2" ,mainVO2);

      return "payment/pay_page";
   }
   
   // (7)모든 요청 전에 장바구니 아이템 개수를 모델에 추가
   @ModelAttribute
   public void addCartItems(Model model, HttpSession session) {
       List<String> cart = (List<String>) session.getAttribute("cart");
       int cartCount = (cart != null) ? cart.size() : 0;
       model.addAttribute("cartCount", cartCount);
   }
   
   
    // (8) 장바구니에 게임 추가하기
   @PostMapping(value = "/main/addToCart", produces = "text/plain;charset=UTF-8")
   public ResponseEntity<String> addToCart(@RequestParam String uuid, HttpSession session) {
       // 로그인 확인
       Object user = session.getAttribute("memberVO"); // 사용자 정보 세션에서 가져오기
       if (user == null) {
           return ResponseEntity.ok("로그인 후 이용하세요."); // 로그인하지 않은 경우
       }

       List<String> cart = (List<String>) session.getAttribute("cart");
       if (cart == null) {
           cart = new ArrayList<>();
       }

       // 이미 장바구니에 있는지 확인
       if (cart.contains(uuid)) {
           return ResponseEntity.ok("이미 장바구니에 있는 게임입니다.");
       } else {
           cart.add(uuid);
           session.setAttribute("cart", cart);
           return ResponseEntity.ok("장바구니에 추가되었습니다!");
       }
   }


   // (9) 장바구니 페이지 생성
   @GetMapping("/main/cart")
   public String goCart(Model model, HttpSession session) {
       List<String> cart = (List<String>) session.getAttribute("cart");
       List<MainVO> cartItems = new ArrayList<>();

       if (cart != null) {
           for (String uuid : cart) {
               MainVO item = mainService.selectMain(uuid);
               cartItems.add(item);
           }
       }

       model.addAttribute("cartItems", cartItems); // cartItems를 모델에 추가
       return "payment/cart"; // 장바구니 페이지로 이동
   }

   
   // (10) 장바구니 페이지에서 담아놓은 게임 삭제
   @PostMapping(value = "/main/removeFromCart", produces = "text/plain;charset=UTF-8")
   public ResponseEntity<String> removeFromCart(@RequestParam String uuid, HttpSession session) {
       List<String> cart = (List<String>) session.getAttribute("cart");
       
       if (cart != null && cart.remove(uuid)) {
           session.setAttribute("cart", cart); // 변경된 장바구니 저장
           return ResponseEntity.ok("장바구니에서 삭제되었습니다!"); // 성공 메시지
       } else {
           return ResponseEntity.ok("장바구니에 해당 아이템이 없습니다."); // 오류 메시지
       }
   }
   
}