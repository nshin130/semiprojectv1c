<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <h1>SemiProject V1</h1>
</header>
<nav>
    <ul>
        <li><a href="mvc/index">Home</a></li>
        <li><a href="mcv/join">회원가입</a></li>
        
        <c:if test="${empty sessionScope.userid}">
        <li><a href="mvc/login">로그인</a></li>
        </c:if>
        <%-- 유저아이디 세션객체가 empty면 로그인을 띄우고 --%>
        
        <c:if test="${not empty sessionScope.userid}">
        <li><a href="mvc/logout">로그아웃</a></li>
        </c:if>
        <%-- 유저아이디 세션객체가 empty가 아니면 로그아웃을 띄움 --%>
        
        <li><a href="mvc/board/list">게시판</a></li>
        <li><a href="mvc/myinfo">회원정보</a></li>
    </ul>
    <hr>
</nav>
