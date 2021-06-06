package nshin.spring.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import nshin.spring.service.SungJukService;
import nshin.spring.vo.SungJuk;

@Controller
public class SungJukController {
	
	@Autowired
	private SungJukService sjsrv;
	
	@RequestMapping("/sungjuk")  // get 방식으로 호출(정적으로 그냥 sungjuk.tiles 보여줌) =>단순히 페이지 출력
	public String sungjuk() {
		return "sungjuk.tiles";
	}	
	
	@RequestMapping(value="/sungjuk", method=RequestMethod.POST)  // get 방식으로 호출(정적으로 그냥 sungjuk.tiles 보여줌) =>단순히 페이지 출력
	public ModelAndView sungjukok(SungJuk sj) {
	
		sjsrv.computeSungJuk(sj); // 총점 평균 학점 계산됨
		
		// 컨트롤러에서 처리한 결과를 뷰에 넘기려면 
		// 뷰이름과 뷰에 보여줄 데이터를 ModelAndView객체에 담아 처리하면 됨 
		// sungjukok에 있는 내용 출력
		ModelAndView mv = new ModelAndView();
		mv.setViewName("sungjukok.tiles");
		mv.addObject("sj", sj);
		
		return mv;
	}	
	
	@RequestMapping(value="/sungjuk2", method=RequestMethod.POST)
	public ModelAndView sungjukok2(SungJuk sj, ModelAndView mv) {
		
		mv.setViewName("sungjukok2.tiles");
;		mv.addObject("sj", sjsrv.newSungJuk(sj));

		return mv;
	}
	
	@RequestMapping(value="/sungjuk2list")
	public ModelAndView sungjuklist(ModelAndView mv) {
		
		mv.setViewName("sungjuklist.tiles");
		mv.addObject("sjs", sjsrv.readAllSungJuk());
		
		return mv;
	}
	
//	@RequestMapping(value="/sungjuk", method=RequestMethod.POST)  // post 방식으로 호출 (computeSungJuk계산후 sungjukok)
//	public ModelAndView sungjukok(SungJuk sj) {
//		
//		sjsrv.computeSungJuk(sj);
//		
//		// 컨트롤러에서 처리한 결과를 뷰에 넘기려면 
//		// 뷰이름과 뷰에 보여줄 데이터를 ModelAndView객체에
//		// 담아 처리하면 됨 
//		// sungjukok에 있는 내용 출
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("sungjukok.tiles");
//		mv.addObject("sj", sj); //(이름=> ${sj.name}에서 sj, 값)
//		
//		return mv;
//	}
//	
//	@RequestMapping(value="/sungjuk2", method=RequestMethod.POST)
//	public ModelAndView sungjukok2(SungJuk sj, ModelAndView mv) {
//		
//		mv.setViewName("sungjukok2.tiles");
//		mv.addObject("sj", sjsrv.newSungJuk(sj));
//		return mv;
//	}
	
}
