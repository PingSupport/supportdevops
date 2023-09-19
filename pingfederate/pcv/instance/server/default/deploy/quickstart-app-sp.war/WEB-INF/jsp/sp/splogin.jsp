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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML>

<HEAD>
<TITLE>Quick-Start SP Application - Logon</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0">
<CENTER><BR><BR>
<form name="loginForm" action="go" method="POST" >
<TABLE cellSpacing="0" cellPadding="0" border="0">
  <TBODY>

<%@include file="header.jsp"%>

<c:if test="${empty rp}">
	<a href="<c:url value='go'/>">Back to the Welcome page</a></TD></TR>
</c:if>
<c:if test="${!empty rp}">
	<a href="<c:url value='go'/>" title=" Go to the SP Welcome page ">SP Welcome Page</a></TD></TR>
</c:if>


  <TR>
    <!----------------- Body ----------------->
    <TD class=spbodycontent vAlign="top" align="left" width="800" height="100%" colspan=2>
      <br>
      <DIV id=mainContainer align=center>
      <h3>User Login</h3>
      <div style="margin-left:25pt;margin-right:20pt;margin-bottom:15pt;text-align:left">
	<c:if test="${empty rp}">
	This page authenticates users by means of local data stores only (non-SSO); no Identity Provider is used.</div>
	</c:if>
	<c:if test="${!empty rp}">
      Hello<c:if test="${!empty SPUser.otherAttributes.name}">, ${SPUser.otherAttributes.name}</c:if>.  We have received your request to link (federate) your account at the IdP Quick-Start Application to your account with us.  To establish this link, you must identify your local user account by providing your credentials below.  Once the link is established, PingFederate maintains it at this site and you will not have to reauthenticate until you elect to terminate the link.
<br><br>Please log on to a local user account to establish the link to your IdP user account.</div>
      </c:if>
	<table>
        
      <c:if test="${!empty error}" >
        <tr>
          <td colspan="2"><center><font color=red>${error}<br><br></font></center></td>
        </tr>
      </c:if>

        <tr>
            <td align="right">User Id:</td>
            <td>
              <select name="userid" style="width:156px;">
              <c:forEach items="${userlist}" var="user">
                <option value="${user.key}" ${user.value}>${user.key}</option>
              </c:forEach>
              </select>
            </td>
        </tr>

        <tr>                
            <td align="right">Password:</td>
            <td><input type="password" title=" The default password is 'test'. "name="password" style="width:150px;"/></td>
        </tr>
        <tr>                
            <td></td><td><input type="Submit" value="Log On"/></td>
        </tr>
        <c:if test="${!empty rp}">
            <tr><td>&nbsp;</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr><td colspan="2">
            If you do not have a local user account, you can provision a new probationary account here:
            </td></tr>
		<tr><td>&nbsp;</td></tr>
            <tr>
                <td align="right">New User Id: </td>
                <td><input type="text" name="newid"/><input type="Submit" name="Register" value="Register"/></td>
            </tr>

        </c:if>
        <tr>
            <td></td><td></td>
        </tr>
      </table>    
      <BR><BR></DIV>
    </TD>
  </TR>
  </TBODY>
</TABLE>

</TABLE>

<%@include file="footer.jsp"%>

<SCRIPT language="JavaScript">
        document.loginForm.password.focus();
</SCRIPT>
</CENTER>

<input type="hidden" name="action" value="login"/>

</form></BODY></HTML>
