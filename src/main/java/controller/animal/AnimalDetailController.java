package controller.animal;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PageUtils;

/**
 * 동물 상세 정보 컨트롤러
 */
@WebServlet("/animal/detail/*")
public class AnimalDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // URL에서 동물 ID 추출
        String pathInfo = req.getPathInfo();
        if (pathInfo == null || pathInfo.length() <= 1) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "동물 ID가 필요합니다.");
            return;
        }

        String animalIdStr = pathInfo.substring(1); // 맨 앞의 '/' 제거
        Long animalId;
        try {
            animalId = Long.parseLong(animalIdStr);
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "올바르지 않은 동물 ID입니다.");
            return;
        }

        // TODO: AnimalService를 통한 동물 상세 정보 조회
        // AnimalDetailDto animal = animalService.findById(animalId);
        // if (animal == null) {
        //     resp.sendError(HttpServletResponse.SC_NOT_FOUND, "동물을 찾을 수 없습니다.");
        //     return;
        // }

        // req.setAttribute("animal", animal);

        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/animal/detail.jsp");
    }
}