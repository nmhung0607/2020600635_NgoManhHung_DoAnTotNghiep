package com.DoAn.NgoManhHung.conf;

import org.springframework.context.annotation.Bean;



import org.springframework.context.annotation.Configuration;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//Đây là file cấu hình cho Spring MVC
@Configuration
//1.Báo cho spring-mvc biết đây là file cấu hình 
//2.Báo cho spring biết đây là 1 BEAN

public class MVCConf implements WebMvcConfigurer {
	/**
	 * classpath : tương đương với thư mục src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/font/**").addResourceLocations("classpath:/font/");
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("classpath:/img/");
		//đăng kí thêm folder upload
	    registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");	
	}
	// Spring-mvc sẽ call hàm này 
	// kết quả của hàm sẽ là 1 Bean và sẽ đc lưu trong SpringContainer
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		// Thiết lập view engine
		bean.setViewClass(JstlView.class);
		// Đường dẫn folder chứa views
		bean.setPrefix("/WEB-INF/views/");
		// Tên đuôi của View
		bean.setSuffix(".jsp");
		return bean;
	}
	
     
}
