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
  
<a href="https://www.pingidentity.com/our-solutions/pingfederate.cfm" target="_new"  title=" PingFederate Information ">Product Info</a> | 
<!--<a href="javascript: w = window.open('https://localhost:9999/pingfederate/app?service=external/supportPopUp', 'PingFederatePopup', 'top=100,left=100,height=800,width=800,scrollbars'); w.focus();" title=" Support Information ">Support</a> | -->
<a href="go?showHideAdvanced" title=" SSO variations and extras ">${sessionScope.showAdvanced ? 'Hide' : 'Advanced'} SSO Options</a> | 
<a href="go?action=dynafedform" title=" Use Auto-Connect ">Auto-Connect</a> | 
<a href="<c:url value='/go?action=login'/>" title=" Login to SP without using SSO ">Local Login</a></TD></TR>

  <TR>
    <!----------------- Body ----------------->
    <TD class=spbodycontent vAlign="top" align="left" width="800" height="100%" colspan="2">
      <DIV id=mainContainer align=center><br/>
      <div style="margin-left:20pt;margin-right:20pt;margin-bottom:15pt; text-align:left">Welcome! This Service Provider (SP) provides single-sign-on access to local resources via a remote Identity Provider (IdP).  The button below takes you to the IdP logon page or the SP target-resource page depending on your authentication status at the IdP.</div>
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

        <form action="<c:url value='/go'/>" method="get">
            <input type="hidden" name="action" value="sso"/>
            <tr>
                <td>IdP Partner: </td>
                <td>
                    <select name="PartnerIdpId" title=" You can configure additional IdP partner connections in the administrative  console. ">
                        <c:forEach items="${idplist}" var="idp"><option value="${idp.entityId}">${idp.company}</option></c:forEach>
                    </select>
                </td>
            </tr>

            <c:choose>
                <c:when test="${sessionScope.showAdvanced}">
			  <tr align="center"><td colspan="2" align="center"><hr/></td></tr>
                    <!--<tr>
                        <td>Do NOT Allow Create: </td>
                        <td>
                            <input title="See the 'Quick Start Guide' for information." type="checkbox" name="AllowCreate" value="false"/>
                        </td>
                    </tr>
			  -->
                    <tr>
                        <td>Binding: </td>
                        <td>
                            <select title="See the 'Quick Start Guide' for information." name="Binding">
                                <option value="">default</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect">Redirect</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST">POST</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact">Artifact</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Requested Binding: </td>
                        <td>
                            <select title="See the 'Quick Start Guide' for information." name="RequestedBinding">
                                <option value="">default</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST">POST</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Artifact">Artifact</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Requested ACS Index: </td>
                        <td>
                            <select title="See the 'Quick Start Guide' for information." name="RequestedACSIdx">
                                <option value="">default</option>
                                <option value="0">0 (POST)</option>
                                <option value="1">1 (Artifact)</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Requested Name ID Format: </td>
                        <td>
                            <select title="See the 'Quick Start Guide' for information." name="RequestedFormat">
                                <option value="">none</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:transient">transient</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:persistent">persistent</option>
                                <option value="urn:oasis:names:tc:SAML:2.0:nameid-format:encrypted">encrypted</option>
                                <option value="urn:oasis:names:tc:SAML:1.1:nameid-format:unspecified">unspecified</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Is Passive: </td>
                        <td>
                            <input title="See the 'Quick Start Guide' for information." type="checkbox" name="IsPassive" value="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Force Authn: </td>
                        <td>
                            <input title="See the 'Quick Start Guide' for information." type="checkbox" name="ForceAuthn" value="true"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>AllowCreate: </td>
                        <td>
                            <input title="See the 'Quick Start Guide' for information." type="checkbox" name="AllowCreate" value="true"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Requested SPNameQualifier: </td>
                        <td>
                            <input title="See the 'Quick Start Guide' for information." type="text" name="RequestedSPNameQualifier"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Requested Authentication Context(s): </td>
                        <td>
                            <input title="" type="text" name="RequestedAuthnCtx"/><br/>
                            <input title="" type="text" name="RequestedAuthnCtx"/><br/>
                            <input title="" type="text" name="RequestedAuthnCtx"/>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>Authentication Context Comparison Method: </td>
                        <td>
                            <input title="" type="text" name="CtxComparisonMethod"/><br/>
                        </td>
                    </tr>
                    
                <tr align="center"><td colspan="2" align="center"><hr/></td></tr>
		</c:when>
            </c:choose>

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
