<%@ page 
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty sessionScope.userid}">
	<script>
		alert('로그인하세요!');
		location.href='/mvc/login';
	</script>
</c:if>
<%-- 보안설정; 로그인하지 않으면 볼수 없도록 --%>

<fmt:setBundle basename="nshin.jdbc"/>
<fmt:message key="url" var="url" />
<fmt:message key="drv" var="drv" />
<fmt:message key="usr" var="usr" />
<fmt:message key="pwd" var="pwd" />

<sql:setDataSource url="${url}" driver="${drv}" user="${usr}" password="${pwd}" var="mariadb"/>

<sql:query var="rs" dataSource="${mariadb}">
	select name, email, joindate from member
	where userid = ?
	<sql:param value="${sessionScope.userid}" />
	<%-- 조건절(where)에 들어갈 값을 지정 (세션객체에 생성된 유저아이디)--%>
</sql:query>
<%-- 세션객체가 제대로 생성된 경우(즉 로그인성공시)
	 로그인한 회원정보(아이디 이름 이메일 가입일)가 출력되도록 함(DB연동) 
	 userid는 세션생성시 불러와짐; sessionScope.userid--%>

<c:forEach var="row" items="${rs.rows}">
	<c:set var="name" value="${row.name}"/>
	<c:set var="email" value="${row.email}"/>
	<c:set var="joindate" value="${row.joindate}"/>
	<%-- 조회한 결과 집합에서 변수를 생성함 --%>
</c:forEach>



        <div id="container">
            <h2>회원정보</h2>
            <div id="myinfo">
                <div><span class="label">아이디</span>
                          <span>${sessionScope.userid}</span></div>
                <div><span class="label">이름</span>
                          <span>${name}</span></div>
                <div><span class="label">이메일</span>
                          <span>${email}</span></div>
                <div><span class="label">가입일</span>
                          <span>${joindate}</span></div>
            </div>
        </div>
