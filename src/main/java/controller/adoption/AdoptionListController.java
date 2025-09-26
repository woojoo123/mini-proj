package controller.adoption;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PageUtils;

/**
 * 입양 대기 동물 목록 컨트롤러
 */
@WebServlet("/adoption/list")
public class AdoptionListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // TODO: 필터 파라미터 처리
        String species = req.getParameter("species");
        String size = req.getParameter("size");
        String age = req.getParameter("age");

        // TODO: 페이징 파라미터 처리
        int page = 1;
        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }

        // TODO: AdoptionService를 통한 입양 가능한 동물 목록 조회
        // AdoptionSearchDto searchDto = new AdoptionSearchDto(species, size, age);
        // PageDto pageDto = new PageDto(page, 12);
        // List<AnimalDto> adoptionAnimals = adoptionService.findAvailableAnimals(searchDto, pageDto);
        // req.setAttribute("adoptionAnimals", adoptionAnimals);

        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/animal/adoption-list.jsp");
    }
}