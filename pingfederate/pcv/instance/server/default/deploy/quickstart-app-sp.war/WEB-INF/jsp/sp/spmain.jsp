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
<TITLE>Quick-Start SP Application - Target Resource</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>
    <META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0">
<CENTER><BR><BR>
<TABLE cellSpacing="0" cellPadding="0" border="0" width="800">
  <TBODY>

<%@include file="header.jsp"%>
<c:if test="${!empty SPUser.otherAttributes.name}">${SPUser.otherAttributes.name} logged in | 
</c:if> 
<c:if test="${!empty id_provided_by}">
<a href="<c:url value='/go?action=logout'/>" title=" Log out of SP but retain SSO status &#151; no need to reauthenticate "<b>Local Logout</b></a></TD></TR></c:if>
<c:if test="${empty id_provided_by}">
<a href="<c:url value='/go?action=logout'/>" title=" Log out of SP "<b>Logout</b></a></TD></TR></c:if>

  <TR>


    <!----------------- Body ----------------->
    <TD class=spleftnav vAlign="top" align="left" width="50%" height="100%">

      <br>
      <DIV id=mainContainer align=center>
<c:if test="${!empty param.pferror}" >
<center><font color=red>${param.pferror}<br><br></font></center>
</c:if>
      <h3 title=" You can add, change, or map attributes in the administrative console. "><h4 style="margin-top:-10pt"><c:if test="${empty id_provided_by}">Local </c:if>User Attributes</h3>
<c:if test="${!empty id_provided_by}"><h4 style="margin-top:-10pt">From the IdP</h4></c:if>
      <TABLE cellSpacing=2 width="358" style="table-layout:fixed;overflow:hidden" border="0" title=" You can add, change, or map attributes in the administrative console. ">
        <TBODY>
        <TR>
          <TD width="150" class=rightcellheader><B>Attribute</B></TD>
          <TD class=rightcellheader><B>Value</B></TD></TR>
        <TR>
          <TD width="150" class=content>UserId</TD>
          <TD class=content>${SPUser.userid}</TD></TR>
        <c:if test="${!empty SPUser.email}">
            <TR>
              <TD width="150" class=content>Email</TD>
              <TD class=content>${SPUser.email}</TD></TR>
        </c:if>
        <c:if test="${!empty SPUser.firstName}">         
        <TR>
          <TD width="150" class=content>First Name</TD>
          <TD class=content>${SPUser.firstName}</TD></TR>
        </c:if>
        <c:if test="${!empty SPUser.lastName}">
        <TR>
          <TD width="150" class=content>Last Name</TD>
          <TD class=content>${SPUser.lastName}</TD></TR>
        </c:if>
        <c:forEach var="attr" items="${SPUser.otherAttributes}">
            <TR>
                <TD width="150" class=content><div STYLE="word-wrap: break-word">${attr.key}</div></TD>
                <TD class=content><div STYLE="word-wrap: break-word">${attr.value}</div></TD></TR>
        </c:forEach>
        </TBODY></TABLE>

<c:if test="${!empty id_provided_by}" >
        <!--for IdP Discovery>
	<BR>
        <font color="#6a87b1">Identity is provided by ${id_provided_by}</font>
	-->
	  <br/>
	<!--for Attribute Query>
	<hr width="100px" align="center"/>
	  <a href="<c:url value='/go?action=attributequeryform'/>">Attribute Query</a>
	  <br/>
        <hr width="100px" align="center"/>
	-->
	<br/><br/><br/>

<span style="FONT-SIZE: 11pt;font-weight:normal"><a href="${pfurl}/sp/defederate.ping" title="See the Quick-Start Guide.">Terminate Account Link</a>
</span>

      <BR>
</DIV>



</c:if>
<br>
</TD>


    <!----------------- buttons ----------------->
    <TD class=sprightcontent vAlign="top" height="100%">
      <BR><BR>
     <c:if test="${not empty id_provided_by}" >
<div style="margin-right:5pt" title=" Check the server command window or log files to see processing information. ">Welcome<c:if test="${!empty SPUser.otherAttributes.name}">, ${SPUser.otherAttributes.name}</c:if>. <br><br>
You have successfully signed on to this Service Provider (SP) site using SSO &#151; your identity has been verified by the Identity Provider (IdP) who maintains your login credentials.</div><br>
<div style="margin-right:5pt" title=" You can add, change, or map attributes in the administrative console. ">The IdP has also sent along some information about you ("User Attributes" at left), which a real partner SP would use to enhance and streamline your experience at its site. </div><br>
<div style="margin-right:5pt;margin-bottom:10pt" title=" The single logout (SLO) bindings are configured in the ${idp.entityId} connection. ">You can now either log out of this SP session locally (using the link in the navigation bar above) or log out globally (using the Single Logout links below, which exercise different SAML bindings).  
If you log out locally, you will not have to sign on at the IdP site again to reach this domain via SSO, since your IdP session is still active.  Single logout ends both your IdP and SP sessions, and you will be asked to log on again at the IdP.
</div><BR>
<div style="margin-right:5pt;margin-bottom:10pt" title=" See the Quick-Start Guide. "><b>Note:</b>  The "Terminate Account Link" hyperlink (at left) causes an error unless you modify the SP configuration to enable account linking, which establishes a persistent association between two accounts for the same user in different domains. </div><BR>
    </c:if>
     <c:if test="${empty id_provided_by}" >
<div>You are signed in locally to the Service Provider application.</div>
    </c:if>
</tr></td>
     <c:if test="${not empty id_provided_by}" >
  <TR>
    <TD width=400>
      <img height="35" src="<c:url value='images/topnav_lower_left.gif'/>" width=405 border="0"></TD>
    <TD class=where vAlign=center align=right width=400>
      <a href="${pfurl}/sp/startSLO.ping" title=" Global logout via the default binding ">Single Logout</a> | via: 
      <a href="${pfurl}/sp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect" title=" Global logout via the Redirect Binding ">Redirect</a> | 
      <a href="${pfurl}/sp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST" title=" Global logout via the POST Binding ">POST</a> | 
      <a href="${pfurl}/sp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact" title=" Global logout via the Artifact Binding ">Artifact</a> | 
      <a href="${pfurl}/sp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:SOAP" title=" Global logout via the SOAP Binding ">SOAP</a>
    </TD>
  </TR>
    </c:if>
  </TBODY>
</TABLE>

<%@include file="footer.jsp"%>

</CENTER></BODY></HTML>
