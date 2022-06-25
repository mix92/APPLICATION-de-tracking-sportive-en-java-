<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form method="post" action="AddActivityServlet">

			<!--  <label class="control-label" for="date">Date :</label> 
			<input type="date"  id="date" name="date" placeholder="YYYY-MM-DD" >
		
			<label  for="heure_debut">heure de début</label>
			<input type="type="time"  id="heure_debut" name="heure_debut" placeholder="HH:MM" autocomplete="off"> -->
			
			<label for="exampleFormControlSelect1">sport pratiqué</label> 
			<select name="sport_list">
					<option>jogging</option>
					<option>ski</option>
					<option>velo</option>
				</select>
			
			<input type="submit" value="submit">			
		</form>
</body>
</html>