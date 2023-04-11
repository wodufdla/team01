<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PrkSttusInfo _주차장 시설정보</title>
<script language=JavaScript>
    var arr = new Array();
    <c:forEach items="${listPSI}" var="item">        
            arr.push({prk_cmprt_co: "${item.prk_cmprt_co}"
                    ,prk_center_id : "${item.prk_center_id}"});
    </c:forEach>
    console.log("arr ::: ", arr);
</script>
</head>
<body>
PrkSttusInfo



</body>
</html>