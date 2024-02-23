package config;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.*;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com", "com.fundly"},
        includeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION, classes = Controller.class),
        excludeFilters = @ComponentScan.Filter(type = FilterType.ANNOTATION, classes = {Service.class, Repository.class, Mapper.class})
)
//@PropertySource(value = "/WEB-INF/config/pay.properties")
//@PropertySource(value = {"/WEB-INF/config/pay.properties", "/WEB-INF/config/payTest.properties"})
public class ServletContext implements WebMvcConfigurer {

    @Autowired
    Environment env;

    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        WebMvcConfigurer.super.configureViewResolvers(registry);
        registry.tiles().viewClass(TilesView.class);
        registry.jsp("/WEB-INF/views/", ".jsp");
    }

    @Bean
    public TilesConfigurer tilesConfigurer() {
        final TilesConfigurer configurer = new TilesConfigurer();
        configurer.setDefinitions(new String[]{"/WEB-INF/tiles.xml"});
        configurer.setCheckRefresh(true);
        return configurer;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/static/");
    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        return new CommonsMultipartResolver();
    }

//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        WebMvcConfigurer.super.addInterceptors(registry);
//        registry.addInterceptor(new ChatInterceptor()).addPathPatterns("/chat*");
//    }


    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource ms = new ResourceBundleMessageSource();
        ms.setBasename("message.messages");
        ms.addBasenames("message.project_message");
        ms.setDefaultEncoding("UTF-8");
        return ms;
    }
}
