package com.simplecoding.repositoryexam;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestBody;
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
      // 설명:
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

   
   // (10) 장바구니 페이지에서 담아놓은 게임 개별 삭제
   @PostMapping(value = "/main/removeFromCart", produces = "text/plain;charset=UTF-8")
   public ResponseEntity<String> removeFromCart(@RequestParam String uuid, HttpSession session) {
       List<String> cart = (List<String>) session.getAttribute("cart");
       
       if (cart != null && cart.remove(uuid)) {
          // cart.remove(uuid) => uuid값 제거
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
   
    // 11) 장바구니 페이지에서 담아놓은 게임 전체 삭제
    @PostMapping(value = "/main/removeAllFromCart", produces = "text/plain;charset=UTF-8")
   public ResponseEntity<String> removeAllFromCart(HttpSession session) {
       // 세션에서 장바구니 정보를 가져옴
       List<String> cart = (List<String>) session.getAttribute("cart");
       
       // 장바구니가 존재하는 경우
       if (cart != null) {
           cart.clear(); // 장바구니의 모든 아이템을 삭제
           session.setAttribute("cart", cart); // 빈 장바구니를 세션에 저장
           // 성공 메시지를 포함한 200 OK 응답을 반환
           return ResponseEntity.ok("장바구니의 모든 아이템이 삭제되었습니다!"); 
       } else {
           // 장바구니가 비어 있는 경우, 적절한 메시지를 반환
           return ResponseEntity.ok("장바구니가 비어 있습니다."); 
       }
   }

   
   // (12) 장바구니 결제 페이지 생성 <-> (13)과 상호작용
   @GetMapping("/main/cart/buy") // HTTP GET 요청을 처리하는 메서드
   public String goCartPayPage(HttpSession session, Model model) {
       // 세션에서 pay_cart 속성을 가져옴. 이 속성은 선택된 게임의 UUID 리스트입니다.
       List<String> pay_cart = (List<String>) session.getAttribute("pay_cart"); // UUID 리스트
       List<MainVO> selectedGames = new ArrayList<>(); // 선택된 게임 정보를 저장할 리스트(MainVO객체)
       
       // pay_cart가 null이 아니고 비어있지 않은 경우
       if (pay_cart != null && !pay_cart.isEmpty()) {
           // 각 UUID에 대해 반복
           for (String uuid : pay_cart) {
               // UUID를 사용하여 게임 정보를 가져옴
               MainVO game = mainService.selectMain(uuid); 
               // 게임 정보가 유효한 경우 리스트에 추가
               if (game != null) {
                   selectedGames.add(game);
               } else {
                   // 게임 정보가 없을 경우 콘솔에 메시지 출력
                   System.out.println("게임 정보가 없습니다: " + uuid);
               }
           }
       } else {
           // pay_cart가 비어있을 경우 콘솔에 메시지 출력
           System.out.println("장바구니에 게임이 없습니다.");
       }
   
       // 선택된 게임 리스트를 모델에 추가
       model.addAttribute("selectedGames", selectedGames);
       // 결제 페이지 JSP로 이동
       return "payment/cart_pay_page"; 
   }
   
   // (13) 선택한 게임 UUID를 세션에 저장 <-> (12)와 상호작용
   @PostMapping(value = "/main/cart/saveSelectedItems", consumes = "application/json") // HTTP POST 요청을 처리
   @ResponseBody // 이 메서드는 JSON 응답을 반환
   public ResponseEntity<String> saveSelectedItems(@RequestBody Map<String, List<String>> payload, HttpSession session) {
      // payload: 서버로 보내는 데이터의 내용. 클라이언트가 요청할 때 포함된 데이터라고 생각하면 됩니다.
       List<String> uuids = payload.get("uuids"); // payload에서 "uuids"라는 키의 값을 가져옴
   
       // 수신된 UUID 출력
       System.out.println("Received UUIDs: " + uuids);
   
       // UUID 리스트가 null이 아니고 비어있지 않은 경우
       if (uuids != null && !uuids.isEmpty()) {
           // 세션에 pay_cart 속성으로 UUID 리스트 저장
           session.setAttribute("pay_cart", uuids);
           // 성공 메시지 반환
           return ResponseEntity.ok("선택한 게임이 저장되었습니다.");
       }
       // UUID 리스트가 없을 경우 오류 메시지 반환
       return ResponseEntity.badRequest().body("게임 선택이 실패했습니다."); 
   }

//   1. @ResponseBody
//   무슨 뜻?: 이 메서드의 결과를 웹 페이지가 아니라 데이터 형식으로 바로 보내겠다는 의미예요. 즉, 클라이언트에게 반환되는 내용이 HTML이 아니라 JSON이나 텍스트라는 거죠.
//   예: "선택한 게임이 저장되었습니다." 같은 메시지를 클라이언트에게 전달해요.
   
//   2. @RequestBody
//   무슨 뜻?: 클라이언트가 보낸 데이터(주로 JSON 형식)를 이 메서드에서 사용할 수 있도록 변환해준다는 뜻이에요.
//   예: "uuids"라는 키가 있는 JSON 데이터를 받아서 그 값을 코드에서 쉽게 사용할 수 있게 해줘요.
   
//   3. Map<String, List<String>> payload
//   무슨 뜻?: 클라이언트가 보낸 데이터의 구조를 설명하는 자료형이에요.
//   "String": 데이터의 이름, 즉 키를 의미해요. 여기선 "uuids"가 키예요.
//   "List<String>": 그 키에 해당하는 값이 여러 개 있을 수 있어서 리스트 형태로 저장해요.
//   예: 클라이언트가 여러 UUID를 보낼 때, 이를 리스트로 받을 수 있어요.
   
//   4. ResponseEntity
//   무슨 뜻?: HTTP 응답을 표현하는 객체로, 상태 코드, 헤더, 본문 내용을 포함할 수 있어요. 즉, 응답의 상태를 더 세밀하게 조절할 수 있게 해주는 도구예요.
//   예: 성공적으로 처리가 끝났다면 ResponseEntity.ok("메시지")를 사용해서 HTTP 200 상태와 함께 메시지를 반환할 수 있어요.
   
//   (*) @ResponseBody는 명시적으로 응답 형식을 지정하는 역할을 하지만, ResponseEntity만으로도 응답을 처리할 수 있습니다.
//        ResponseEntity를 사용하는 것이 더 직관적이며, 코드가 간결해질 수 있습니다.
//   @ResponseBody를 사용하면 메서드의 반환 값을 JSON으로 자동 변환하겠다는 것을 명시적으로 나타내는 것이고,
//   ResponseEntity만 사용해도 Spring이 자동으로 JSON 형식으로 변환하여 응답할 수 있습니다.
//   결국, 두 방식 모두 같은 결과를 만들어내므로, 주로 코드의 가독성이나 팀의 코딩 스타일에 따라 선택하면 됩니다.
   
   
} 