<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Group</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <form role="form" class="form-horizontal" action="/group/delete" method="post">
        <div class="form-group"><h3>Delete Group</h3></div>

        <c:forEach items="${groups}" var="group">
        <div>
        <p> <input type="checkbox" name="toDel[]" value="${group.id}" id="checkbox_${group.id}"/>${group.name}</p>

            </div>
        </c:forEach>

<%--        <select class="selectpicker form-control form-group" name="groupdelete">--%>
<%--            <option value="">Select</option>--%>
<%--            <c:forEach items="${groups}" var="group">--%>
<%--                <option value="${group.id}">${group.name}</option>--%>
<%--            </c:forEach>--%>
<%--        </select>--%>
        <div>
            <input type="submit" class="btn btn-primary" value="Delete">
        </div>
    </form>
</div>

<script>
    $('.dropdown-toggle').dropdown();
    // $('.selectpicker').selectpicker();
    $('#delete_group').click(function(){
        var data = { 'toDel[]' : []};
        $(":checked").each(function() {
            data['toDel[]'].push($(this).val());
        });
        $.post("/group/delete", data, function(data, status) {
            window.location.reload();
        });
    });
</script>
</body>
</html>