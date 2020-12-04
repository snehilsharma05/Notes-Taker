package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class FactoryProvider {
	public static SessionFactory factory;
	public static SessionFactory getFactory()
	{
		if(factory==null){
			Configuration con = new Configuration().configure("hibernate.cfg.xml");
			ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(con.getProperties()).buildServiceRegistry();
			factory = con.buildSessionFactory(reg);
		}
		return factory;
	}
	public static void closeFactory()
	{
		if(factory.isClosed()==false)
			factory.close();
	}
}
