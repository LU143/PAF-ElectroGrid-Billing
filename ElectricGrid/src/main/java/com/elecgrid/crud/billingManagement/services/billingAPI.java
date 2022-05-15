package com.elecgrid.crud.billingManagement.services;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException; 
import java.util.HashMap; 
import java.util.Map; 
import java.util.Scanner;


/**
 * Servlet implementation class billingAPI
 */
@WebServlet("/billingAPI")
public class billingAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	billingServices billObj = new billingServices(); 
	
    public billingAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//NOT USED
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			String output = billObj.insertBill(request.getParameter("bill_no"), 
					request.getParameter("bill_desc"), 
					request.getParameter("bill_type"), 
					request.getParameter("unit"), 
					request.getParameter("cus_id")); 
			
			response.getWriter().write(output);
	}

	
	// Convert request parameters to a Map
		private static Map getParasMap(HttpServletRequest request) 
		{ 
			Map<String, String> map = new HashMap<String, String>(); 
			
			try
			{ 
				 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
				 String queryString = scanner.hasNext() ? 
				 
				scanner.useDelimiter("\\A").next() : ""; 
				scanner.close(); 
				 
				String[] params = queryString.split("&"); 
				for (String param : params) 
				{
					 String[] p = param.split("="); 
					 map.put(p[0], p[1]); 
				} 
			 } 
			catch (Exception e) 
			{ 
			} 
			
			return map; 
		}
	
	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Map paras = getParasMap(request); 
		
		String output = billObj.updateBill(paras.get("hidBillingIDSave").toString(), 
				paras.get("bill_no").toString(), 
				paras.get("bill_desc").toString(), 
				paras.get("bill_type").toString(), 
				paras.get("unit").toString()); 
		
		response.getWriter().write(output);
	}
	

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Map paras = getParasMap(request); 
		
		String output = billObj.deleteBill(paras.get("bill_id").toString()); 
		
		response.getWriter().write(output); 
	}

}
