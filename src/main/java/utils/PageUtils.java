package utils;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageUtils {

    /**
     * 표시할 페이지의 내용을 구성
     * 
     * @param req
     * @param res
     * @param pagePaths
     * @throws IOException
     * @throws ServletException
     */
    public static void forwardWithLayout(HttpServletRequest req, HttpServletResponse res, String[] pagePaths)
            throws ServletException, IOException {
        req.setAttribute("contentPages", Arrays.asList(pagePaths));
        req.getRequestDispatcher("/views/layout/template.jsp").forward(req, res);
    }

    /**
     * 탬플릿을 포함하여 페이지 구성
     * 
     * @param req
     * @param res
     * @param pagePath
     * @throws ServletException
     * @throws IOException
     */
    public static void forwardWithLayout(HttpServletRequest req, HttpServletResponse res, String pagePath)
            throws ServletException, IOException {
        String[] paths = { "/views/common/header.jsp", pagePath, "/views/common/footer.jsp" };
        forwardWithLayout(req, res, paths);
    }

    /**
     * 페이지에 사용할 CSS 파일을 설정
     * 
     * @param req
     * @param cssPath
     */
    public static void setPageCss(HttpServletRequest req, String cssPath) {
        req.setAttribute("pageCss", cssPath);
    }
    
    /**
     * 페이지에 사용할 추가 CSS를 설정
     * 
     * @param req
     * @param css
     */
    public static void setAdditionalCss(HttpServletRequest req, String css) {
        req.setAttribute("additionalCss", css);
    }
}
