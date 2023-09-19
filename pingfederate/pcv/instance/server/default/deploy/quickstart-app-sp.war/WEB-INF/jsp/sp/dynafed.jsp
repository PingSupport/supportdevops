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
<TITLE>Welcome to the SP Quick-Start Application</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>
</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0">
<CENTER><BR><BR>
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
    <TD class=spbodycontent vAlign="top" align="left" width="800" height="100%" colspan="2">
    
      <br>
      <DIV id=mainContainer align=center>
      <h3>Auto-Connect</h3>
   
      <DIV id=mainContainer align=center>
      <div style="margin-left:20pt;margin-right:20pt;margin-bottom:15pt; text-align:left">This SP will discover the IdP that corresponds to your email address dynamically. You will be redirected to the IdP for authentication.</div>
      <table>
        <c:if test="${!empty param.pferror}" >
        <tr>
          <td colspan=2><center><font color=red>${param.pferror}<br><br></font></center></td>
        </tr>
        </c:if>

        <c:if test="${!empty error}" >
        <tr>
          <td colspan=2><center><font color=red>${error}<br><br></font></center></td>
        </tr>
        </c:if>

        <form name="dynaForm" action="<c:url value='/go'/>" method="get">
            <input type="hidden" name="action" value="dynafedsso"/>
            
	    <tr>
		<td title=" Use 'localhost' as the domain name. ">Enter Email Address: </td>
		<td>
		    <input title=" Use 'localhost' as the domain name. " type="text" name="email" size="36" />
		</td>
	    </tr>

            <tr colspan="2">
                <td></td>
                <td colspan="2">
                    <BR>
                    	<input type="submit" value=" Single Sign-On " title=" Sign on with IdP (if not done already) to use resources at this SP site "/>
		</td>
            </tr>
            <tr colspan="2"><td></td><td colspan="2">&nbsp;</td></tr>
            
            <tr><td><c:if test="${!empty SPUser.otherAttributes.name}">${SPUser.otherAttributes.name} logged in
</c:if> 
</td></tr>

<SCRIPT language="JavaScript">
        document.dynaForm.email.focus();
</SCRIPT>
            </form>
</table>    
      <!--<div style="margin-left:20pt;margin-right:20pt;text-align:left;margin-top:10pt;">If you have added any IdP connection configurations in PingFederate, you can <a href="${pfurl}/sp/cdcstartSSO.ping" title=" Look up Identity Providers ">look up your IdP</a>.
</div>-->

</DIV>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<%@include file="footer.jsp"%>

</CENTER></BODY></HTML>
