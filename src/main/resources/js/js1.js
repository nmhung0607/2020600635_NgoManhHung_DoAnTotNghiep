
function SaveContact(baseUrl){
	var requestBody = {
		email: $("#idEmail").val(),
		message: $("#idMessage").val(),
	};
	alert("Start Ajax");
	$.ajax({
		url : baseUrl + "/ajax/contact-us",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(requestBody),
		dataType : "json",
		success : function(jsonResult) {
			alert(jsonResult.statusCode + "-" + jsonResult.statusMessage);
		},
		error : function (jqXhr,textStatus,errorMessage){
			alert("Error");
		}
	});
}