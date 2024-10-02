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
//  설명:
      // @ModelAttribute 메서드를 사용하면, 요청을 처리하는 컨트롤러 메서드가 호출될 때마다 모델에 데이터를 추가할 수 있습니다.
      // 이렇게 추가된 데이터는 해당 요청을 처리하는 뷰에서 자유롭게 사용할 수 있어, 사용자 경험을 더욱 향상시킬 수 있습니다.
        // ${cartCount}에 addCartItems메소드의 cartCount를 통해서 장바구니 속의 실제 데이터의 갯수가 나타남
   }
   
   // (8) 장바구니 페이지 생성 <-> (9)와 상호작용
   @GetMapping("/main/cart")
   public String goCart(Model model, HttpSession session) {
       List<String> cart = (List<String>) session.getAttribute("cart");
       // 세션에서 "cart"라는 키로 저장된 값을 가져옵니다. 이 값은 장바구니에 담긴 아이템의 UUID(고유 식별자)를 문자열 리스트로 저장한 것입니다.
       List<MainVO> cartItems = new ArrayList<>();

       if (cart != null) {
          // cart 리스트에 담긴 UUID의 개수만큼 반복
           for (String uuid : cart) {
               MainVO item = mainService.selectMain(uuid);
               cartItems.add(item);
           }
       }

       model.addAttribute("cartItems", cartItems); // cartItems를 모델에 추가
       
       return "payment/cart"; // 장바구니 페이지로 이동
//  설명:
      //  1) 사용자가 /main/cart URL에 GET 요청을 보내면 goCart 메서드가 호출됩니다.
      //  2) 세션에서 장바구니에 저장된 UUID 리스트를 가져옵니다.
      //  3) UUID 리스트를 반복하여 각 UUID에 해당하는 상품 정보를 가져와 cartItems 리스트에 추가합니다.
      //  4) cartItems 리스트를 모델에 추가하여 뷰에서 사용할 수 있도록 합니다.
      //  5) 최종적으로 장바구니 페이지로 이동합니다.
       
//       세션의 역할: addToCart 메서드에서 장바구니에 추가된 UUID는 세션에 저장되어 있기 때문에,
//                 사용자가 장바구니 페이지에 접근할 때 (goCart 메서드) 그 UUID를 참조하여 해당 상품 정보를 쉽게 가져올 수 있습니다.
//       매개변수 없이 UUID 사용: goCart 메서드는 매개변수로 UUID를 받지 않지만,
//                  세션에 저장된 cart 리스트를 통해 이전에 추가된 UUID를 사용합니다. 이 방식으로, 장바구니 상태를 유지하고 사용자가 추가한 상품 정보를 조회할 수 있습니다.
       
//       또, addToCart 메서드에서 cart라는 키를 사용하여 세션에 장바구니 데이터를 저장했기 때문에,
//            goCart 메서드에서도 같은 키(cart)를 사용하여 세션에서 해당 데이터를 불러올 수 있습니다.
   }
    
   // (9) 장바구니에 이미 게임이 있고없고에 따라 게임 추가하기 <-> (8)과 상호작용
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
         // cart 리스트에 UUID 값을 추가하고, 그 리스트를 세션에 저장함으로써, 사용자의 장바구니 상태를 세션에 지속적으로 유지할 수 있습니다.
         // 이후 사용자가 장바구니 페이지를 요청하면, 세션에 저장된 cart를 불러와 해당 UUID에 대한 상품 정보를 조회할 수 있습니다.
           return ResponseEntity.ok("장바구니에 추가되었습니다!");
       }
//  설명:
      // 1) 사용자가 상품을 장바구니에 추가하려고 /main/addToCart URL로 POST 요청을 보냅니다.
      // 2) 세션에서 로그인 상태를 확인합니다. 로그인하지 않았다면 오류 메시지를 반환합니다.
      // 3) 장바구니가 세션에 있는지 확인하고, 없으면 새로 초기화합니다.
      // 4) 이미 장바구니에 해당 상품이 있는지 확인하고, 있다면 중복 메시지를 반환합니다.
      // 5) 상품이 장바구니에 없다면, UUID를 장바구니에 추가하고 업데이트된 상태를 세션에 저장합니다.
      // 6) 최종적으로 성공 메시지를 반환합니다.
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
//   설명:
//       1) 장바구니 정보 가져오기:
//               세션에서 "cart" 키로 저장된 장바구니 정보를 가져옵니다. ("cart" 키는 UUID(고유 식별자) 값을 담고 있는 리스트)
//       2) 아이템 제거 시도:
//             장바구니가 존재하고, 요청된 UUID에 해당하는 아이템을 제거합니다.
//       3) 결과 처리:
//             아이템이 성공적으로 제거되면 장바구니를 세션에 업데이트하고 성공 메시지를 반환합니다.
//             아이템이 없으면 오류 메시지를 반환합니다.
   }
   
// (11) 최종 결제 페이지 생성
   @GetMapping("/main/cart/buy")
   public String goCartPayPage() {


      return "payment/cart_pay_page";
   }
}