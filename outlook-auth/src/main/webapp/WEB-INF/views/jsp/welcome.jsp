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
<spring:eval expression="T(com.avantica.web.model.OutlookParameters).RESPONSE_TYPE_TOKEN" var="resposeToken" />

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
			<a class="navbar-brand" href="#">Spring Outlook Authentication</a>
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
						class="btn btn-primary btn-lg">Outlook Logging</button>
					<button type="button" id="bth-send-email"
						class="btn btn-primary btn-lg">Enviar Email</button>
				</div>
			</div>
		</form>
		<div class="form-group form-group-lg" style="display:none">
			<label class="col-sm-2 control-label">Authorization Code</label>
			<input type="text" class="form-control" id="code_id"></input>
		</div>

		<div class="form-group form-group-lg" style="display:none">
			<label class="col-sm-2 control-label">Session State</label>
			<input type="text" class="form-control" id="session_state_id"></input>
		</div>

		<div class="form-group form-group-lg" style="display:none">
			<label class="col-sm-2 control-label">Access Token</label>
			<input type="text" class="form-control" id="acc_token_id"></input>
		</div>
		<div class="form-group form-group-lg" style="display: none;">
			<label class="col-sm-2 control-label">Token Type</label>
			<input type="text" class="form-control" id="acc_token_type"></input>
		</div>
		<div class="form-group form-group-lg" style="display: none;">
			<label class="col-sm-2 control-label">Authentication Token</label>
			<input type="text" class="form-control" id="auth_token_id"></input>
		</div>
		
		<div class="form-group form-group-lg" style="display: none;">
			<label class="col-sm-2 control-label">Refresh Token</label>
			<input type="text" class="form-control" id="refresh_token_id"></input>
		</div>
		
		<div class="form-group form-group-lg">
			<label class="col-sm-2 control-label">Nombre</label>
			<input type="text" class="form-control" id="nombre_id"></input>
		</div>
		
		<div class="form-group form-group-lg">
			<label class="col-sm-2 control-label">Apellido</label>
			<input type="text" class="form-control" id="apellido_id"></input>
		</div>
		
		<div class="form-group form-group-lg">
			<label class="col-sm-2 control-label">IP Address</label>
			<input type="text" class="form-control" id="ipaddr_id"></input>
		</div>
		
		<div class="form-group form-group-lg">
			<label class="col-sm-2 control-label">Correo</label>
			<input type="text" class="form-control" id="correo_id"></input>
		</div>
		
			

		<div class="form-group form-group-lg" style="display: none;">
			<label class="col-sm-2 control-label">Asunto</label>
			<input type="text" class="form-control" id="subject_email"></input>
		</div>
		
		<div class="form-group form-group-lg" style="display: none;">
			<label class="col-sm-2 control-label">Mensaje</label>
			<input type="text" class="form-control" id="message_email"></input>
		</div>
		
	</div>

</div>


<script>
	var auth_code;
	var acc_token;
	var sess_state;
	
	function getUrlBase() {
		return 'https://xinefserver.com:9090/outlook-auth/';
	}
	
	jQuery(document).ready(function($) {

		$("#search-form").submit(function(event) {
			// Disble the search button
			enableSearchButton(false);
			// Prevent the form from submitting via the browser.
			event.preventDefault();
			searchViaAjax();
		});
		
		$("#bth-outlook").click(function(data){
			logOutlook();
		});
		$("#bth-outlook-log").click(function(data){
			logOutlook();	 
		});
		$("#bth-send-email").click(function(data){
			sendEmail();
		});
		
		var code = urlParameterExtraction.queryStringParameters['oid'];
		getUserDataByOid(code);
	});
	
	function setTokenID() {
		$('#code_id').val(auth_code);
		$('#token_id').val(acc_token);
		$('#session_state_id').val(sess_state);
	}
	
	function regOutlook(){
		var urlLogin = '${tokenLogin.codigo}';
		urlLogin += "?"+'${clientID.descripcion}'+"="+encodeURI('${clientID.codigo}');
		urlLogin += "&"+'${redirect.descripcion}'+"="+encodeURI('${redirect.codigo}');
		urlLogin += "&"+'${authoriz.descripcion}'+"="+encodeURI('${authoriz.codigo}');
		urlLogin += "&"+'${scope.descripcion}'+"="+encodeURI('${scope.codigo}');
		urlLogin += "&"+'${resposeCode.descripcion}'+"="+encodeURI('${resposeCode.codigo}');
		window.location.href = urlLogin;
	}
	
	function logOutlook(){
		var urlLogin = '${tokenLogin.codigo}';
		urlLogin += "?"+'${clientID.descripcion}'+"="+encodeURI('${clientID.codigo}');
		urlLogin += "&"+'${redirect.descripcion}'+"="+encodeURI('${redirect.codigo}');
		urlLogin += "&"+'${authoriz.descripcion}'+"="+encodeURI('${authoriz.codigo}');
		urlLogin += "&"+'${scope.descripcion}'+"="+encodeURI('${scope.codigo}');
		urlLogin += "&"+'${resposeToken.descripcion}'+"="+encodeURI('${resposeToken.codigo}');
		window.location.href = urlLogin;
	}
	
	function getPositionSign(urlName) {
		for(i=0; i<urlName.length; ++i) {
			if (urlName[i] == '?' || urlName[i] == '#') return i;
		}
		return 0;
	}
	
	var urlParameterExtraction = new (function () { 
		  function splitQueryString(queryStringFormattedString) { 
		    var split = queryStringFormattedString.split('&'); 
		    // If there are no parameters in URL, do nothing.
		    if (split == "") {
		      return {};
		    }
		    
		    var results = {}; 
		    // If there are parameters in URL, extract key/value pairs. 
		    for (var i = 0; i < split.length; ++i) { 
		      var p = split[i].split('=', 2); 
		      if (p.length == 1) 
		        results[p[0]] = ""; 
		      else 
		        results[p[0]] = decodeURIComponent(p[1].replace(/\+/g, " ")); 
		    } 
		    return results; 
		  } 
		  // Split the query string (after removing preceding '#'). 
		  var positionInterrogation = getPositionSign(window.location.href);
		  this.queryStringParameters = splitQueryString(window.location.href.substr(positionInterrogation+ 1)); 
		})(); 

	
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
	
	
	function getTokensByAuthCode(authCode) {
		$.ajax({
			url: "https://login.microsoftonline.com/common/oauth2/v2.0/token",
			datatype: "json",
			crossDomain: true,
			type: "POST",	
			contentType: "application/x-www-form-urlencoded",
			xhrFields: {
			    withCredentials: false
			  },
			data: {
				"code": authCode,
				"client_id": '${clientID.codigo}',
				"redirect_uri": '${redirect.codigo}',
				"client_secret": '${clientSec.codigo}',
				"grant_type": 'authorization_code',
				"cors": {
			        "headers": ["Accept", "Authorization", "Content-Type", "If-None-Match", "Accept-language"]
				}
			},
			success: function(data) {
				$("#acc_token_id").val(data.access_token);
				$("#auth_token_id").val(data.id_token);
				$("#refresh_token_id").val(data.refresh_token);
				$("#acc_token_type").val(data.token_type);
				getUserDataByToken(data.access_token);
			},
			error: function(e) {
				console.log("FAIL");
			},
			beforeSend: function(req) {
				req.setRequestHeader('Access-Control-Allow-Methods', 'GET, PUT, POST, DELETE, OPTIONS');
				req.setRequestHeader('Access-Control-Allow-Headers', 'Accept, Content-Type, Content-Range, Content-Disposition, Content-Description');
			}
		});
	}
	
	function getUserData(acc_token, acc_type) {
		//acc_token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6Ik1uQ19WWmNBVGZNNXBPWWlKSE1iYTlnb0VLWSIsImtpZCI6Ik1uQ19WWmNBVGZNNXBPWWlKSE1iYTlnb0VLWSJ9";
		$.ajax({
			url: "https://outlook.office.com/api/v2.0/me",
			datatype: "jsonp",
			type: "GET",	
			xhrFields: {
			    withCredentials: false
			  },
			headers: {
				"access_token": acc_token,
				"Authorization": "Bearer " + acc_token,
			},
			success: function(data) {
				console.log("DONE");
				$('#correo_id').val(data.EmailAddress);
				$('#nombre_id').val(data.DisplayName);
				
			},
			error: function(e) {
				console.log("FAIL");
			}
		});
	}
	
	function getUserDataByToken(acc_token) {
		$.ajax({
			url: getUrlBase() + '/getBodyToken',
			type: 'POST',
			async: false,
			cache: false,
			datatype: 'json',
			data:{
				idToken: acc_token
			},
			success: function(data) {
				$('#correo_id').val(data.unique_name);
				$('#nombre_id').val(data.given_name);
			},
			error: function(data) {
				console.log("FAIL");
			}
		});
	}
	
	function getUserDataByOid(oidToken) {
		$.ajax({
			url: getUrlBase() + '/getSessionInfo',
			type: 'GET',
			async: false,
			cache: false,
			datatype: 'json',
			data:{
				oid: oidToken
			},
			success: function(data) {
				$('#correo_id').val(data.unique_name);
				$('#nombre_id').val(data.given_name);
				$('#apellido_id').val(data.family_name);
				$('#ipaddr_id').val(data.ipaddr);
			},
			error: function(data) {
				console.log("FAIL");
			}
		});
	}
	
	function sendEmail() {
		acc_token = $("#acc_token_id").val();
		subject_value = $("#subject_email").val();
		content_value = $("#message_email").val();
		
		var Message = {
				"Message": {
				    "Subject": subject_value,
				    "Body": {
				      "ContentType": "Text",
				      "Content": content_value,
				    },
				    "ToRecipients": [
				      {
				        "EmailAddress": {
				          "Address": "dmansilla07@gmail.com"
				        }
				      }
				    ]
				  },
				"SaveToSentItems": "true"
		    };
		
		$.ajax({
			url: "https://outlook.office.com/api/v2.0/me/sendmail",
			type: "POST",
			contentType: "application/json",
			headers: {
				"Authorization": "Bearer " + acc_token,
			},
			data: JSON.stringify(Message),
			success: function(data) {
				console.log("DONE");				
			},
			error: function(e) {
				console.log("FAIL");
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

