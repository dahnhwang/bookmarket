package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.MemberDao;
import dto.Member;

public class MyPwdCheckAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String password = request.getParameter("password").trim();
		System.out.println("MyPwdCheckAction/password : "+password);
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println("MyPwdCheckAction/email : "+loginUser.getEmail());
		MemberDao mDao = MemberDao.getInstance();
		int memberCheck = mDao.memberCheck(loginUser.getEmail(), password);
		System.out.println("MyPwdCheckAction/memberCheck : "+memberCheck);
//		JsonObject jo = new JsonObject();
		int result = 0;
		if(memberCheck > 0) {
			result = 1;
//			jo.addProperty("result", result);
		}
//		else {
//			boolean result = false;
//			System.out.println("Action/result: "+result);
//			jo.addProperty("result", result);
//		}
//		Gson gson = new Gson();
//		String jsonString = gson.toJson(jo);
		System.out.println(result);
		PrintWriter pw = response.getWriter();
//		pw.println(jsonString);
		pw.println(result);
		pw.flush();
		return;
	}

}
