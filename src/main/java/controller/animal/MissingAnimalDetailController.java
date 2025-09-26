package controller.animal;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/animal/missing-detail/*")
public class MissingAnimalDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // URL에서 ID 추출
        String pathInfo = request.getPathInfo();
        String animalSeq = null;

        if (pathInfo != null && pathInfo.length() > 1) {
            animalSeq = pathInfo.substring(1); // 앞의 '/' 제거
        }

        if (animalSeq == null || animalSeq.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "동물 번호가 필요합니다.");
            return;
        }

        // 샘플 분실동물 데이터 생성
        Map<String, Object> animal = createMissingAnimalData(animalSeq);
        if (animal == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "해당 분실동물을 찾을 수 없습니다.");
            return;
        }

        // 데이터를 request에 설정
        request.setAttribute("animal", animal);

        request.getRequestDispatcher("/WEB-INF/views/animal/missing-detail.jsp").forward(request, response);
    }

    private Map<String, Object> createMissingAnimalData(String animalSeq) {
        Map<String, Object> animal = new HashMap<>();

        // 동물 번호에 따라 다른 분실동물 데이터 반환 (공공데이터 API 스펙 기반)
        switch (animalSeq) {
            case "202409150001":
                animal.put("rfidCd", "410123456789012");
                animal.put("callName", "김민수");
                animal.put("callTel", "010-1234-5678");
                animal.put("happenDt", "20240915");
                animal.put("happenAddr", "서울특별시 강남구");
                animal.put("happenAddrDtl", "역삼동 123-45");
                animal.put("happenPlace", "테헤란로 근처 공원");
                animal.put("orgNm", "서울특별시 강남구청");
                animal.put("popfile", "https://via.placeholder.com/400x400/FF6B6B/FFFFFF?text=분실강아지1");
                animal.put("kindCd", "417000");
                animal.put("colorCd", "갈색");
                animal.put("sexCd", "F");
                animal.put("age", "3세");
                animal.put("specialMark", "목에 빨간색 목걸이를 착용하고 있음. 오른쪽 귀에 작은 점이 있음. 사람을 잘 따르는 온순한 성격입니다. 평소 이름을 부르면 잘 달려옵니다.");
                animal.put("animalSeq", animalSeq);

                // 추가 정보
                animal.put("breeds", "포메라니안");
                animal.put("weight", "5kg");
                animal.put("neuterYn", "Y");
                animal.put("microchip", "있음");
                animal.put("reward", "50만원");
                animal.put("ownerComment", "가족의 일원입니다. 꼭 찾아주세요. 작은 정보라도 연락 부탁드립니다.");
                break;

            case "202409140002":
                animal.put("rfidCd", "410987654321098");
                animal.put("callName", "박영희");
                animal.put("callTel", "010-2345-6789");
                animal.put("happenDt", "20240914");
                animal.put("happenAddr", "부산광역시 해운대구");
                animal.put("happenAddrDtl", "우동 567-89");
                animal.put("happenPlace", "마린시티 아파트 단지");
                animal.put("orgNm", "부산광역시 해운대구청");
                animal.put("popfile", "https://via.placeholder.com/400x400/FF6B6B/FFFFFF?text=분실고양이1");
                animal.put("kindCd", "422400");
                animal.put("colorCd", "회색");
                animal.put("sexCd", "M");
                animal.put("age", "2세");
                animal.put("specialMark", "왼쪽 앞발에 흰색 양말 무늬. 꼬리 끝이 까만색. 매우 친근한 성격으로 사람을 잘 따릅니다. 높은 곳을 좋아합니다.");
                animal.put("animalSeq", animalSeq);

                animal.put("breeds", "러시안블루");
                animal.put("weight", "3kg");
                animal.put("neuterYn", "N");
                animal.put("microchip", "없음");
                animal.put("reward", "30만원");
                animal.put("ownerComment", "아이가 처음 밖으로 나간 것 같습니다. 겁이 많아서 숨어있을 수 있습니다.");
                break;

            case "202409130003":
                animal.put("rfidCd", "410555666777888");
                animal.put("callName", "이철수");
                animal.put("callTel", "010-3456-7890");
                animal.put("happenDt", "20240913");
                animal.put("happenAddr", "대구광역시 수성구");
                animal.put("happenAddrDtl", "범어동 890-12");
                animal.put("happenPlace", "수성못 산책로");
                animal.put("orgNm", "대구광역시 수성구청");
                animal.put("popfile", "https://via.placeholder.com/400x400/FF6B6B/FFFFFF?text=분실강아지2");
                animal.put("kindCd", "417000");
                animal.put("colorCd", "검은색");
                animal.put("sexCd", "M");
                animal.put("age", "3세");
                animal.put("specialMark", "가슴에 하얀색 하트 모양 무늬. 오른쪽 뒷다리를 약간 절음. 평소 산책을 좋아하며 활발한 성격입니다.");
                animal.put("animalSeq", animalSeq);

                animal.put("breeds", "래브라도 리트리버");
                animal.put("weight", "15kg");
                animal.put("neuterYn", "Y");
                animal.put("microchip", "있음");
                animal.put("reward", "100만원");
                animal.put("ownerComment", "산책 중에 놓쳤습니다. 물을 좋아해서 물가 근처에 있을 수 있습니다.");
                break;

            default:
                return null;
        }

        return animal;
    }

    // 동물 종류 코드를 이름으로 변환
    private String getAnimalTypeName(String kindCd) {
        switch (kindCd) {
            case "417000": return "개";
            case "422400": return "고양이";
            case "429900": return "기타";
            default: return "기타";
        }
    }

    // 성별 코드를 이름으로 변환
    private String getGenderName(String sexCd) {
        switch (sexCd) {
            case "M": return "수컷";
            case "F": return "암컷";
            default: return "미상";
        }
    }
}