# Education Management System

A Spring Boot web application for managing educational content with multi-role access.

## 🎯 Project Overview
This is a comprehensive education platform built with Spring Boot 3.2.0, featuring user management, content delivery, and online examinations.

## 🏗️ Architecture
- **Backend**: Spring Boot 3.2.0 + Java 17
- **Frontend**: JSP + Bootstrap 5
- **Database**: MySQL 8.0
- **Build**: Maven

## 📁 Project Structure
```
education/
├── src/main/java/com/example/education/
│   ├── EducationApplication.java    # Main application
│   ├── FaqController.java          # FAQ management
│   ├── FaqService.java            # Business logic
│   └── model/                     # Entity classes
├── src/main/webapp/WEB-INF/jsp/   # JSP views
├── pom.xml                        # Maven configuration
├── system.properties             # Java version for Heroku
└── Procfile                      # Heroku deployment
```

## 🚀 Quick Start

### Local Development
```bash
# Clone and setup
git clone https://github.com/dhreetigithub3/ems.git
cd education

# Install dependencies
mvn clean install

# Run locally
mvn spring-boot:run
# Access at http://localhost:8080
```

### Database Setup
```bash
# Create MySQL database
mysql -u root -p
CREATE DATABASE education;
```

### Environment Variables
```properties
# application.properties
spring.datasource.url=jdbc:mysql://localhost:3306/education
spring.datasource.username=root
spring.datasource.password=yourpassword
```

## 🌐 Deployment

### Heroku (Recommended)
```bash
# Install Heroku CLI
heroku login

# Create app
heroku create your-education-app

# Deploy
git push heroku main
```

### Railway
1. Connect GitHub repo at railway.app
2. Add MySQL service
3. Deploy automatically

## 🔧 Features
- **Multi-role System**: Admin, Faculty, Student
- **User Management**: Registration, login, profiles
- **Content Management**: Video uploads, course materials
- **Examination System**: Online tests and results
- **FAQ Section**: Dynamic content management

## 📊 Tech Stack Details
| Component | Technology |
|-----------|------------|
| Framework | Spring Boot 3.2.0 |
| Language | Java 17 |
| Database | MySQL 8.0 |
| Frontend | JSP, JSTL, Bootstrap |
| Build Tool | Maven |
| Server | Embedded Tomcat |

## 📝 Development Commands
```bash
# Clean build
mvn clean

# Run tests
mvn test

# Package application
mvn package

# Run with dev profile
mvn spring-boot:run -Dspring.profiles.active=dev
```

## 🔗 Useful Links
- [Spring Boot Docs](https://spring.io/projects/spring-boot)
- [Heroku Deployment Guide](https://devcenter.heroku.com/articles/deploying-spring-boot-apps-to-heroku)

## 📞 Support
For issues or questions, please open a GitHub issue or contact the development team.

