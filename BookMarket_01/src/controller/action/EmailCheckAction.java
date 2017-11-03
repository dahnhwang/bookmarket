package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.MemberDao;

public class EmailCheckAction implements Action {
 
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		MemberDao mDao = MemberDao.getInstance();
		boolean result = mDao.confirmEmail(email);
		JsonObject jo = new JsonObject();
		jo.addProperty("result", result);
		Gson gson = new Gson();
		String jsonString = gson.toJson(jo);
		PrintWriter pw = response.getWriter();
		pw.println(jsonString);
		pw.flush();
		return;

	}

}
