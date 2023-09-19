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
<TITLE>PingFederate Quick-Start IdP Application - Web Portal</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
    <LINK media=screen href="<c:url value='/images/demostyle.css'/>" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>

<BODY leftMargin="0" topMargin="0" rightMargin="0" marginheight="0" marginwidth="0" background=<%=request.getContextPath()%>/images/bkgdPage.gif>

<TABLE cellSpacing="0" cellPadding="0" border="0" height=600px width="800" class=mainContainer>

<tr>
 	<!----------------- Left Nav ----------------->
	<td class="leftnav" width="110" height="600" valign="top">
		<div class="leftnav"><a href="https://www.pingidentity.com/our-solutions/pingfederate.cfm" target="_new"  title=" PingFederate Information ">Product Info</a></div>
		<div class="leftnav"><a href="<c:url value='/go?action=logout'/>" >Local Logout</a></div>
		<hr width=40 align="right" style="margin-top:8pt;">
      	<div class="leftnav"><a href="${pfurl}/idp/startSLO.ping?InErrorResource=<c:url value='/go?action=logout'/>" title=" Global logout via the default binding ">Single Logout</a> via:</div> 
      	<div class="leftnav"><a href="${pfurl}/idp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect&InErrorResource=<c:url value='/go?action=logout'/>" title=" Global logout via the Redirect Binding ">Redirect</a></div>
      	<div class="leftnav"><a href="${pfurl}/idp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST&InErrorResource=<c:url value='/go?action=logout'/>" title=" Global logout via the POST Binding ">POST</a></div>
      	<div class="leftnav"><a href="${pfurl}/idp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact&InErrorResource=<c:url value='/go?action=logout'/>" title=" Global logout via the Artifact Binding ">Artifact</a></div>
      	<div class="leftnav"><a href="${pfurl}/idp/startSLO.ping?Binding=urn:oasis:names:tc:SAML:2.0:bindings:SOAP&InErrorResource=<c:url value='/go?action=logout'/>" title=" Global logout via the SOAP Binding ">SOAP</a></div>
            <hr width=40 align="right" style="margin-top:8pt;">
		<div class="leftnav"><a href="go?showHideAdvanced">${sessionScope.showAdvanced ? 'Hide' : 'Advanced'} SSO Options</a></td></div>

	</td>
	 
	<%@include file="header.jsp"%>

  	<!----------------- Body ----------------->
	<table>
         <tr>
		<td width="600" class="content" valign="top" height=450>
		Greetings<c:if test="${!empty IdPUser.firstName}">, ${IdPUser.firstName}</c:if>. <br><br>
            <div title=" You can configure additional SP partner connections in the administrative console. ">From this Web portal, you can initiate SSO to your organization's 
            business partners. To access a protected Web page hosted by a partner, select the connection name in the drop-down 
            at the right and click the "Single Sign-On" button.</div>
            <br>
            <div title=" You can add, change, and map attributes in the PingFederate administrative console. ">SSO requests carry information about your authentication event. While partners have no access to your 
            password, they trust the IdP's assertion that you provided the correct credentials. If you perform a local or global logout, 
            you must reauthenticate before completing subsequent SSO requests.</div>
            <br>
            <div title=" The 'Attribute Contract' can be adjusted in the partner-connection configuration. ">The table below shows some information about you. Some or all of these attributes may be sent to your partners along with your 
            authentication information in the SAML assertion. Your partners may use these attributes to personalize your view of their services.
            </div>
           <DIV id=mainContainer align=center valign="bottom">
	  <TABLE valign="bottom" title=" You can add, change, and map attributes in the PingFederate administrative console. " cellSpacing=3 width=300 border="0" valign="abs_bottom" align="center">

        <TR>
        <td align="center" colspan="2"><h3>User Attributes</h3></td>
	  </tr>
		<TD class=rightcellheader width=167><B>Attribute</B></TD>
          <TD class=rightcellheader width=167><B>Value</B></TD></TR>
        <TR>
          <TD class=att_table>UserId</TD>
          <TD class=att_table>${IdPUser.userid}</TD></TR>
        <TR>
          <TD class=att_table>Email</TD>
          <TD class=att_table>${IdPUser.email}</TD></TR>
        <TR>
          <TD class=att_table>First Name</TD>
          <TD class=att_table>${IdPUser.firstName}</TD></TR>
        <TR>
          <TD class=att_table>Last Name</TD>
          <TD class=att_table>${IdPUser.lastName}</TD></TR>
        </TBODY></TABLE>

		</DIV>
    		</TD>


    <!----------------- form ----------------->
      	<form name="mainForm" action="go" method="POST" >
		<td width=230 valign="top">

      	<center><h3>Single Sign-on</h3><center>
        	<table width=220>
            <tr>
                <td colspan="2" align="center">Service Provider:&nbsp;&nbsp;<select title=" You can configure additional SP partner connections in the administrative console. " name="PartnerSpId">
                        <c:forEach items="${splist}" var="sp"><option value="${sp.entityId}">${sp.company}</option></c:forEach>
                    </select>
                </td>
            </tr>
            <c:if test="${sessionScope.showAdvanced}">
             <tr><td colspan=2><hr width="130"></td></tr>
		 <tr>
                <td>Binding: </td>
                <td>
                   <select title="See the 'Quick Start Guide' for information." name="Binding">
                        <option value="">default</option>
                        <!--<option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect">Redirect</option>-->
                        <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST">POST</option>
                        <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact">Artifact</option>
                    </select>
                </td>
            </tr>
		 <tr>
                <td>ACSIdx: </td>
                <td>
                    <input title="See the 'Quick Start Guide' for information." type="text" name="ACSIdx"/>
                </td>
            </tr>
            <tr>                
			<td >Name ID Format: </td>
                <td>
                    <select title="See the 'Quick Start Guide' for information." name="RequestedFormat">
                        <option value="">none</option>
                        <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">transient</option>
                        <option title="Modify the connection configuration to use--see the 'Quick Start Guide'."  value="urn:oasis:names:tc:SAML:2.0:nameid-format:persistent">persistent</option>
                        <option title="Modify the connection configuration to use--see the 'Quick Start Guide'." value="urn:oasis:names:tc:SAML:2.0:nameid-format:encrypted">encrypted</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Target URL: </td>
                <td>
                    <input title="See the 'Quick Start Guide' for information." type="text" name="TargetResource"/>
                </td>
            </tr>
		<tr><td colspan=2><hr width="130"></td></tr>
		</c:if>
 		<tr><td>&nbsp;</td></tr>
            <tr>
                <td colspan="2" align="center" title=" Check the server command window or log files to see processing information. ">
                    <input type="hidden" name="action" value="sso"/>
                    <input type="submit" value=" Single Sign-On "/>
                </td>
            </tr>
             <!--<tr>
                <td colspan="2" align="center"><BR><a href="${pfurl}/idp/writecdc.ping">Set Common Domain Cookie</a></td>
            </tr>-->

            

        </table>
      <BR><BR><BR><BR><BR><BR><BR><BR><BR><BR>
    </TD>
  </TR>
  </TBODY>
	
	<%@include file="footer.jsp"%>

</TABLE>

</form></BODY></HTML>
