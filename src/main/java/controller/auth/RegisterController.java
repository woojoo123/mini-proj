package controller.auth;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 회원가입 컨트롤러 - 새로운 DTO 구조에 맞춘 완전한 구현
 */
@WebServlet("/auth/register")
public class RegisterController extends HttpServlet {

    // private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        // this.userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 로그인된 사용자는 회원가입 페이지 접근 불가
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }

        // 회원가입 페이지 표시
        req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // try {
        //     // 파라미터 수집
        //     RegisterDto registerDto = collectParameters(req);

        //     // 유효성 검증
        //     List<String> errors = validateRegisterDto(registerDto);

        //     if (!errors.isEmpty()) {
        //         // 유효성 검증 실패 시 에러 메시지와 함께 폼으로 돌아감
        //         req.setAttribute("error", String.join("<br>", errors));
        //         req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
        //         return;
        //     }

        //     // UserService를 통한 실제 회원가입 처리
        //     UserDto createdUser = userService.register(registerDto);

        //     if (createdUser != null) {
        //         // 회원가입 성공 시 성공 메시지와 함께 로그인 페이지로 리다이렉트
        //         HttpSession session = req.getSession();
        //         session.setAttribute("registerSuccess", "회원가입이 완료되었습니다. 로그인해주세요.");
        //         resp.sendRedirect(req.getContextPath() + "/auth/login");
        //     } else {
        //         // 회원가입 실패
        //         req.setAttribute("error", "회원가입에 실패했습니다. 잠시 후 다시 시도해주세요.");
        //         req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
        //     }

        // } catch (IllegalArgumentException e) {
        //     // 비즈니스 로직 오류 (중복 이메일 등)
        //     req.setAttribute("error", e.getMessage());
        //     req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
        // } catch (Exception e) {
        //     // 시스템 오류
        //     e.printStackTrace();
        //     req.setAttribute("error", "시스템 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
        //     req.getRequestDispatcher("/WEB-INF/views/auth/register.jsp").forward(req, resp);
        // }
    }

    /**
     * 요청 파라미터를 RegisterDto로 수집 - 새로운 필드 구조에 맞춤
     */
    // private RegisterDto collectParameters(HttpServletRequest req) {
    //     RegisterDto registerDto = new RegisterDto();

    //     // 기본 정보
    //     String username = req.getParameter("username");
    //     String email = req.getParameter("email");
    //     String password = req.getParameter("password");
    //     String passwordConfirm = req.getParameter("passwordConfirm");
    //     String fullName = req.getParameter("fullName");
    //     String phoneNumber = req.getParameter("phoneNumber");
    //     String birthDateStr = req.getParameter("birthDate");
    //     String address = req.getParameter("address");
    //     String postalCode = req.getParameter("postalCode");
    //     String userType = req.getParameter("userType");
    //     String hasExperience = req.getParameter("hasExperience");

    //     // 파라미터가 null인 경우 빈 문자열로 처리
    //     registerDto.setUsername(username != null ? username.trim() : "");
    //     registerDto.setEmail(email != null ? email.trim() : "");
    //     registerDto.setPassword(password != null ? password : "");
    //     registerDto.setPasswordConfirm(passwordConfirm != null ? passwordConfirm : "");
    //     registerDto.setFullName(fullName != null ? fullName.trim() : "");
    //     registerDto.setPhoneNumber(phoneNumber != null ? phoneNumber.trim() : "");
    //     registerDto.setAddress(address != null ? address.trim() : "");
    //     registerDto.setPostalCode(postalCode != null ? postalCode.trim() : "");
    //     registerDto.setUserType(userType != null ? userType : "USER");
    //     registerDto.setHasExperience("true".equals(hasExperience) || "on".equals(hasExperience));

    //     // 생년월일 처리
    //     if (birthDateStr != null && !birthDateStr.trim().isEmpty()) {
    //         try {
    //             LocalDate birthDate = LocalDate.parse(birthDateStr);
    //             registerDto.setBirthDate(birthDate);
    //         } catch (DateTimeParseException e) {
    //             // 날짜 형식이 잘못된 경우 null로 설정 (유효성 검증에서 처리)
    //             registerDto.setBirthDate(null);
    //         }
    //     }

    //     return registerDto;
    // }

    /**
     * RegisterDto 유효성 검증 - 새로운 검증 규칙에 맞춤
     */
    // private List<String> validateRegisterDto(RegisterDto dto) {
    //     List<String> errors = new ArrayList<>();

    //     // 사용자명 검증
    //     if (!dto.isValidUsername()) {
    //         errors.add("사용자명은 3-20자의 영문, 숫자, 언더스코어만 사용 가능합니다.");
    //     }

    //     // 이메일 검증
    //     if (!dto.isValidEmail()) {
    //         errors.add("올바른 이메일 형식을 입력해주세요.");
    //     }

    //     // 비밀번호 검증
    //     if (!dto.isValidPassword()) {
    //         errors.add("비밀번호는 8자 이상이며 영문, 숫자, 특수문자를 포함해야 합니다.");
    //     }

    //     // 비밀번호 확인 검증
    //     if (!dto.isPasswordMatched()) {
    //         errors.add("비밀번호가 일치하지 않습니다.");
    //     }

    //     // 이름 검증
    //     if (!dto.isValidFullName()) {
    //         errors.add("이름을 올바르게 입력해주세요.");
    //     }

    //     // 연락처 검증
    //     if (!dto.isValidPhone()) {
    //         errors.add("연락처는 010-0000-0000 형식으로 입력해주세요.");
    //     }

    //     // 생년월일 검증
    //     if (!dto.isValidBirthDate()) {
    //         errors.add("만 14세 이상만 가입 가능합니다.");
    //     }

    //     // 주소 검증
    //     if (dto.getAddress() == null || dto.getAddress().trim().isEmpty()) {
    //         errors.add("주소를 입력해주세요.");
    //     }

    //     // 우편번호 검증
    //     if (!dto.isValidPostalCode()) {
    //         errors.add("우편번호는 5자리 숫자로 입력해주세요.");
    //     }

    //     // 회원 유형 검증
    //     if (!dto.isValidUserType()) {
    //         errors.add("올바른 회원 유형을 선택해주세요.");
    //     }

    //     return errors;
    // }
}