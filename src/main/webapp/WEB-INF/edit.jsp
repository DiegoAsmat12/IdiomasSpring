<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %> <!--Unicamente para update-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Java</title>
		<!--BOOTSTRAP-->
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<header>
				<div class="d-flex justify-content-between">
					<h1 class="text-primary">Edit Language</h1>
					<div class="d-flex">
						<form action="/languages/${ idioma.getId() }" method="post">
							<input type="hidden" name="_method" value="delete">
							<button type="submit" class="btn btn-link">Delete</button>
						</form>
						<a href="/languages" class="btn btn-link">Go back</a>
					</div>
				</div>
			</header>
			<main>
				<div class="row">
					<h1 class="text-primary">Editar idioma</h1>
					<form:form action="/languages/${idioma.getId()}" method="post" modelAttribute="idioma">
						<input type="hidden" name="_method" value="put">
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
						<button type="submit" class="btn btn-primary">Editar</button>
					</form:form>
				</div>
			</main>
		</div>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>