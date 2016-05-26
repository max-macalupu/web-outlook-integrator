<%@page session="false"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).TOKEN_URL" var="tokeUrl" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).TOKEN_LOGIN" var="tokenLogin" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).CLIEND_ID" var="clientID" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).CLIEND_SEC" var="clientSec" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).AUTHORIZ" var="authoriz" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).SCOPE" var="scope" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).REDIRECT" var="redirect" />
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).RESPONSE_TYPE_CODE" var="resposeCode" />

<title>Outlook Autentication</title>

<c:url var="home" value="/" scope="request" />

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

<spring:url value="/resources/core/js/jquery.1.10.2.min.js"
	var="jqueryJs" />
<script src="${jqueryJs}"></script>
</head>

<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Spring Outlook Autentication</a>
		</div>
	</div>
</nav>

<div class="container" style="min-height: 500px">

	<div class="starter-template">
		<h1>Search Form</h1>
		<br>

		<div id="feedback"></div>

		<form class="form-horizontal" id="search-form">
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Username</label>
				<div class="col-sm-10">
					<input type=text class="form-control" id="username">
				</div>
			</div>
			<div class="form-group form-group-lg">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" id="bth-search"
						class="btn btn-primary btn-lg">Simple Login</button>
						
					<button type="button" id="bth-outlook"
						class="btn btn-primary btn-lg">Outlook Loging</button>
				</div>
			</div>
		</form>

	</div>

</div>


<script>
	jQuery(document).ready(function($) {

		$("#search-form").submit(function(event) {
			// Disble the search button
			enableSearchButton(false);
			// Prevent the form from submitting via the browser.
			event.preventDefault();
			searchViaAjax();
		});
		
		$("#bth-outlook").click(function(data){
			loginOutlook();
		});

	});
	
	function loginOutlook(){
		var urlLogin = '${tokenLogin.codigo}';
		urlLogin += "?"+'${clientID.descripcion}'+"="+'${clientID.codigo}';
		urlLogin += "&"+'${redirect.descripcion}'+"="+'${redirect.codigo}';
		urlLogin += "&"+'${authoriz.descripcion}'+"="+'${authoriz.codigo}';
		urlLogin += "&"+'${scope.descripcion}'+"="+'${scope.codigo}';
		urlLogin += "&"+'${resposeCode.descripcion}'+"="+'${resposeCode.codigo}';
		window.location.href = urlLogin;
// 		alert(""+urlLogin);
	}

	function searchViaAjax() {

		var search = {}
		search["username"] = $("#username").val();
		search["email"] = $("#email").val();

		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${home}search/api/getSearchResult",
			data : JSON.stringify(search),
			dataType : 'json',
			timeout : 100000,
			success : function(data) {
				console.log("SUCCESS: ", data);
				display(data);
			},
			error : function(e) {
				console.log("ERROR: ", e);
				display(e);
			},
			done : function(e) {
				console.log("DONE");
				enableSearchButton(true);
			}
		});

	}

	function enableSearchButton(flag) {
		$("#btn-search").prop("disabled", flag);
	}

	function display(data) {
		var json = "<h4>Ajax Response</h4><pre>"
				+ JSON.stringify(data, null, 4) + "</pre>";
		$('#feedback').html(json);
	}
</script>

</body>
</html>