/**
 * 
 */
package com.simplecoding.repositoryexam.vo.basic;


import org.springframework.web.multipart.MultipartFile;

import com.simplecoding.repositoryexam.vo.common.Criteria;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@SuppressWarnings("serial") // 상속시 serial이 있는 클래스일때 경고 발생, 위의 경고를 표시안하게 하는 어노테이션
public class MainVO extends Criteria {
     
   
     private String uuid;            // 기본키
     private String fileTitle;       // 제목   
     private String fileContent;     // 내용   
     private byte[] fileData;        // 이미지파일   
     private MultipartFile image;    // 내부적 사용(이미지파일)  y 
     private String fileUrl;         // 다운로드 url(클릭:이미지 다운로드됨)   
     private String price;           // 가격 
     private String genre;           // 장르
     private String company;         // 배급사
     private String rank;            // 이용등급
     private String nalzza;          // 출시일
     private String info;            // 소개글
     private String video;           // 동영상
     private String winOperation; // window 운영체제
     private String winProcess; // window 프로세스
     private String winMemory; // window 메모리
     private String winGraphic; // window 그래픽
     private String winDirectX; // window DirectX
     private String winStorage; // window 저장공간
     private String macOperation; // mac 운영체제
     private String macProcess; // mac 프로세스
     private String macMemory;  // mac 메모리
     private String macGraphic; // mac 그래픽
     private String macStorage; // mac 저장공간
     
     
     // 매개변수 4개 생성자
     public MainVO(String uuid, String fileTitle, String fileContent, byte[] fileData) {
        this.uuid = uuid;
        this.fileTitle = fileTitle;
        this.fileContent = fileContent;
        this.fileData = fileData;
     }
     
     // 매개변수 3개 생성자
     public MainVO(String fileTitle, String fileContent, byte[] fileData) {
           super();
         this.fileTitle = fileTitle;
         this.fileContent = fileContent;
         this.fileData = fileData;
     }


     // 매개변수 21개 생성자
     public MainVO(String fileTitle, String fileContent, byte[] fileData, String price, String genre,
            String company, String rank, String nalzza, String info, String video, String winOperation,
            String winProcess, String winMemory, String winGraphic, String winDirectX, String winStorage,
            String macOperation, String macProcess, String macMemory, String macGraphic, String macStorage) {
         this.fileTitle = fileTitle;
         this.fileContent = fileContent;
         this.fileData = fileData;
         this.price = price;
         this.genre = genre;
         this.company = company;
         this.rank = rank;
         this.nalzza = nalzza;
         this.info = info;
         this.video = video;
         this.winOperation = winOperation;
         this.winProcess = winProcess;
         this.winMemory = winMemory;
         this.winGraphic = winGraphic;
         this.winDirectX = winDirectX;
         this.winStorage = winStorage;
         this.macOperation = macOperation;
         this.macProcess = macProcess;
         this.macMemory = macMemory;
         this.macGraphic = macGraphic;
         this.macStorage = macStorage;
      }
     
     
     
}

