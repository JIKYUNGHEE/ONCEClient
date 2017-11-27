package once.customer.control;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.util.WebUtils;

import once.customer.service.CustomerService;
import once.customer.vo.CustomerVO;

@SessionAttributes("loginVO")
@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;

	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login(CustomerVO customer, @CookieValue(value = "saveId", required = false) Cookie sCookie,
			Model model) {

		String id = "";

		if (sCookie != null) {
			id = sCookie.getValue();
			customer.setSaveId(true);
		}

		customer.setId(id);
		System.out.println(id);

		model.addAttribute("customer", customer);

		return "login/loginForm";
	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String loginProcess(CustomerVO customer, Model model, HttpServletResponse response, HttpSession session) {
		String returnURL = "";

		CustomerVO loginVO = service.login(customer);

		if (loginVO == null) {
			model.addAttribute("message", "Please check your ID or Password");

			returnURL = "login/loginFail";
		} else {
			session.setAttribute("loginVO", loginVO);

			model.addAttribute("loginVO", loginVO);
			model.addAttribute("message", "환영합니다.");

			Cookie sCookie = new Cookie("saveId", loginVO.getId()); // id저장
			Cookie aCookie = new Cookie("autoLogin", loginVO.getId()); // 자동로그인

			if (customer.isSaveId()) {
				sCookie.setMaxAge(60 * 60 * 24 * 14); // 단위(s) | 14일
				sCookie.setPath("/");
			} else if (customer.isAutoLogin()) {
				aCookie.setMaxAge(60 * 60 * 24 * 31); // 단위(s) | 31일
				aCookie.setPath("/");
			} else {
				sCookie.setMaxAge(0);
				aCookie.setMaxAge(0);
			}
			response.addCookie(sCookie);
			response.addCookie(aCookie);
			returnURL = "login/loginSuccess";
		}

		return returnURL;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		Object obj = session.getAttribute("loginVO");

		if (obj != null) {
			CustomerVO loginVO = (CustomerVO) obj;

			session.removeAttribute("loginVO");
			session.invalidate();
		}

		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

		if (loginCookie != null) {
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
		}

		System.out.println("로그아웃 성공");

		return "redirect:/";
	}

	@RequestMapping(value = "/mypage/mypageMain")
	public String mypage() {
		return "mypage/mypageMain";
	}

	@RequestMapping("/mypage/faq")
	   public String faq() {
		   return "mypage/faq";
	   }
	   
	   @RequestMapping("/menu/1F")
	   public String firstfloor() {
		   return "menu/1F";
	   }
	   
	   @RequestMapping("/menu/2F")
	   public String secondfloor() {
		   return "menu/2F";
	   }
	   
	   @RequestMapping("/menu/3F")
	   public String thirdfloor() {
		   return "menu/3F";
	   }
	   
	   @RequestMapping("/menu/men")
	   public String men() {
		   return "menu/men";
	   }
	   
	   @RequestMapping("/menu/women")
	   public String women() {
		   return "menu/women";
	   }
	   
	   @RequestMapping("/menu/kids")
	   public String kids() {
		   return "menu/kids";
	   }
	   
	   @RequestMapping("/menu/shoes")
	   public String shoes() {
		   return "menu/shoes";
	   }
  
  	// 패스워드 체크 페이지
	  @RequestMapping(value = "/mypage/check", method = RequestMethod.GET)
	  public String checkForm() {
		  return "mypage/check";
	}

	// 패스워드 체크 처리
	@RequestMapping(value = "/mypage/check", method = RequestMethod.POST)
	public String check(@ModelAttribute("loginVO") CustomerVO customer, Model model) {
		String id = customer.getId();
		boolean result = service.checkPassword(customer.getId(), customer.getPassword());

		if (result == false) {
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "mypage/checkProcess";
		}

		// 회원 정보 상세 페이지
		service.selectById(id);
		model.addAttribute("customerVO", customer);
		return "mypage/detail";
	}

	// 회원 정보 수정 처리
	@RequestMapping(value = "/mypage/detail/{id}", method = RequestMethod.GET)
	public String modify(@PathVariable String id, @ModelAttribute @Valid CustomerVO customer, Model model) {
		service.modifyCustomer(customer.getId(), customer.getPassword(), customer.getTelephone(), customer.getOrderPassword());
		model.addAttribute("customerVO", customer);
		model.addAttribute("message", "회원 정보 수정이 성공적으로 완료되었습니다.");

		return "mypage/modifyProcess";
	}
	
	//회원 정보 탈퇴 페이지
	@RequestMapping(value = "/mypage/delete", method = RequestMethod.GET)
	public String deleteForm(@ModelAttribute("loginVO") CustomerVO customer, Model model) {
		model.addAttribute("customerVO", customer);
		return "mypage/delete";
	}

	// 회원 정보 탈퇴 처리
	@RequestMapping(value = "/mypage/delete", method = RequestMethod.POST)
	public String delete(@ModelAttribute @Valid CustomerVO customer, Model model) {
		service.deleteCustomer(customer.getId());
		model.addAttribute("message", "회원 탈퇴가 성공적으로 완료되었습니다. 지금까지 이용해 주셔서 감사합니다.");
		System.out.println("111111");
		return "mypage/deleteProcess";
	}

	// 회원가입 - 약관동의
	@RequestMapping("/signup/terms")
	public String terms() {
		return "signup/terms";
	}

	// 회원가입 - 입력창
	@RequestMapping(value = "/signup/signupMain", method=RequestMethod.GET)
	public String signupMainForm(Model model) {
		CustomerVO customerVO = new CustomerVO();
		model.addAttribute("customerVO", customerVO);
		return "signup/signupMain";
	}
	
	@RequestMapping(value = "/signup/signupMain", method=RequestMethod.POST)
	public String signupMain(@Valid CustomerVO customerVO) {
		System.out.println("customer테스트 " +customerVO);
		service.join(customerVO);
		return "signup/signupSuccess";
	}
	
	// 회원가입 - 가입 완료
	@RequestMapping("/signup/signupSuccess")
	public String signupSuccess() {
		return "signup/signupSuccess";
	}
	
	// 회원가입 - 가입 완료
	@RequestMapping("/signup/findId")
	public String findId() {
		return "signup/findId";
	}
	
	// 회원가입 - 아이디 중복 체크
	@RequestMapping(value = "/signup/checkId", method=RequestMethod.GET)
	@ResponseBody
	public boolean checkId(@RequestParam(value="id") String id) {
		System.out.println(id);
		return service.checkId(id);
	}
	/*
	// email
	@RequestMapping(value="emailConfirm", method=RequestMethod.GET)
	    public String emailConfirm(String key, Model model){
	        try {
	            service.emailConfirm(customerVO);
	            model.addAttribute("check", true);
	        } catch (Exception e) {
	            model.addAttribute("check", false);
	        }
	        return "emailConfirm";
	    }*/

}





