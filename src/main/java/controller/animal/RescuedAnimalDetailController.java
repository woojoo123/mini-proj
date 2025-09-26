package controller.animal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/animal/rescued-detail/*")
public class RescuedAnimalDetailController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    // URL에서 ID 추출
    String pathInfo = request.getPathInfo();
    String animalId = null;

    if (pathInfo != null && pathInfo.length() > 1) {
      animalId = pathInfo.substring(1); // 앞의 '/' 제거
    }

    if (animalId == null || animalId.isEmpty()) {
      response.sendError(HttpServletResponse.SC_BAD_REQUEST, "동물 ID가 필요합니다.");
      return;
    }

    // 샘플 동물 데이터 생성
    Map<String, Object> animal = createAnimalData(animalId);
    if (animal == null) {
      response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 동물을 찾을 수 없습니다.");
      return;
    }

    // 추가 이미지들 (popfile1~popfile8)
    List<String> animalImages = createAnimalImages(animalId);

    // 데이터를 request에 설정
    request.setAttribute("animal", animal);
    request.setAttribute("animalImages", animalImages);

    request.getRequestDispatcher("/WEB-INF/views/animal/rescued-detail.jsp").forward(request, response);
  }

  private Map<String, Object> createAnimalData(String animalId) {
    Map<String, Object> animal = new HashMap<>();

    // 공공데이터 API 스펙에 맞춘 샘플 데이터 생성
    switch (animalId) {
      case "1":
        animal.put("desertionNo", "431702202409150001");
        animal.put("noticeNo", "부산-해운대-2024-00123");
        animal.put("noticeSdt", "20240915");
        animal.put("noticeEdt", "20241015");
        animal.put("happenDt", "20240915");
        animal.put("happenPlace", "부산시 해운대구 우동 인근 공원");
        animal.put("kindCd", "417000");
        animal.put("kindNm", "[개] 믹스견");
        animal.put("colorCd", "갈색");
        animal.put("age", "2024(년생)");
        animal.put("weight", "12.5(Kg)");
        animal.put("sexCd", "F");
        animal.put("neuterYn", "N");
        animal.put("specialMark", "오른쪽 뒷다리에 약간의 절뚝거림이 있음. 사람을 잘 따르는 온순한 성격. 중형견 크기로 활발함.");
        animal.put("careNm", "부산 해운대구 동물보호센터");
        animal.put("careTel", "051-749-7400");
        animal.put("careAddr", "부산광역시 해운대구 반여로 133");
        animal.put("careRegNo", "431702");
        animal.put("processState", "보호중");
        animal.put("popfile1", "https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물1-1");
        break;

      case "2":
        animal.put("desertionNo", "110802202409140002");
        animal.put("noticeNo", "서울-강남-2024-00456");
        animal.put("noticeSdt", "20240914");
        animal.put("noticeEdt", "20241014");
        animal.put("happenDt", "20240914");
        animal.put("happenPlace", "서울시 강남구 역삼동 테헤란로");
        animal.put("kindCd", "417000");
        animal.put("kindNm", "[개] 리트리버믹스");
        animal.put("colorCd", "갈색");
        animal.put("age", "2021(년생)");
        animal.put("weight", "18.2(Kg)");
        animal.put("sexCd", "M");
        animal.put("neuterYn", "Y");
        animal.put("specialMark", "매우 친화적이며 활발함. 사람과 다른 동물들과 잘 어울림. 산책을 좋아하며 기본적인 명령어를 알고 있음.");
        animal.put("careNm", "서울 강남구 동물보호센터");
        animal.put("careTel", "02-3423-6562");
        animal.put("careAddr", "서울특별시 강남구 개포로 617");
        animal.put("careRegNo", "110802");
        animal.put("processState", "공고중");
        animal.put("popfile1", "https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물2-1");
        break;

      case "3":
        animal.put("desertionNo", "280502202409120003");
        animal.put("noticeNo", "인천-남동-2024-00789");
        animal.put("noticeSdt", "20240912");
        animal.put("noticeEdt", "20241012");
        animal.put("happenDt", "20240912");
        animal.put("happenPlace", "인천시 남동구 구월동 폐건물");
        animal.put("kindCd", "422400");
        animal.put("kindNm", "[고양이] 코리안숏헤어");
        animal.put("colorCd", "검은색");
        animal.put("age", "2023(년생)");
        animal.put("weight", "3.8(Kg)");
        animal.put("sexCd", "F");
        animal.put("neuterYn", "N");
        animal.put("specialMark", "처음에는 경계심이 강하지만 시간이 지나면 사람에게 친근하게 다가옴. 건강상태 양호하며 식욕 정상.");
        animal.put("careNm", "인천 남동구 동물보호센터");
        animal.put("careTel", "032-453-5401");
        animal.put("careAddr", "인천광역시 남동구 정각로 29");
        animal.put("careRegNo", "280502");
        animal.put("processState", "보호중");
        animal.put("popfile1", "https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물3-1");
        break;

      default:
        return null;
    }

    return animal;
  }

  private List<String> createAnimalImages(String animalId) {
    List<String> images = new ArrayList<>();

    // popfile1~popfile8 필드에 해당하는 이미지들 생성
    switch (animalId) {
      case "1":
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물1-1");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물1-2");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물1-3");
        break;
      case "2":
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물2-1");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물2-2");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물2-3");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물2-4");
        break;
      case "3":
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물3-1");
        images.add("https://via.placeholder.com/400x400/F1DEC9/8D7B68?text=구조동물3-2");
        break;
      default:
        images.add("https://via.placeholder.com/400x400/F5F5F5/9E9E9E?text=이미지없음");
        break;
    }

    return images;
  }
}
