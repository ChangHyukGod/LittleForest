package com.simplecoding.repositoryexam;


import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.simplecoding.repositoryexam.service.basic.MainService;
import com.simplecoding.repositoryexam.vo.basic.MainVO;
import com.simplecoding.repositoryexam.vo.common.Criteria;

/**
  * @fileName : MainController.java
  * @author : KTE
  * @since : 2024. 9. 24. 
  * description :
  */
@Controller
public class HomeController {

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
   @GetMapping("main/addition")
   public String createMainView() {
      
      return "main/add_main";
   }
      
   // (3) 저장 버튼 클릭시 insert함수 실행
   @PostMapping("/main/add")
   public String createMain(@RequestParam(defaultValue = "") String fileTitle,
         @RequestParam(defaultValue = "") String fileContent,
         @RequestParam(required = false) MultipartFile image,
         @RequestParam(defaultValue = "") String price,
         @RequestParam(defaultValue = "") String genre,
         @RequestParam(defaultValue = "") String company,
         @RequestParam(defaultValue = "") String rank,
         @RequestParam(defaultValue = "") String nalzza,
         @RequestParam(defaultValue = "") String info,
         @RequestParam(defaultValue = "") String video,
         @RequestParam(defaultValue = "") String winOperation,
         @RequestParam(defaultValue = "") String winProcess,
         @RequestParam(defaultValue = "") String winMemory,
         @RequestParam(defaultValue = "") String winGraphic,
         @RequestParam(defaultValue = "") String winDirectX,
         @RequestParam(defaultValue = "") String winStorage,
         @RequestParam(defaultValue = "") String macOperation,
         @RequestParam(defaultValue = "") String macProcess,
         @RequestParam(defaultValue = "") String macMemory,
         @RequestParam(defaultValue = "") String macGraphic,
         @RequestParam(defaultValue = "") String macStorage) throws Exception
   {
      
      // 생성자 실행
      MainVO mainVO = new MainVO(fileTitle, fileContent, image.getBytes(), price, genre, company, rank, nalzza, info, video,
            winOperation, winProcess, winMemory, winGraphic, winDirectX, winStorage, macOperation,
            macProcess, macMemory, macGraphic, macStorage);
      
      // insert 함수 실행2
      mainService.insert(mainVO);
      
      return "redirect:/";
   }
   
   
   // 상세조회(이미지 나타내기)
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
   
   // 상세조회 페이지 열기
   @GetMapping("main/edition")
   public String updateMainView(@RequestParam String uuid, Model model) {
      
      MainVO mainVO = mainService.selectMain(uuid);
      
      model.addAttribute("detail" ,mainVO);
      
      return "main/detail_main";
   }
   
   // (2) 결재 페이지 생성
      @GetMapping("/main/buy")
      public String goPayPage() {
         
         return "payment/paymentpage";
      }
   
   
}
