package com.example.education;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImp implements FaqService {
    private FaqRepo faqRepo;
    @Autowired
    public FaqServiceImp(FaqRepo faqRepo){
        this.faqRepo=faqRepo;
    }
    @Override
    public Faq saveFaq(Faq faq){
        return faqRepo.save(faq);
    }
    @Override
    public List<Faq> getFaq(){
        return faqRepo.findAll();
    }
}
