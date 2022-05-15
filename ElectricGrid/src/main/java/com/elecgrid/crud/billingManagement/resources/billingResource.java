package com.elecgrid.crud.billingManagement.resources;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import com.elecgrid.crud.billingManagement.services.billingServices;

@Path("/bills")
public class billingResource {
	billingServices billServ = new billingServices();
	
	//Insert Bill
	@POST
	@Path("/insertBill")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertBill(@FormParam("bill_no") String bill_no, @FormParam("bill_desc") String bill_desc, @FormParam("bill_type") String bill_type, @FormParam("unit") String unit,
								@FormParam("cus_id") String cus_id) 
	{
		
		String output = billServ.insertBill(bill_no, bill_desc, bill_type, unit, cus_id) ;
		return output;
	}
	
	//View Bills
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String getBill(){
		return billServ.viewBills();
	}
	
	//View Bill
	@GET
	@Path("/{cus_id}")
	@Produces(MediaType.TEXT_HTML)
	public String getBillById(@PathParam("cus_id") int id){
		return billServ.viewBill(id);
	}
	
	//Update Bill
	@PUT
	@Path("/updateBill")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateBill(@FormParam("bill_no") String bill_no, @FormParam("bill_desc") String bill_desc,
			@FormParam("bill_type") String bill_type, @FormParam("unit") String unit, @FormParam("bill_id") String bill_id) {
			
		String output = billServ.updateBill(bill_id, bill_no, bill_desc, bill_type, unit);
		
		return output;
	}
	
	//Delete Bill
	@DELETE
	@Path("/deleteBill")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteBill(String bill)
	{
		//Convert the input string to an XML document
		Document doc = Jsoup.parse(bill, "", Parser.xmlParser());
		
		//Read the value from the element customer id
		String bill_id = doc.select("bill_id").text();
		String output = billServ.deleteBill(bill_id);
	
	return output;
	}

}
