<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%@ page import="com.nsunina.wavsepenhancement.encoders.HtmlEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Case 17 - RXSS via Javascript injection into the scope of javascript code within a property (Double Quote String Delimiter)</title>
</head>


<%
if (request.getParameter("userinput") == null || !"POST".equalsIgnoreCase(request.getMethod())) {
%>
    <body>
	Enter your input:<br><br>
	<form name="frmInput" id="frmInput" action="Case17-Js2PropertyJsScopeDoubleQuoteDelimiter.jsp" method="POST">
		<input type="text" name="userinput" id="userinput"><br>
		<input type=submit value="submit">
	</form>
	</body>
<%
} 
else {
%>
<frameset cols="25%,75%">
<frame name="frame1" id="frame1" src="dummy.html">
<%	
    try {
	  	    String userinput = request.getParameter("userinput"); 
	  	    //only encode Angle brackets and single quotes
	  	    userinput = HtmlEncoder.htmlEncodeAngleBracketsAndSingleQuotes(userinput);
     		out.println("<frame name='frame2' id='frame2' src='javascript:"
     			+ "var customerName=\"" + userinput + "\";" 
     			+ " alert(\"Welcome Mr. \" + customerName);'> ");
	  	    out.flush();
    } catch (Exception e) {
        out.println("Exception details: " + e);
    }
} //end of if/else block
%>
</frameset>
</html>