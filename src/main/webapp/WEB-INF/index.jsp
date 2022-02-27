<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Languages</title>
		<!--BOOTSTRAP-->
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<main class="container">
			<div class="row table-container">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Creator</th>
							<th scope="col">Version</th>
							<th scope="col">Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="idioma" items="${ listaIdiomas }">
							<tr>
								<td><a href="/languages/${ idioma.getId() }" class="btn btn-link"><c:out value="${idioma.getName()}"></c:out></a></td>
								<td><c:out value="${idioma.getCreator()}"></c:out></td>
								<td><c:out value="${idioma.getCurrentVersion()}"></c:out></td>
								<td class="d-flex">
									<form action="/languages/${ idioma.getId() }" method="post">
										<input type="hidden" name="_method" value="delete">
										<button type="submit" class="btn btn-link">Delete</button>
									</form>
									<a href="/languages/${ idioma.getId() }/edit" class="btn btn-link"></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
				<h1 class="text-primary">Añadir un idioma</h1>
				<form:form action="/languages" method="post" modelAttribute="idioma">
						<form:errors path="name" class="alert alert-danger d-block"></form:errors>
						<form:errors path="creator" class="alert alert-danger d-block"></form:errors>
						<form:errors path="currentVersion" class="alert alert-danger d-block"></form:errors>
					<div class="form-group mb-3">
						<form:label path="name">Name:</form:label>
						<form:input path="name" class="form-control"/>
					</div>
					<div class="form-group mb-3">
						<form:label path="creator">Creator:</form:label>
						<form:input path="creator" class="form-control"/>
					</div>
					<div class="form-group mb-3">
						<form:label path="currentVersion">Version:</form:label>
						<form:input path="currentVersion" class="form-control"/>
					</div>
					<button type="submit" class="btn btn-primary">Registrar</button>
				</form:form>
			</div>
		</main>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>