<%--
 *******************************************************************************
 * Copyright (C) 2007 Ping Identity Corporation All rights reserved.
 * 
 * This software is licensed under the Open Software License v2.1 (OSL v2.1).
 * 
 * A copy of this license has been provided with the distribution of this
 * software. Additionally, a copy of this license is available at:
 * http://www.pingidentity.com/license
 *  
 ******************************************************************************
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String backchannelurl = (request.getAttribute("backchannelurl")==null) ? "" : (String)request.getAttribute("backchannelurl");
String subjectdn = (request.getAttribute("subjectdn")==null) ? "" : (String)request.getAttribute("subjectdn");
String issuerdn = (request.getAttribute("issuerdn") == null) ? "" : (String)request.getAttribute("issuerdn");
String appid = (request.getAttribute("appid")==null) ? "" : (String)request.getAttribute("appid");
String sharedsecret = (request.getAttribute("sharedsecret")==null) ? "" : (String)request.getAttribute("sharedsecret");
String requestedattributes = (request.getAttribute("requestedattributes")==null) ? "" : (String)request.getAttribute("requestedattributes");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
<TITLE>Quick-Start SP Application - Attribute Query</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>

</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0">
<CENTER><BR><BR>
<form name="testForm" action="go" method="POST" >
<TABLE cellSpacing="0" cellPadding="0" border="0">
  <TBODY>
<%@include file="header.jsp"%>
      <FONT style="COLOR: #1c58b2">2005-04-15T18:37:56.653Z&nbsp;</FONT></TD></TR>

  <TR>
    <!----------------- Body ----------------->
    <TD class=spbodycontent vAlign="top" align="left" width="600" height="100%" colspan=2>
      <br>
      <DIV id=mainContainer align=center>
       <h3>Attribute Query</h3>
     <table>
        <c:if test="${!empty error}" >
        <tr>
          <td ><center><font color="red" size="2">${error}<br><br></font></center></td>
        </tr>
        </c:if>
        <c:if test="${!empty infomessage}" >
        <tr>
          <td ><center><font color="green" size="2">${infomessage}<br><br></font></center></td>
        </tr>
        </c:if>

        <tr>
            <td>Backchannel URL: </td>
            <td>
				<input name="backchannelurl" value="<%=backchannelurl%>" size="55" /> *
            </td>
        </tr>

        <tr>
	    <td>NameID Format: </td>
	        <td>
	            <select name="nameidformat">
	                <option value="">NONE</option>
	                <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified">unspecified</option>
	                <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:X509SubjectName">X509SubjectName</option>
	                <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress">emailAddress</option>
	                <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:WindowsDomainQualifiedName">WindowsDomainQualifiedName</option>
	                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:kerberos">kerberos</option>
	                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:persistent">persistent</option>
	                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">transient</option>
	            </select>
	        </td>
        </tr>

        <tr>
            <td>Subject: </td>
            <td>
				<input name="subjectdn" value="<%=subjectdn%>" size="55" /> *
            </td>
        </tr>
        
        <tr>
            <td>Issuer: </td>
            <td>
				<input name="issuerdn" value="<%=issuerdn%>" size="55" />
            </td>
        </tr>

        <tr>
	        <td>IdP Partner: </td>
	        <td>
	            <select name="PartnerIdpId">
	                <option value="">Select IdP based on DN</option>
	                <c:forEach items="${idplist}" var="idp"><option value="${idp.entityId}">${idp.company}</option></c:forEach>
	            </select>
	        </td>
        </tr>

        <tr>
            <td>App ID: </td>
            <td>
				<input name="appid" value="<%=appid%>"/> *
            </td>
        </tr>
        
        <tr>
            <td>Shared Secret: </td>
            <td>
				<input type="password" name="sharedsecret" value="<%=sharedsecret%>"/> *
            </td>
        </tr>

        <tr>                
            <td>Requested attributes: </td>
            <td>
                <textarea name="requestedattributes" rows="4" cols="40"><%=requestedattributes%></textarea>
            </td>
        </tr>

        <tr>                
            <td></td>
            <td>
                <input type="submit" value=" Attribute Query "/>
            </td>
        </tr>
      </table>    
      <BR><BR></DIV>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<%@include file="footer.jsp"%>

<SCRIPT language="JavaScript">
        document.testForm.subjectdn.focus();
</SCRIPT>
</CENTER>

<input type="hidden" name="action" value="attributequery"/>

</form>
</BODY></HTML>
