package com.example.education;
import java.sql.Date;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name="faq")
@Data
public class Faq {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int slno;
    @Column(name="question",nullable = false)
    private String question;
    @Column(name="answer",nullable = false)
    private String answer;
    @Column(name="submitted_by",nullable = false)
    private String submitted_by;
    @Column(name="date",insertable=false,nullable = false,columnDefinition = "date default current_timestamp")
    private Date date;
    @Column(name="visible",insertable=false,nullable = false,columnDefinition = "varchar(10) default 'yes'")
    private String visible;
}
