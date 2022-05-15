<%@page import="com.elecgrid.crud.billingManagement.services.billingServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Billing Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/billingManagement.js"></script>
</head>
<body> 

<div class="container"><div class="row"><div class="col-6"> 

	<h1>Billing Management</h1>
	
	<form id="formbilling" name="formbilling">
	 	Bill No: 
	 	<input id="bill_no" name="bill_no" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Bill Description: 
	 	<input id="bill_desc" name="bill_desc" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Bill Type: 
	 	<input id="bill_type" name="bill_type" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br> Units: 
	 	<input id="unit" name="unit" type="text" 
	 		class="form-control form-control-sm">
	 	
	 	<br> Customer ID: 
	 	<input id="cus_id" name="cus_id" type="text" 
	 		class="form-control form-control-sm">
	 
	 	<br>
	 	<input id="btnSave" name="btnSave" type="button" value="Save" 
	 		class="btn btn-primary">
	 	<input type="hidden" id="hidBillingIDSave" 
	 		name="hidBillingIDSave" value="">
	</form>
	
	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	<div id="divBillingGrid">
		<%
			billingServices billObj = new billingServices(); 
	 		out.print(billObj.viewBills()); 
	 	%>
	</div>
	
</div> </div> </div> 
</body>
</html>
