package gameComment;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommentService;

@WebServlet("/comment/list")
public class CommentListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String category = request.getParameter("category");
		int loadNumber = Integer.parseInt(request.getParameter("loadNumber"));
		
		
		CommentService service = new CommentService();
		
		String data = service.loadCommentInfoToJson(category, loadNumber);
		
		System.out.println(data);
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(data);
		out.close();
		
	}

}
