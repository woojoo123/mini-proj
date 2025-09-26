package controller.shelter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PageUtils;

/**
 * 보호소 목록 컨트롤러
 */
@WebServlet("/shelter/list")
public class ShelterListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // TODO: 보호소 목록 데이터 로드
        PageUtils.forwardWithLayout(req, resp, "/WEB-INF/views/shelter/list.jsp");
    }
}