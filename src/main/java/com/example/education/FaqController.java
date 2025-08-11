package com.example.education;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class FaqController {
    private FaqService faqService;
    @Autowired
    public FaqController(FaqService faqService){
        this.faqService=faqService;
    }
	@GetMapping("/faqs")
    public String faqs(Model model){
        List<Faq>faqs=faqService.getFaq();
        model.addAttribute("faqs", faqs);
        return "faq";
    }
    @GetMapping("/admin-faq")
	public String admin_faq()
	{
		return "adminfaq";
	}
    @PostMapping("/save-faq")
    public String save_faq(@RequestParam String question, @RequestParam String answer,Model model,HttpSession session){
        Faq faq = new Faq();
        String name=(String)session.getAttribute("name");
        faq.setQuestion(question);
        faq.setAnswer(answer);
        faq.setSubmitted_by(name);
        faqService.saveFaq(faq);
        model.addAttribute("message", "Successfully Submitted");
        return "adminfaq";
    }
}
