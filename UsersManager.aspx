<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" %>
<%@ Import namespace="System.Data" %>

<script runat="server">

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" Runat="Server">
        <%
            if ((string)Session["admin"] != "yes")
            {
                Response.Redirect("Home.aspx");
            }
            bool isEdit = true;
            string userToEdit = "";
            string msg = "";
            Dal dal = new Dal();
            string sql = "";
            if (Request["updateuser"] != null)
            {
                    string username = Request["select"].ToString();
                    string Password = Request["1"];
                    string Gmail = Request["2"];
                    int Age = int.Parse(Request["3"]);
                    string FirstName = Request["5"];
                    string LastName = Request["6"];
                    int Admin = int.Parse(Request["7"]);
                    sql = string.Format("UPDATE tblusers SET pass='{0}',gmail='{1}',age={2},firstname='{3}',lastname='{4}',Admin={5} where name='{6}';", Password, Gmail, Age, FirstName, LastName, Admin,username);
                    dal.InsertUpdateDelete(sql);
            }
            if (Request["edituser"] != null)
            {
                if (Request.Form["select"] != null)
                {
                    isEdit = false;
                    userToEdit = Request["select"];
                }
                else
                {
                    msg = "You need to select user!!";
                }
            }
            if (Request["deleteuser"] != null)
            {
                if (Request.Form["select"] != null)
                {
                    string username = Request["select"];
                    sql = string.Format("delete from tblusers where name='{0}'", username);
                    dal.InsertUpdateDelete(sql);
                }
                else
                {
                    msg = "You need to select user!!";
                }
                
            }

            sql = "select * from tblusers";
            DataTable dt = dal.GetDataTable(sql);
         %>
    <div>
       <center>
           <br /><br />
           <table border="2" style="background-color:lightblue">
               <tr style="background-color:lightgray; color:black">
                   <th>Select User</th>
                   <th>Username</th>
                   <th>Password</th>
                   <th>Gmail</th>
                   <th>Age</th>
                   <th>Gender</th>
                   <th>First Name</th>
                   <th>Last Name</th>
                    <th>Admin</th>
               </tr>

               
                   <%
                       foreach (DataRow row in dt.Rows)
                       {%>
                           <tr>
                               <% if (!isEdit && userToEdit == row[0].ToString())
                                  {  %>
                                    <td><input type="radio" name="select"  value='<%=row[0].ToString() %>' checked="checked"/></td>
                               <%}
                                 else{ %>
                                    <td><input type="radio" name="select"  value='<%=row[0].ToString() %>'/></td>
                                <%}
                           for (int i = 0; i <= 7; i++)
                           {
                               if (i == 4)
                               {
                                   int gender = int.Parse(row[i].ToString());
                                   if (gender == 2)
                                   {%>
                                      <td style="background-color:red">Female</td> 
                                    <%}
                                      else
                                      {%>
                                        <td style="background-color:blue">Male</td> 
                                    <%}
                               } 
                               else{

                                   if (!isEdit)
                                   {
                                       if (userToEdit == row[0].ToString() && i != 0)
                                       {%>
                                           <td><input type="text" name='<%=i.ToString() %>' value='<%=row[i].ToString() %>' /></td>   
                                       <%}
                                       else
                                       {%>
                                           <td><%=row[i].ToString() %></td> 
                                       <%}
                                   }
                                       
                                   else{%>
                                        <td><%=row[i].ToString() %></td>  
                               <%}
                            }
                           }%>
                            </tr>          
                      <% }
                   %>
               

            <tr>
                 <td ><input type="submit" name="deleteuser"  value="Delete Selected User"/></td>
                <%if (isEdit){ %>
                    <td ><input type="submit" name="edituser"  value="Edit Selected User"/></td>
                <%} else { %>
                    <td ><input type="submit" name="updateuser"  value="Update Selected User"/></td>
                <%} %>
            </tr>
           </table>
           <h2 style="color:red"><%=msg %></h2>
       </center>
    </div>
</asp:Content>

