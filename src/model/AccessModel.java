package model;
import classes.Employee;
import classes.Holiday;
import org.hibernate.HibernateException; 
import org.hibernate.Session; 
import org.hibernate.Transaction;
import org.hibernate.SessionFactory; 
import java.util.List;
import org.hibernate.Query;
import java.util.Iterator;
import java.util.*;
import java.io.*;
import java.text.*;
import java.util.Date;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.AnnotationConfiguration;
public class AccessModel {
	private static SessionFactory factory;
	 private static Configuration configuration;
	 private static Session session;
	 private static Transaction transaction;
	public AccessModel()
	{
	
        	 configuration=new Configuration();
        	 configuration=configuration.configure();
			 factory= configuration.buildSessionFactory();
	}
			
			public String updateEmployee(String employeeId,String firstName,String middleName,String lastName,String phoneNumber)
		    {
		    	session = factory.openSession(); 
				 transaction = null; 
				try
				{ 
					transaction = session.beginTransaction();
					
					Integer employeeID=Integer.parseInt(employeeId);
					session.get(Employee.class,employeeID);
					Employee employee = (Employee)session.get(Employee.class,employeeID);
					employee.setFirstName(firstName);
					employee.setMiddleName(middleName);
					employee.setLastName(lastName);
					employee.setPhoneNumber(phoneNumber);
					 session.saveOrUpdate(employee);
					 transaction.commit();
					 session.close();
					 return "Successful";
					}
				catch (HibernateException e)
				{
					if (transaction!=null) transaction.rollback(); 
					return "0"+e.getMessage();
					}
				
		    	
		    }
			public String grantHoliday(String employeeId,String startingDate,String endingDate)
			{
				 session=factory.openSession();
				int employeeID = Integer.valueOf(employeeId);
				transaction=null;
				
				   
				    try {
				    	java.util.Date utilStartDate=new Date(startingDate);
				    	java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
						java.util.Date utilEndDate = new java.util.Date(endingDate);
						java.sql.Date sqlEndDate = new java.sql.Date(utilEndDate.getTime());
						transaction=session.beginTransaction();
						Holiday holiday=new Holiday();
					    holiday.setEmployeeId(employeeID);
					    holiday.setStartingDate(sqlStartDate);
					    holiday.setEndingDate(sqlEndDate);
						session.save(holiday);
						transaction.commit();
						session.close();
						return "Successful";
				    } catch (Exception e)
				    {
				    	if (transaction!=null) transaction.rollback(); 
						return e.getMessage();
				    }				
				}
		public String deleteHoliday(int deleteId,int check)                           
		{
			Session session = factory.openSession(); 
			Transaction transaction = null; 
		if(check==0)
		{
		try
		{
			transaction = session.beginTransaction(); 
			String hql = "DELETE FROM Holiday " + "WHERE Holiday_Id = :holiday_id"; 
			Query query = session.createQuery(hql); 
			query.setParameter("holiday_id",deleteId);
			 query.executeUpdate();
			 transaction.commit();
			session.close();
			return "Successful";
	}
		catch (HibernateException e) 
		{ 
			if (transaction!=null) transaction.rollback(); 
			return e.getMessage();
			}
		}
		else 
		{
			try
			{
				transaction = session.beginTransaction(); 
			String hql = "DELETE FROM Holiday " + "WHERE Employee_Id = :employee_id";
			Query query = session.createQuery(hql); 
			query.setParameter("employee_id",deleteId);
			 query.executeUpdate();
			 transaction.commit();
			session.close();
			return "Successful";
	}
		catch (HibernateException e) 
		{ 
			if (transaction!=null) transaction.rollback(); 
			return e.getMessage();
			}
		}
		
		
	}
			
	public String createEmployee(String firstName,String middleName,String lastName,String phoneNumber)
			{
				session = factory.openSession(); 
				transaction = null; 
				Integer employeeId = null; 
				try
				{
					transaction = session.beginTransaction();
					Employee employee= new Employee(); 
					employee.setFirstName(firstName);
					employee.setMiddleName(middleName);
					employee.setLastName(lastName);
					employee.setPhoneNumber(phoneNumber);
				 session.save(employee); 
				 transaction.commit();
					session.close();
					return "Successful";
			}
				catch (HibernateException e) 
				{ 
					if (transaction!=null) transaction.rollback(); 
					return e.getMessage();
					}
				
			}
			public String deleteEmployee(int employeeId)
			{
			   Session session = factory.openSession(); 
			   Transaction transaction =null;
				deleteHoliday(employeeId,1);
		
				try
				{
					
					transaction = session.beginTransaction(); 
					String hql = "DELETE FROM Employee " + "WHERE Employee_Id = :employee_id"; 
					Query query = session.createQuery(hql); 
					query.setParameter("employee_id",employeeId);
					 query.executeUpdate();
					transaction.commit();
					session.close();
					return "Successful";
			}
				catch (HibernateException e) 
				{ 
					if (transaction!=null) transaction.rollback(); 
					return e.getMessage();
					}
				}
}
				


		

