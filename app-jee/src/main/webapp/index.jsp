<%-- 
 * Copyright 2015 Red Hat Inc. and/or its affiliates and other contributors
 * as indicated by the @author tags. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Keycloak Example App</title>

        <link rel="stylesheet" type="text/css" href="styles.css"/>
    </head>
    <body>
        <jsp:useBean id="controller" class="org.keycloak.quickstart.appjee.Controller" scope="request"/>
        <c:set var="isLogout" value="<%=controller.isLogout(request)%>"/>
        <c:if test="${isLogout}"><% request.logout(); %></c:if>
        
        <c:set var="isUser" value="<%=controller.isUser(request)%>"/>
        
        <c:if test="${isUser}">
            <c:set var="accountUri" value="<%=controller.getAccountUri(request)%>"/>
        </c:if>
        
        <div class="wrapper">
            <c:if test="${!isUser}">
                <div id="not-authenticated" class="menu">
                    <button onclick="location.href = 'protected.jsp'" type="button">Login</button>
                </div>
            </c:if>

            <c:if test="${isUser}">
                <div id="authenticated" class="menu">
                    <button onclick="location.href = 'index.jsp?action=logout'">Logout</button>
                    <button onclick="location.href = '${accountUri}'" type="button">Account</button>
                </div>
            </c:if>

            <div class="content">
                <button onclick="location.href = 'index.jsp?action=public'">Public</button>
                <button onclick="location.href = 'index.jsp?action=secured'">Secured</button>
                <button onclick="location.href = 'index.jsp?action=admin'">Admin</button>

                <div class="message" id="message"><% out.print(controller.getMessage(request)); %></div>
            </div>
        </div>
    </body>
</html>
