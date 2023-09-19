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
<TITLE>Quick-Start SP Application - Attribute Query Results</TITLE>
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
    <TD class=spbodycontent vAlign="top" align="left" width="800" height="100%" colspan=2>
      <br>
      <DIV id=mainContainer align=center>
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
            <td colspan=2 align="center">
      	      <h3>Query Result</h3>
            
		      <TABLE cellSpacing=2 width=300 border="0">
		        <TBODY>
		        <TR>
		          <TD class=rightcellheader width=167><B>Attribute</B></TD>
		          <TD class=rightcellheader width=167><B>Value</B></TD></TR>
		        <c:forEach var="attr" items="${attributes}">
		            <TR>
		                <TD class=content>${attr.key}</TD>
		                <TD class=content>${attr.value}</TD></TR>
		        </c:forEach>
		        </TBODY></TABLE>
	        
		      <BR><BR>
		
		      <form action="/go?action=attributequeryform" method="GET">
              	<input type="submit" value=" Main Form "/>
              </form>
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
