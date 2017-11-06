package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.MainServlet;
import dao.IMemberDao;
import dao.MemberDao;
import dto.Member;

public class DropMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		IMemberDao mDao = MemberDao.getInstance();
		
		int result = mDao.deleteMember(loginUser.getMem_id());
		if(result > 0)
			session.removeAttribute("loginUser");
		System.out.println("updateAction/result: "+result);
		new MainAction().execute(request, response);
		
	}

}
