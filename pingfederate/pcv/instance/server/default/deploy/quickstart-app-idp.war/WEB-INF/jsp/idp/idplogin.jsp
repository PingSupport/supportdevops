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
<TITLE>Ping Identity Quick-Start IdP Application - Login</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0" background=<%=request.getContextPath()%>/images/bkgdPage.gif>

<!---------------------------------------------------------------------------->
<!--show this content if user has arrived from SP for SSO-->
<!---------------------------------------------------------------------------->

<c:if test="${!empty resumePath}" >
<CENTER>
<form name="loginForm" action="go" method="POST" >
<TABLE cellSpacing="0" cellPadding="0" border="0" height=400px width="500" class="mainContainer">
  <TBODY>
	<tr>
  	<!----------------- Left Nav ----------------->
	<td class="leftnav" width="110" height="400" valign="top">
	</td>
	 
 	<!----------------- Top ----------------->
	<td class="top" valign="center" align="center" width="100%">
          	<h1><font color="darkred">My Identity Provider</font></h1>
		<h3 style="margin-top:-9pt">Quick-Start Application</h3>
		<br><hr>

    <!----------------- Body ----------------->
      <DIV id=mainContainer align=center>
        <c:if test="${!empty param.pferror}" >
            <center><font color=red>${param.pferror}<br><br></font></center>
        </c:if>
      <br>
      <h3>User Login</font></h3>

      <table>
        <c:if test="${!empty error}" >
        <tr>
          <td colspan=2><center><font color="red">${error}<br><br></font></center></td>
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
            <td><input title="The default password is 'test'." type="password" name="password" style="width:150px;"/></td>
        </tr>
        <tr>                
            <td></td><td><input type="Submit" value="Login"/></td>
        </tr>
      </table>    
      <BR><BR><BR><br><br><br><br></DIV>
	<TABLE cellSpacing="0" cellPadding="4" border="0" class="footer" align="right">
  	<TR> 
  		<TD align="right" valign="center" style="border-top:1pt">
 		<a href="http://www.pingidentity.com" target="_new">
     		<IMG src="<%=request.getContextPath()%>/images/ping_logo.jpg" border="0"></a>
  		</td>
  	</TR>
	</TABLE>
	</tr>
</table>
<TABLE width="490" cellSpacing="0" cellPadding="4" border="0">
  <TR>   
    <td valign="top">©2011, Ping Identity Corporation. All Rights Reserved.
    </TD>
 </TR>
</TABLE>
</TBODY>
</TABLE>

<input type="hidden" name="action" value="login"/>
<input type="hidden" name="ats" value="${ats}"/>
<input type="hidden" name="resumePath" value="${resumePath}"/>
</CENTER></FORM>

</c:if>

<!---------------------------------------------------------------------------->
<!--show this content if user is starting with IdP - no SSO initiated from SP-->
<!---------------------------------------------------------------------------->


<c:if test="${empty resumePath}" >

<TABLE cellSpacing="0" cellPadding="0" border="0" height=600px width="800" class=mainContainer>

<tr>
 	<!----------------- Left Nav ----------------->
	<td class="leftnav" width="110" height="600" valign="top">
	</td>
	 
	<%@include file="header.jsp"%>

  		<!----------------- Body ----------------->
		<table>
           	<tr>
			<td width="600" class="content" valign="top" height=450>
			Welcome to the Identity Provider (IdP) Quick-Start Application.<br/><br/> 
                  Logging on to an IdP Web site creates an authentication context allowing you to initiate Web single 
                  sign-on (SSO) requests to business partners. This application demonstrates how SSO might be				initiated from an IdP to a partner Service Provider (SP).  The companion SP Quick-Start Application demonstrates a possible result.
                  <br/><br/>
                  Organizations usually control access to Web applications using their own sign-on pages.  Standards-based Web SSO removes this 
			need for authentication at SP sites, providing numerous benefits for all concerned, including:
                  <br/>
                  <ul>
			    <li>Streamlined access to remote Web applications (enhanced end-user experience)</li>
			    <li>For SPs, potential elimination of cumbersome password management and proliferation</li>
			    <li>Reduced help-desk demand for password resets</li>
			    <li>No need for user provisioning between partners</li>
                  </ul>
			</td>


			<!----------------- Login form Right ----------------->
 			<form name="loginForm" action="go" method="POST" >
			<td valign="top">
				<c:if test="${!empty param.pferror}" >
				<center><font color=red>${param.pferror}<br><br></font></center>
				</c:if>
     				<table align="right" cellspacing="3" cellpadding="3">
			<tr>
				<td colspan=2><center><h3>User Login</h3></center> 
				</td>
			</tr>

        			<c:if test="${!empty error}" >
        			<tr>
          			<td colspan=2><center><font color="red">${error}<br><br></font></center></td>
        			</tr>
        			</c:if>

        		<tr>
            		<td align="right">User Id:
				</td>
            		<td>
                		<select name="userid" style="width:156px;" title="Try different users to see different attribute values to be sent to the SP.">
                		<c:forEach items="${userlist}" var="user">
                    		<option value="${user.key}" ${user.value}>${user.key}</option>
                		</c:forEach>
                		</select>
            		</td>
        		</tr>
      		<tr>                
            		<td align="right">Password:</td>
            		<td><input type="password" title="The default password is 'test'." name="password" style="width:150px;"/></td>
        		</tr>
        		<tr>                
            	<td>&nbsp;</td>
			<td><input title="Sign on the IdP application Web portal." type="Submit" value="Sign On"/></td>
        		</tr>
      		<tr><td>&nbsp;
			</td></tr>
			<tr><td colspan="2" title="The default password is 'test' &#151; see the 'Quick Start Guide' for more information.">
			Select a predefined user above, enter the password, and sign on to the IdP Web portal.
			</tr></td>
			</table>    
		
	<input type="hidden" name="action" value="login"/>
	<input type="hidden" name="ats" value="${ats}"/>
	<input type="hidden" name="resumePath" value="${resumePath}"/>
	</form>

    	</TD>


	<%@include file="footer.jsp"%>

</c:if>
<SCRIPT language="JavaScript">
        document.loginForm.password.focus();
</SCRIPT>

</BODY></HTML>
