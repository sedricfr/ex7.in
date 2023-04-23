<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> IPL_7💻</title>
</head>

<body>
    <%
    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3307/movies";

// Database credentials
String USER = "root";
String PASS = "";

// Set response content type
response.setContentType("text/html");
PrintWriter out1 = response.getWriter();

String title = "Database Result [ JSP ]";

out1.println( "<html>\n");
out1.println(   "<head><title>" +title + "</title> ");
//out1.println(   "<link rel='stylesheet' href='http://localhost:8080/Myjsp/style.css'>");
 out1.println("</head>\n"); 
 out1.println("<body bgcolor = \"#f0f0f0\">\n");
    out1.println( "<center><h1 > "+title +"</h1></center>");
try {
    // Register JDBC driver
    Class.forName(JDBC_DRIVER);

    // Open a connection
    Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

    // Execute SQL query
    Statement stmt = conn.createStatement();
    String sql;
    sql = "SELECT * FROM shows;";
    ResultSet rs = stmt.executeQuery(sql);

   
    out1.println(" <style> th, td { ");
        out1.println("padding-top: 10px;");
        out1.println(" padding-bottom: 20px;");
        out1.println("padding-left: 30px;");
        out1.println("padding-right: 40px;");
        out1.println("} </style><center><div><table border = 1 >");
    
    out1.println("<center><div><table border = 1 >");
    out1.println("<tr><td> Title </td>'");
    out1.println("<td> Year </td>");
    out1.println("<td> Country of Origin </td>");
    out1.println("<td> Comment </td></tr>");

    // Extract data from result set
    while (rs.next()) {
        // Retrieve by column name
        String Title = rs.getString("Title");
        String year = rs.getString("year");
        String co = rs.getString("co");
        String comment = rs.getString("comment");

        // Display values
        out1.println("<tr> <td>" + Title + " </td>");
        out1.println("<td>" + year + "</td>");
        out1.println("<td>" + co + "</td>");
        out1.println("<td >" + comment + "</td>");
        out1.println(
                "<td > ");
        out1.println("<form action='p7i.jsp' method ='post'>");// onclick='window.open('comment','_blank')
        out1.println("<input type='text' name='input'>");
        out1.print("<input type='hidden' name='yr' value='" + year + "'>");
        out1.print("<input type='submit' value='UPDATE'>");
        out1.print("</form> ");
        out1.println("</td></tr> ");
    }

    out1.println("</table></div></center>");
    out1.println("</body></html>");

    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out1.print("Do not connect to DB - Error:" + e);
}


%>
</body>
</html>
