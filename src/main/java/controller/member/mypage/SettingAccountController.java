package controller.member.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

/**
 * Servlet implementation class SettingAccountController
 */
@WebServlet("/member/mypage/settingAccount")
public class SettingAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SettingAccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto member = new MemberDto();
		member.setEmail("hong@kosta.com");
		session.setAttribute("user", member);
		
		request.getRequestDispatcher("/views/member/mypage/setting/settings-account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("user");
		
		String email = member.getEmail();
		
		request.setCharacterEncoding("utf-8");
		String curPassword = request.getParameter("curPassword");
		String newPassword = request.getParameter("newPassword");
		try {
			MemberService service = new MemberServiceImpl();
			service.changePassword(email, curPassword, newPassword);
			response.sendRedirect("/pumda/member/mypage/settingAccount");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("/views/member/mypage/error.jsp").forward(request, response);
			
		}
		
	}

}
