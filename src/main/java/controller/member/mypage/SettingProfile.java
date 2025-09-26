package controller.member.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MemberDto;
import service.member.MemberService;
import service.member.MemberServiceImpl;

@WebServlet("/member/mypage/settingProfile")
public class SettingProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SettingProfile() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			MemberService service = new MemberServiceImpl();
			MemberDto member = service.getMemberByEmail("hong@kosta.com");
			member.setPasswordHash(null);
			HttpSession session = request.getSession();
			session.setAttribute("user", member);
			
			request.getRequestDispatcher("/views/member/mypage/setting/settings-profile.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = request.getServletContext().getRealPath("upload");
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String username = multi.getParameter("username");
		String fullName = multi.getParameter("fullName");
		String nickname = multi.getParameter("nickname");
		String phoneNumber = multi.getParameter("phoneNumber");
		String bio = multi.getParameter("bio");
		String address = multi.getParameter("address");
		String detailAddress = multi.getParameter("detailAddress");
		String filename = multi.getFilesystemName("file");
		
		MemberDto member = new MemberDto();
		member.setUsername(username);
		member.setFullName(fullName);
		member.setNickname(nickname);
		member.setPhoneNumber(phoneNumber);
		member.setBio(bio);
		member.setAddress(address);
		member.setDetailAddress(detailAddress);
		member.setProfileImageUrl(filename);
		try {
			MemberService service = new MemberServiceImpl();
			service.changeProfile(member);
			HttpSession session = request.getSession();
			session.removeAttribute("user");
			MemberDto reMember =service.getMemberByUsername(username);
			reMember.setPasswordHash(null);
			System.out.println(reMember);
			session.setAttribute("user", reMember);
			request.getRequestDispatcher("/views/member/mypage/setting/settings-profile.jsp").forward(request, response);			
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("/views/member/mypage/error.jsp").forward(request, response);
		}
	}

}
