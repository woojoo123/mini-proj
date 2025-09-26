package controller.admin.dashboard.iInquiry;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewUser
 */
@WebServlet("/userInquiry/userView")
public class UserView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 // HTTP 요청 본문을 읽기 위한 Reader 객체를 얻음
        BufferedReader reader = request.getReader();
        StringBuilder jsonBody = new StringBuilder();
        String line;
        
        // 요청 본문(JSON)을 한 줄씩 읽어 StringBuilder에 추가
        while ((line = reader.readLine()) != null) {
            jsonBody.append(line);
        }

        // 받은 JSON 문자열
        String receivedJson = jsonBody.toString();
        System.out.println("받은 JSON 데이터: " + receivedJson);

        // 여기에서 Gson, Jackson 같은 라이브러리를 사용해 JSON 문자열을 자바 객체로 변환해야 함
//         예시: Gson gson = new Gson();
        //       UserDto userDto = gson.fromJson(receivedJson, UserDto.class);

        // 클라이언트에게 응답
        response.setContentType("text/plain");
        response.getWriter().write("데이터 수신 완료.");
//		doGet(request, response);
	}

}
