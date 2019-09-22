package com.weipan.commons.listener;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class applicationListener implements ServletContextListener {

  
    public void contextDestroyed(ServletContextEvent arg0)  { 
        
    }

    public void contextInitialized(ServletContextEvent se)  { 
    	ServletContext application=se.getServletContext();
    	InputStream is=applicationListener.class.getClassLoader().getResourceAsStream("web.properties");
    	Properties props=new Properties();
    	try {
			props.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
    	application.setAttribute("web_config", props);
    }
}
