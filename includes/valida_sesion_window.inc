<%
If Session("usu") = "" Then%>
   <script>
      opener.top.location.href = "../"
      window.close();
   </script><%
End If
%>