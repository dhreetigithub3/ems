package com.example.education;

import java.util.List;

public interface FaqService {
    Faq saveFaq(Faq faqs);

    List<Faq> getFaq();
}
