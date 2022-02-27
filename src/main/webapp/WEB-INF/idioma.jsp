<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<h1 class="text-primary">Language Details</h1>
					<a href="/languages" class="btn btn-link">Dashboard</a>
				</div>
			</header>
			<main>
				<div class="row">
					<p>Name: <c:out value="${idioma.getName()}"></c:out></p>
					<p>Creator: <c:out value="${idioma.getCreator()}"></c:out></p>
					<p>Version: <c:out value="${idioma.getCurrentVersion()}"></c:out></p>
					<p><a href="/languages/${ idioma.getId() }/edit" class="btn btn-link">Editar</a></p>
					<form action="/languages/${ idioma.getId() }" method="post">
						<input type="hidden" name="_method" value="delete">
						<button type="submit" class="btn btn-link">Delete</button>
					</form>
				</div>
			</main>
		</div>
		
		<!--BOOTSTRAP-->
		<script src="/webjars/jquery/jquery.min.js"></script>
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>