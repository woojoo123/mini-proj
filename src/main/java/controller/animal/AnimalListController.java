package controller.animal;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PageUtils;

/**
 * 전체 동물 목록 컨트롤러
 */
@WebServlet("/animal/list")
public class AnimalListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // TODO: 검색 파라미터 처리
        String searchName = req.getParameter("name");
        String species = req.getParameter("species");
        String status = req.getParameter("status");

        // TODO: 페이징 파라미터 처리
        int page = 1;
        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (NumberFormatException e) {
            page = 1;
        }

        // TODO: AnimalService를 통한 동물 목록 조회
        // List<AnimalDto> animals = animalService.findAll(searchDto, pageDto);
        // req.setAttribute("animals", animals);

        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/animal/list.jsp");
    }
}