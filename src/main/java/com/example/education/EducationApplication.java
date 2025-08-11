package com.example.education;
import java.io.*;
import java.nio.file.*;
import java.sql.*;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


import jakarta.servlet.http.HttpSession;

import com.example.education.model.*;


@SpringBootApplication
@Controller

public class EducationApplication {
	@Autowired
	JdbcTemplate jdbc;

	@GetMapping("/index")
	public String index()
	{
		return "index";
	}
	@GetMapping("/register")
	public String register()
	{
		return "register";
	}
	@GetMapping("/login")
	public String login()
	{
		return "login";
	}
	@GetMapping("/contact")
	public String contact()
	{
		return "contact";
	}
	@PostMapping("/savecontact")
	public String savecontcats(@RequestParam("name")String name,@RequestParam("mobile")String mobile,@RequestParam("email")String email,@RequestParam("message")String message,Model model){
		jdbc.execute("insert into save_contact (name,mobile,email,message) values ('"+name+"','"+mobile+"','"+email+"','"+message+"')");
		model.addAttribute("message", "Contact Information Saved.");
		return "contact";
	}
	@PostMapping("/register-user")
	public String register_user(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("mobile")String mobile,@RequestParam("role")String role,Model model){
	ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select email from user_master where email='"+email+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(1));
				return "";
			}
		});	
		if(ali.isEmpty())
		{
			jdbc.execute("Insert into user_master (name,email,password,mobile,role) values ('"+name+"','"+email+"','"+password+"','"+mobile+"','"+role+"')");
			model.addAttribute("message","Register Success...!!!");
			return "register";
		}else{
			model.addAttribute("message","User account already exist...");
			return "register";
		}
	}

	//--------------------------------Admin Starting----------------------------------------------------------------------------------------
	
	@GetMapping("/admin-dashboard")
	public String admin_dashboard()
	{
		return "admindashboard";
	}

	@PostMapping("/login-check")
	public String login_check(@RequestParam("email")String email,@RequestParam("password")String password,Model model,HttpSession session){
		ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select * from user_master where email='"+email+"' and password='"+password+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(2));
				ali.add(rs.getString(3));
				ali.add(rs.getString(5));
				ali.add(rs.getString(6));
				return "";
			}
		});
		if(ali.isEmpty())
		{
			model.addAttribute("message","Invalid Details !!!");
			return "login";

		}else{
			session.setAttribute("name",ali.get(0));
			session.setAttribute("email",ali.get(1));
			if((ali.get(3)).equalsIgnoreCase("admin"))
			{
				return "admindashboard";
			}
			else if((ali.get(3)).equalsIgnoreCase("faculty"))
			{
				return "facultydashboard";
			}
			else if((ali.get(3)).equalsIgnoreCase("student"))
			{
				return "studentdashboard";
			}else{
				return "login";
			}
		}
	}

	@GetMapping("/admin-users")
	public String admin_users(Model model)
	{

		String sql="select * from user_master";
		List<Map<String,Object>>usermaster=jdbc.queryForList(sql);
		model.addAttribute("usermaster", usermaster);
		return "adminusers";
	}

	@GetMapping("/admin-register-user")
	public String admin_register()
	{
		return "adminregister";
	}
	@PostMapping("/admin-register-user")
	public String admin_register_user(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("mobile")String mobile,@RequestParam("role")String role,Model model){
		ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select email from user_master where email='"+email+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(1));
				return "";
			}
		});	
		if(ali.isEmpty())
		{
			jdbc.execute("Insert into user_master (name,email,password,mobile,role) values ('"+name+"','"+email+"','"+password+"','"+mobile+"','"+role+"')");
			model.addAttribute("message","Register Success...!!!");
			return "adminregister";
		}else{
			model.addAttribute("message","User account already exist...");
			return "adminregister";
		}
	}

	@PostMapping("/admin-manage-users")
	public String admin_manage_users(@RequestParam("email")String email,@RequestParam("btn")String btn,Model model)
	{
		if(btn.equalsIgnoreCase("delete"))
		{
			String sql="delete from user_master where email=?";
			jdbc.update(sql,email);
			model.addAttribute("message","Record Deleted...!!!");
			return admin_users(model);
		}
		String sql="Select * from user_master where email='"+email+"'";
		List<Map<String,Object>>usermaster=jdbc.queryForList(sql);
		model.addAttribute("usermaster", usermaster);
		return "adminedituser";
	}

	@PostMapping("/admin-update-users")
	public String admin_update_users(@RequestParam("email")String email,@RequestParam("name")String name,@RequestParam("mobile")String mobile,@RequestParam("role")String role,Model model)
	{
		String sql1="update user_master set name=?,mobile=?,role=? where email=?";
		jdbc.update(sql1,name,mobile,role,email);

		model.addAttribute("message","Sucessfully Updated.");

		return "adminedituser";
	}

	@GetMapping("/admin-save-contact")
	public String admin_save_contact(Model model)
	{
		String sql="select * from save_contact";
		List<Map<String,Object>>adminsavecontact=jdbc.queryForList(sql);
		model.addAttribute("adminsavecontact",adminsavecontact);
		return "adminsavecontact";
	}
	

//--------------------------------------------Faculty Starting-----------------------------------------

	@GetMapping("/faculty-dashboard")
	public String faculty_dashboard()
	{
		return "facultydashboard";
	}

	@GetMapping("/faculty-users")
	public String faculty_users(Model model)
	{

		String sql="select * from user_master";
		List<Map<String,Object>>usermaster=jdbc.queryForList(sql);
		model.addAttribute("usermaster", usermaster);
		return "facultyusers";
	}

	@GetMapping("/faculty-register-user")
	public String faculty_register()
	{
		return "facultyregister";
	}
	@PostMapping("/faculty-register-user")
	public String faculty_register_user(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("password")String password,@RequestParam("mobile")String mobile,@RequestParam("role")String role,Model model){
		ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select email from user_master where email='"+email+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(1));
				return "";
			}
		});	
		if(ali.isEmpty())
		{
			jdbc.execute("Insert into user_master (name,email,password,mobile,role) values ('"+name+"','"+email+"','"+password+"','"+mobile+"','"+role+"')");
			model.addAttribute("message","Register Success...!!!");
			return "facultyregister";
		}else{
			model.addAttribute("message","User account already exist...");
			return "facultyregister";
		}
	}

	@PostMapping("/faculty-manage-users")
	public String faculty_manage_users(@RequestParam("email")String email,@RequestParam("btn")String btn,Model model)
	{
		if(btn.equalsIgnoreCase("delete"))
		{
			String sql="delete from user_master where email=?";
			jdbc.update(sql,email);
			model.addAttribute("message","Record Deleted...!!!");
			return faculty_users(model);
		}
		String sql="Select * from user_master where email='"+email+"'";
		List<Map<String,Object>>usermaster=jdbc.queryForList(sql);
		model.addAttribute("usermaster", usermaster);
		return "facultyedituser";
	}

	@PostMapping("/faculty-update-users")
	public String faculty_update_users(@RequestParam("email")String email,@RequestParam("name")String name,@RequestParam("mobile")String mobile,@RequestParam("role")String role,Model model)
	{
		String sql1="update user_master set name=?,mobile=?,role=? where email=?";
		jdbc.update(sql1,name,mobile,role,email);

		model.addAttribute("message","Sucessfully Updated.");

		return "facultyedituser";
	}

	@GetMapping("/faculty-save-contact")
	public String faculty_save_contact(Model model)
	{
		String sql="select * from save_contact";
		List<Map<String,Object>>facultysavecontact=jdbc.queryForList(sql);
		model.addAttribute("facultysavecontact", facultysavecontact);
		return "facultysavecontact";
	}

	@GetMapping("/question")
	public String question()
	{
		return "question";
	}

	@PostMapping("/save-questions")
	public String save_question(@RequestParam("question")String question,@RequestParam("opt1")String opt1,@RequestParam("opt2")String opt2,@RequestParam("opt3")String opt3,@RequestParam("opt4")String opt4,@RequestParam("ans")Integer ans,Model model)
	{	
		jdbc.execute("Insert into exam (question,option1,option2,option3,option4,answer) values ('"+question+"','"+opt1+"','"+opt2+"','"+opt3+"','"+opt4+"',"+ans+")");
		model.addAttribute("message","Question Submitted!!!");
		return "question";
	}
	@PostMapping("/save-student-answer")
		public String save_student_answer(@ModelAttribute ExamData ed,HttpSession session,Model model){
			String email=(String)session.getAttribute("email");
			String json_text=ed.toString();

			List<Map<String,Object>>stu_ans=jdbc.queryForList("select slno,answer from exam");
			String stu_ansArray[]=ed.getAnsArray();
			int total_mark=0;
			for(Map<String,Object>rowMap:stu_ans){
				int slno=(int)rowMap.get("slno");
				int ans=(int)rowMap.get("answer");
				int stu_mark=Integer.parseInt(stu_ansArray[slno]);
				if(ans==stu_mark){
					total_mark++;
				}
			}

			String sql="Insert into add_answer(student_id,student_answer,student_mark) values (?,?,?)";
			jdbc.update(sql,email,json_text,total_mark);
			model.addAttribute("message","Successfully Submitted..");
			return "exam";
	}
	@GetMapping("/profile")
	public String profile(HttpSession session,Model model)
	{
		String email=(String)session.getAttribute("email");
		ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select email from profile where email='"+email+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(1));
				return "";
			}
		});
		if(ali.isEmpty())
		{
			return "profile";
		}else{
		// String sql="select name,user_master.email,role,photo,age from 'user_master' left join profile on user_master.email=profile.email where user_master.email='"+email+"'";
		// List<Map<String,Object>>userprofile=jdbc.queryForList(sql);
		// model.addAttribute("userprofile", userprofile);
		String sql="select photo from profile where email=?";
		byte[] imageData=jdbc.queryForObject(sql,byte[].class,email);
			model.addAttribute("imageData", imageData);	
			return "profile";
		}
		
	}
	@PostMapping("/update-profile")
	public String update_profile(@RequestParam("f") MultipartFile f,@RequestParam("age")Integer age,HttpSession session,Model model) throws IOException{
		String email=(String)session.getAttribute("email");
		ArrayList<String> ali=new ArrayList<String>();
		List<String> li=jdbc.query("select email from profile where email='"+email+"'",
		new RowMapper<String>(){
			public String mapRow(ResultSet rs,int rowNum)throws SQLException{
				ali.add(rs.getString(1));
				return "";
			}
		});
		if(ali.isEmpty())
		{
			String sql="insert into profile (email,photo,age) values (?,?,?)";
			jdbc.update(sql,email,f.getBytes(),age);
			model.addAttribute("message","Profile Inserted...!!!");
			return "profile";
		}else{
			jdbc.execute("update profile set photo='"+f.getBytes()+"', age="+age+" where email='"+email+"'");
			model.addAttribute("message","Profile Updated...!!!");
			String sql="select photo from profile where email=?";
			byte[] imageData=jdbc.queryForObject(sql,byte[].class,email);
			model.addAttribute("imageData", imageData);
			return "profile";
		}
		
	}
	
	@GetMapping("/uploadVideo")
	public String uploadVideo() {
		return "facultylayout/uploadVideo";
	}
	
	@PostMapping("/upload-video")
	public String upload_video(@RequestParam("video")MultipartFile video,HttpSession session,Model model) throws IOException{
		String upload_dir="D:\\MavenProgram\\education\\src\\main\\resources\\static\\videos\\";
		String teacher_id= (String)session.getAttribute("email");
		String video_name=video.getOriginalFilename();
		Files.copy(video.getInputStream(),Paths.get(upload_dir+video_name),StandardCopyOption.REPLACE_EXISTING);
		String sql="insert into video_master (video_name,teacher_id) values (?,?)";
		jdbc.update(sql,video_name,teacher_id);
		model.addAttribute("message",video_name+" Uploaded...!!!");
		return "facultylayout/uploadVideo";
	}
	@GetMapping("/faculty-dought")
	public String faculty_dought(Model model){
        String sql="select * from dought";
		List<Map<String,Object>>all_doughts=jdbc.queryForList(sql);
		System.out.println(all_doughts);
        model.addAttribute("all_doughts", all_doughts);
		return "facultylayout/dought";
	}
	@PostMapping("/update-doughts")
    public String update_doughts(@RequestParam Integer slno,@RequestParam String answer,Model model,HttpSession session){
        String femail=(String)session.getAttribute("email");
		String sql="update dought set femail=?,answer=? where slno=?";
		jdbc.update(sql,femail,answer,slno);
        model.addAttribute("message", "Successfully Updated");
        return "facultylayout/dought";
	}
//------------------------------------------------Student Starting--------------------------------------------------------------------

	@GetMapping("/student-dashboard")
	public String student_dashboard()
	{
		return "studentdashboard";
	}
	@GetMapping("/student-users")
	public String student_users(Model model)
	{

		String sql="select * from user_master";
		List<Map<String,Object>>usermaster=jdbc.queryForList(sql);
		model.addAttribute("usermaster", usermaster);
		return "studentusers";
	}
	@GetMapping("/student-exam")
	public String student_exam(Model model)
	{
		String sql="select * from exam";
		List<Map<String,Object>>all_question=jdbc.queryForList(sql);
		model.addAttribute("all_question", all_question);
		return "exam";
	}
	@GetMapping("/result")
 	public String student_result(HttpSession session,Model model){
		String email=(String)session.getAttribute("email");
		List<Map<String,Object>>exam_date=jdbc.queryForList("select exam_date from add_answer where student_id='"+email+"'");
		model.addAttribute("exam_date",exam_date);
		return "result";
	}

	@GetMapping("/teacherUpload")
	public String teacher_upload(Model model) {
		String sql="select * from video_master";
		List<Map<String,Object>>video_data=jdbc.queryForList(sql);
		model.addAttribute("video_data",video_data);
		return "studentlayout/teacherUpload";
	}
	@PostMapping("/show-result-datewise")
	public String show_result_datewise(@RequestParam("date")String date,HttpSession session,Model model) {
		String email=(String)session.getAttribute("email");
		List<Map<String,Object>>exam_date=jdbc.queryForList("select exam_date from add_answer where student_id='"+email+"'");
		model.addAttribute("exam_date",exam_date);

		String sql="select student_mark from add_answer where exam_date='"+date+"'";
		List<Map<String,Object>>total_mark=jdbc.queryForList(sql);
		model.addAttribute("total_mark", total_mark);
		return "result";
	}
	@GetMapping("/doughts")
    public String doughts(Model model){
        String sql="select * from dought";
		List<Map<String,Object>>doughts=jdbc.queryForList(sql);
        model.addAttribute("doughts", doughts);
        return "studentlayout/dought";
    }
	@PostMapping("/save-dought")
    public String save_dought(@RequestParam String question,Model model,HttpSession session){
        String semail=(String)session.getAttribute("email");
		jdbc.execute("Insert into dought (semail,question) values ('"+semail+"','"+question+"')");
        model.addAttribute("message", "Successfully Submitted");
        return "studentlayout/dought";
    }
    
	


	public static void main(String[] args) {
		SpringApplication.run(EducationApplication.class, args);
	}

}
