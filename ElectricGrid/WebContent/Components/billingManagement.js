$(document).ready(function() 
{ 
	if ($("#alertSuccess").text().trim() == "") 
	{ 
		$("#alertSuccess").hide(); 
	} 
	$("#alertError").hide(); 
}); 

//SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
	// Clear alerts---------------------
	 $("#alertSuccess").text(""); 
	 $("#alertSuccess").hide(); 
	 $("#alertError").text(""); 
	 $("#alertError").hide(); 
	 
	// Form validation-------------------
	var status = validateBillingForm(); 
	if (status != true) 
	 { 
		 $("#alertError").text(status); 
		 $("#alertError").show(); 
		 return; 
	 } 
	
	// If valid------------------------
	var type = ($("#hidBillingIDSave").val() == "") ? "POST" : "PUT"; 
	
	$.ajax( 
	{ 
		 url : "billingAPI", 
		 type : type, 
		 data : $("#formbilling").serialize(), 
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
			 onBillingSaveComplete(response.responseText, status); 
		 } 
	}); 
}); 

function onBillingSaveComplete(response, status) 
{ 
	if (status == "success") 
	{ 
		var resultSet = JSON.parse(response); 
		if (resultSet.status.trim() == "success") 
		{ 
			$("#alertSuccess").text("Successfully saved."); 
			$("#alertSuccess").show(); 
			$("#divBillingGrid").html(resultSet.data); 
		} else if (resultSet.status.trim() == "error") 
		{ 
			$("#alertError").text(resultSet.data); 
			$("#alertError").show(); 
		} 
	} else if (status == "error") 
	{ 
		$("#alertError").text("Error while saving."); 
		$("#alertError").show(); 
	} else
	{ 
		$("#alertError").text("Unknown error while saving.."); 
		$("#alertError").show(); 
	} 
	
	$("#hidBillingIDSave").val(""); 
	$("#formbilling")[0].reset(); 
}


// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
	 $("#hidBillingIDSave").val($(this).data("billid")); 
	 $("#bill_no").val($(this).closest("tr").find('td:eq(0)').text()); 
	 $("#bill_desc").val($(this).closest("tr").find('td:eq(1)').text()); 
	 $("#bill_type").val($(this).closest("tr").find('td:eq(2)').text()); 
	 $("#unit").val($(this).closest("tr").find('td:eq(3)').text()); 
}); 

//REMOVE
$(document).on("click", ".btnRemove", function(event) 
{ 
	$.ajax( 
	{ 
		 url : "billingAPI", 
		 type : "DELETE", 
		 data : "bill_id=" + $(this).data("billid"),
		 dataType : "text", 
		 complete : function(response, status) 
		 { 
			 onBillingDeleteComplete(response.responseText, status); 
		 } 
	}); 
});

function onBillingDeleteComplete(response, status) 
{ 
	if (status == "success") 
	{ 
 
		var resultSet = JSON.parse(response); 
		
		if (resultSet.status.trim() == "success") 
		{ 
			 $("#alertSuccess").text("Successfully deleted."); 
			 $("#alertSuccess").show(); 
			 $("#divBillingGrid").html(resultSet.data); 
		} else if (resultSet.status.trim() == "error") 
		{ 
			$("#alertError").text(resultSet.data); 
			$("#alertError").show(); 
		}
		
	} else if (status == "error") 
	{ 
		$("#alertError").text("Error while deleting."); 
		$("#alertError").show(); 
	} else
	{ 
		$("#alertError").text("Unknown error while deleting.."); 
		$("#alertError").show(); 
	} 
}
//CLIENT-MODEL================================================================
function validateBillingForm() 
{ 
	// Bill no-----------------------------
	if ($("#bill_no").val().trim() == "") 
	 { 
	 return "Insert Bill No."; 
	 } 
	
	// is numerical value
	var tmpNo = $("#bill_no").val().trim(); 
	if (!$.isNumeric(tmpNo)) 
	 { 
	 return "Insert a numerical value for Bill No."; 
	 } 
	
	// Bill desc----------------------------
	if ($("#bill_desc").val().trim() == "") 
	 { 
	 return "Insert Bill Description."; 
	 } 
	
	// Bill Type-------------------------------
	if ($("#bill_type").val().trim() == "") 
	 { 
	 return "Insert Bill Type."; 
	 } 
	
	//UNIT -----------------------------------
	 if ($("#unit").val().trim() == "") 
	 { 
	 return "Insert Unit."; 
	 } 
	
	// is numerical value
	var tmpUnit = $("#unit").val().trim(); 
	if (!$.isNumeric(tmpUnit)) 
	 { 
	 return "Insert a numerical value for Unit."; 
	 } 
	
	 
	// Customer id ------------------------
	if ($("#cus_id").val().trim() == "") 
	 { 
	 return "Insert Customer ID."; 
	 } 
	
	// is numerical value
	var tmpCusID = $("#cus_id").val().trim(); 
	if (!$.isNumeric(tmpCusID)) 
	 { 
	 return "Insert a numerical value for Customer ID."; 
	 } 
	
	return true; 
}
