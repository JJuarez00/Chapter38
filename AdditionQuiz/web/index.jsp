<%@page import="java.util.Random"%>
<%@page import="math.checkAnswer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Addition Quiz</title>
</head>
<body>

<h1>Addition Quiz (works once!)</h1> 

<%
    checkAnswer c = new checkAnswer();
    Random random = new Random();

    boolean isNewRequest = true;

    
    if (request.getMethod().equals("POST")) {
        isNewRequest = false; 

        for (int i = 0; i < 10; i++) {
            int userAnswer = Integer.parseInt(request.getParameter("answer" + i));
            int rand1 = Integer.parseInt(request.getParameter("rand1" + i));
            int rand2 = Integer.parseInt(request.getParameter("rand2" + i));
            boolean isCorrect = c.checkAnswer(userAnswer, rand1, rand2); // Check if the answer is correct
    %>
    
    <p> <%= String.format("%02d", i + 1) %>. <%= rand1 %> + <%= rand2 %> = 
        <input type="text" name="answer<%= i %>" value="<%= userAnswer %>" readonly>
        <% if (isCorrect) { %>
            <span style="color: green;">Correct!</span>
        <% } else { %>
            <span style="color: red;">Incorrect. The correct answer is <%= rand1 + rand2 %></span>
        <% } %>
    </p>
    <br>
    <%
            // Increment correct answer counter
            if (isCorrect) {
                c.incrementCorrect(); 
            } else {
            // Increment wrong answer counter
                c.incrementWrong(); 
            }
        }
    }
%>

<form method="post">
    <%
        if (isNewRequest) {
            for (int i = 0; i < 10; i++) {
                int questionNumber = i + 1;
                int rand1 = random.nextInt(99) + 1;
                int rand2 = random.nextInt(99) + 1;
    %>
    <p> <%= String.format("%02d", questionNumber) %>. <%= rand1 %> + <%= rand2 %> = 
        <input type="text" name="answer<%= i %>" required>
        <input type="hidden" name="rand1<%= i %>" value="<%= rand1 %>">
        <input type="hidden" name="rand2<%= i %>" value="<%= rand2 %>">
    </p>
    
    <br>
    <%
            }
        }
    %>
    <input type="submit" value="Submit">
</form>

<p> Correct Answers: <%= c.getCorrect() %></p>
<p> Wrong Answers: <%= c.getWrong() %> </p>

</body>
</html>
