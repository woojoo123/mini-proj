package controller.shelter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PageUtils;

/**
 * 동물보호센터 정보조회 컨트롤러 (공공데이터 API 연동)
 */
@WebServlet("/shelter/info")
public class ShelterInfoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("detail".equals(action)) {
            handleDetailView(req, resp);
        } else {
            handleListView(req, resp);
        }
    }

    private void handleListView(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 검색 파라미터
        String region = req.getParameter("region");
        String shelterName = req.getParameter("shelterName");
        String pageStr = req.getParameter("page");

        int page = 1;
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }

        // TODO: 실제 API 호출 구현
        // List<ShelterInfoDto> shelterList = getSampleShelterData();

        // 페이징 처리
        // int pageSize = 10;
        // int totalCount = shelterList.size();
        // int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // int startIndex = (page - 1) * pageSize;
        // int endIndex = Math.min(startIndex + pageSize, totalCount);

        // List<ShelterInfoDto> pagedList = new ArrayList<>();
        // if (startIndex < totalCount) {
        //     pagedList = shelterList.subList(startIndex, endIndex);
        // }

        // // 데이터 설정
        // req.setAttribute("shelterList", pagedList);
        // req.setAttribute("currentPage", page);
        // req.setAttribute("totalPages", totalPages);
        // req.setAttribute("totalCount", totalCount);
        // req.setAttribute("region", region);
        // req.setAttribute("shelterName", shelterName);

        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/shelter/info-list.jsp");
    }

    private void handleDetailView(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String registrationNumber = req.getParameter("regNo");

        // TODO: 실제 API 호출로 상세 정보 조회
        // ShelterInfoDto shelterInfo = getSampleShelterDetail(registrationNumber);

        // if (shelterInfo == null) {
        //     resp.sendError(HttpServletResponse.SC_NOT_FOUND, "보호소 정보를 찾을 수 없습니다.");
        //     return;
        // }

        // req.setAttribute("shelterInfo", shelterInfo);
        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/shelter/info-detail.jsp");
    }

    /**
     * 샘플 데이터 생성 (실제 구현 시 API 호출로 대체)
     */
    // private List<ShelterInfoDto> getSampleShelterData() {
    //     List<ShelterInfoDto> list = new ArrayList<>();

    //     // 샘플 데이터 1
    //     ShelterInfoDto shelter1 = new ShelterInfoDto();
    //     shelter1.setShelterName("서울특별시 동물보호센터");
    //     shelter1.setRegistrationNumber("seoul001");
    //     shelter1.setOrganizationName("서울특별시");
    //     shelter1.setDivisionName("보건환경연구원");
    //     shelter1.setRoadAddress("서울특별시 중랑구 용마산로 31");
    //     shelter1.setLotAddress("서울특별시 중랑구 면목동 산42-1");
    //     shelter1.setPhoneNumber("02-2036-4400");
    //     shelter1.setTargetAnimals("개, 고양이");
    //     shelter1.setWeekdayOpenTime("09:00");
    //     shelter1.setWeekdayCloseTime("18:00");
    //     shelter1.setWeekendOpenTime("10:00");
    //     shelter1.setWeekendCloseTime("17:00");
    //     shelter1.setClosedDay("월요일");
    //     shelter1.setLatitude("37.5665");
    //     shelter1.setLongitude("127.0392");
    //     shelter1.setVeterinarianCount("3");
    //     shelter1.setMedicalFacilityCount("2");
    //     list.add(shelter1);

    //     // 샘플 데이터 2
    //     ShelterInfoDto shelter2 = new ShelterInfoDto();
    //     shelter2.setShelterName("경기도 동물보호센터");
    //     shelter2.setRegistrationNumber("gg001");
    //     shelter2.setOrganizationName("경기도");
    //     shelter2.setDivisionName("보건환경연구원");
    //     shelter2.setRoadAddress("경기도 성남시 수정구 복정로 95");
    //     shelter2.setLotAddress("경기도 성남시 수정구 복정동 618");
    //     shelter2.setPhoneNumber("031-738-2264");
    //     shelter2.setTargetAnimals("개, 고양이, 기타");
    //     shelter2.setWeekdayOpenTime("09:00");
    //     shelter2.setWeekdayCloseTime("18:00");
    //     shelter2.setWeekendOpenTime("10:00");
    //     shelter2.setWeekendCloseTime("17:00");
    //     shelter2.setClosedDay("토요일");
    //     shelter2.setLatitude("37.4419");
    //     shelter2.setLongitude("127.1225");
    //     shelter2.setVeterinarianCount("5");
    //     shelter2.setMedicalFacilityCount("3");
    //     list.add(shelter2);

    //     // 샘플 데이터 3
    //     ShelterInfoDto shelter3 = new ShelterInfoDto();
    //     shelter3.setShelterName("부산광역시 동물보호센터");
    //     shelter3.setRegistrationNumber("bs001");
    //     shelter3.setOrganizationName("부산광역시");
    //     shelter3.setDivisionName("보건환경연구원");
    //     shelter3.setRoadAddress("부산광역시 강서구 대저2동 2314");
    //     shelter3.setLotAddress("부산광역시 강서구 대저2동 2314");
    //     shelter3.setPhoneNumber("051-888-6300");
    //     shelter3.setTargetAnimals("개, 고양이");
    //     shelter3.setWeekdayOpenTime("09:00");
    //     shelter3.setWeekdayCloseTime("18:00");
    //     shelter3.setWeekendOpenTime("09:00");
    //     shelter3.setWeekendCloseTime("18:00");
    //     shelter3.setClosedDay("일요일");
    //     shelter3.setLatitude("35.1796");
    //     shelter3.setLongitude("128.9784");
    //     shelter3.setVeterinarianCount("4");
    //     shelter3.setMedicalFacilityCount("2");
    //     list.add(shelter3);

    //     return list;
    // }

    // /**
    //  * 샘플 상세 데이터 조회 (실제 구현 시 API 호출로 대체)
    //  */
    // private ShelterInfoDto getSampleShelterDetail(String registrationNumber) {
    //     List<ShelterInfoDto> list = getSampleShelterData();

    //     for (ShelterInfoDto shelter : list) {
    //         if (shelter.getRegistrationNumber().equals(registrationNumber)) {
    //             return shelter;
    //         }
    //     }

    //     return null;
    // }
}