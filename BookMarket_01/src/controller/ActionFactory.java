package controller;

import controller.action.Action;
import controller.action.BiddingAction;
import controller.action.BiddingChoiceAction;
import controller.action.BiddingChoiceFormAction;
import controller.action.BiddingFormAction;
import controller.action.BookDeleteAction;
import controller.action.BookInsertAction;
import controller.action.BookInsertFormAction;
import controller.action.BookListAction;
import controller.action.BookMoneyCheckAction;
import controller.action.BookNavigationAction;
import controller.action.BookUpdateAction;
import controller.action.BookUpdateFormAction;
import controller.action.CartAction;
import controller.action.CartAddAction;
import controller.action.DetailBookAction;
import controller.action.DropMemberAction;
import controller.action.DropMemberFormAction;
import controller.action.EmailCheckAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.KeepBookAddAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.MainAction;
import controller.action.MyInfoAction;
import controller.action.MyInfoUpdateAction;
import controller.action.MyInfoUpdateFormAction;
import controller.action.MyKeepBookDeleteAction;
import controller.action.MyKeepBookListAction;
import controller.action.MyKeepBookPurchaseAction;
import controller.action.MyMoneyAction;
import controller.action.MyMoneyChargeAction;
import controller.action.MyMoneyChargeFormAction;
import controller.action.MyPageAction;
import controller.action.MyPurchaseListAction;
import controller.action.MyPwdCheckAction;
import controller.action.MySellListAction;
import controller.action.NaverApiAction;
import controller.action.NavigationAction;
import controller.action.PaymentAction;
import controller.action.PaymentCheckPassAction;
import controller.action.PaymentCompleteAction;
import controller.action.PaymentSuccessAction;
import controller.action.SearchAction;

public class ActionFactory {

	private static ActionFactory instance = null;

	public static ActionFactory getInstance() {
		if (instance == null) {
			instance = new ActionFactory();
		}
		return instance;
	}

	private ActionFactory() {
		super();
	}

	public Action getAction(String command) {
		Action action = null;

		if (command.equals("main")) {
			System.out.println("메인!");
			action = new MainAction();
		} else if (command.equals("navigation")) {
			action = new NavigationAction();
		} else if (command.equals("join_form")) {
			action = new JoinFormAction();
		} else if (command.equals("join")) {
			action = new JoinAction();
		} else if (command.equals("login_form")) {
			action = new LoginFormAction();
		} else if (command.equals("login")) {
			action = new LoginAction();
		} else if (command.equals("email_check")) {
			action = new EmailCheckAction();
		} else if (command.equals("logout")) { 
			action = new LogoutAction();
		} else if (command.equals("cart")) {
			action = new CartAction();
		} else if (command.equals("search_list")) {
			action = new SearchAction();
		} else if (command.equals("book_list")) {
			action = new BookListAction();
		} else if (command.equals("detail_book")) {
			action = new DetailBookAction();
		} else if (command.equals("book_navigation")) {
			action = new BookNavigationAction();
		} else if (command.equals("book_update_form")) {
			action = new BookUpdateFormAction();
		} else if (command.equals("book_update")) {
			action = new BookUpdateAction();
		} else if (command.equals("book_Insert_form")) {
			action = new BookInsertFormAction();
		} else if (command.equals("book_api")) {
			action = new NaverApiAction();
		} else if (command.equals("book_insert")) {
			action = new BookInsertAction();
		} else if (command.equals("book_delete")) {
			action = new BookDeleteAction();
		} else if (command.equals("keepBook_add")) {
			action = new KeepBookAddAction();
		} else if (command.equals("cart_add")) {
			action = new CartAddAction();
		} else if (command.equals("mypage")) {
			action = new MyPageAction();
		} else if (command.equals("myInfo")) {
			action = new MyInfoAction();
		} else if (command.equals("myInfo_update_form")) {
			action = new MyInfoUpdateFormAction();
		} else if (command.equals("myInfo_update")) {
			action = new MyInfoUpdateAction();
		} else if (command.equals("myBookMoney")) {
			action = new MyMoneyAction();
		} else if (command.equals("myBookMoney_charge_form")) {
			action = new MyMoneyChargeFormAction();
		} else if (command.equals("myBookMoney_charge")) {
			action = new MyMoneyChargeAction();
		} else if (command.equals("myPurchase_list")) {
			action = new MyPurchaseListAction();
		} else if (command.equals("mySell_list")) {
			action = new MySellListAction();
		} else if (command.equals("myKeep_list")) {
			action = new MyKeepBookListAction();
		} else if (command.equals("myKeepBook_purchase")) {
			action = new MyKeepBookPurchaseAction();
		} else if (command.equals("myKeepBook_delete")) {
			action = new MyKeepBookDeleteAction();
		} else if (command.equals("myPwd_check")) {
			action = new MyPwdCheckAction();
		} else if (command.equals("drop_member")) {
			action = new DropMemberAction();
		} else if (command.equals("drop_member_from")) {
			action = new DropMemberFormAction();
		} else if (command.equals("payment")) {
			action = new PaymentAction();
		}else if (command.equals("bookMoney_check")) {
			action = new BookMoneyCheckAction();
		}else if (command.equals("payment_check_ pass")) {
			action = new PaymentCheckPassAction();
		}else if (command.equals("bidding_form")) {
			action = new BiddingFormAction();
		}else if (command.equals("bidding")) {
			action = new BiddingAction();
		}else if (command.equals("bidding_choice_form")) {
			action = new BiddingChoiceFormAction();
		}else if (command.equals("bidding_choice")) {
			action = new BiddingChoiceAction();
		}else if (command.equals("payment_success")) {
			action = new PaymentSuccessAction();
		}else if (command.equals("payment_complete")) {
			action = new PaymentCompleteAction();
		}

		System.out.println("ActionFactory: " + command);
		return action;

	}

}
