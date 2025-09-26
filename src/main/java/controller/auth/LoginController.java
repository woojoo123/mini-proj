package controller.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 로그인 컨트롤러 - 새로운 DTO 구조에 맞춘 완전한 구현
 */
@WebServlet("/auth/login")
public class LoginController extends HttpServlet {


    @Override
    public void init() throws ServletException {
        super.init();
        // this.userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // 이미 로그인된 사용자는 홈으로 리다이렉트
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }

        // 회원가입 성공 메시지가 있다면 request에 전달하고 세션에서 제거
        if (session != null && session.getAttribute("registerSuccess") != null) {
            req.setAttribute("registerSuccess", session.getAttribute("registerSuccess"));
            session.removeAttribute("registerSuccess");
        }

        // 로그인 페이지 표시
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // try {
            // 파라미터 수집
            // LoginDto loginDto = collectParameters(req);

            // 유효성 검증
            // if (!loginDto.isValid()) {
            //     req.setAttribute("error", "로그인 정보를 올바르게 입력해주세요.");
            //     req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
            //     return;
            // }

            // UserService를 통한 실제 로그인 처리
            // UserDto loginUser = userService.login(loginDto);

        //     if (loginUser != null) {
        //         // 로그인 성공 - 세션에 사용자 정보 저장
        //         HttpSession session = req.getSession();
        //         session.setAttribute("user", loginUser);
        //         session.setAttribute("userId", loginUser.getId());
        //         session.setAttribute("username", loginUser.getUsername());
        //         session.setAttribute("userType", loginUser.getUserType());

        //         // 로그인 성공 후 리다이렉트할 URL 확인
        //         String redirectUrl = req.getParameter("redirect");
        //         if (redirectUrl != null && !redirectUrl.trim().isEmpty()) {
        //             resp.sendRedirect(redirectUrl);
        //         } else {
        //             resp.sendRedirect(req.getContextPath() + "/");
        //         }
        //     } else {
        //         // 로그인 실패
        //         req.setAttribute("error", "로그인에 실패했습니다.");
        //         req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
        //     }

        // } catch (IllegalArgumentException e) {
        //     // 비즈니스 로직 오류 (존재하지 않는 사용자, 비밀번호 불일치 등)
        //     req.setAttribute("error", e.getMessage());
        //     req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
        // } catch (Exception e) {
        //     // 시스템 오류
        //     e.printStackTrace();
        //     req.setAttribute("error", "시스템 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
        //     req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
        // }
    }

    /**
     * 요청 파라미터를 LoginDto로 수집
     */
    // private LoginDto collectParameters(HttpServletRequest req) {
    //     LoginDto loginDto = new LoginDto();

    //     String loginId = req.getParameter("loginId");
    //     String password = req.getParameter("password");

    //     // 파라미터가 null인 경우 빈 문자열로 처리
    //     loginDto.setLoginId(loginId != null ? loginId.trim() : "");
    //     loginDto.setPassword(password != null ? password : "");

    //     return loginDto;
    // }
}