package dao2;

import dto.Member;

public interface IMemberDao {
	 
	public int memberCheck(String email, String pwd); //멤버정보가 존재하는지 확인하는 메소드
	public Member getMember(int mem_id); //멤버번호로 회원정보 가져오는 메소드
	public boolean confirmEmail(String email); //아이디 중복체크 하는 메소드
	public int insertMember(Member member); //멤버 추가하는 메소드
	public int updateMember(Member member); //멤버 정보를 수정하는 메소드 
	public int deleteMember(int mem_id); //멤버  정보를 삭제하는 메소드
	public int getMoney(int mem_id); //적립금 가져오는 메소드 
	public int updateMoney(int mem_id, int money); //적립금 수정하는 메소드 
}
