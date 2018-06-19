package cn.edu.nju.tickets.config;


import cn.edu.nju.tickets.interceptor.ManagerInterceptor;
import cn.edu.nju.tickets.interceptor.UserInterceptor;
import cn.edu.nju.tickets.interceptor.VenueInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//@EnableWebMvc
@Configuration
public class WebConfig extends WebMvcConfigurerAdapter{


    @Bean
    UserInterceptor userInterceptor(){
        return new UserInterceptor();
    }

    @Bean
    VenueInterceptor venueInterceptor(){
        return new VenueInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(userInterceptor()).addPathPatterns("/plan/list","/order/**").excludePathPatterns("/order/createOfflineInfo","/order/createOffline");
        registry.addInterceptor(new ManagerInterceptor()).addPathPatterns("/managerInfo","/venueChange/list","/venueChange/approve","/manager/accounts","/venueChange/disapprove");
        registry.addInterceptor(venueInterceptor()).addPathPatterns("/venueInfo","/venueInfo/save","/checkTicket","/checkTicket/result","/venuePlanList","/plan/createInfo","/plan/create","/order/createOfflineInfo","/order/createOffline");
        super.addInterceptors(registry);
    }
}
