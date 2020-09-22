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
            string shopToEdit = "";
            string msg = "";
            Dal dal = new Dal();
            string sql = "";
            if (Request["updateshop"] != null)
            {
                string name = Request["select"].ToString();
                string PictureLocation = Request["0"];
                int likes = int.Parse(Request["2"]);
                int dislikes = int.Parse(Request["3"]);
                string likevoteusers = Request["4"];
                string dislikevoteusers = Request["5"];
                sql = string.Format("UPDATE tblshops SET pic='{0}',likes={1},dislikes={2},lvu='{3}',dvu='{4}' where name='{5}';", PictureLocation, likes, dislikes, likevoteusers, dislikevoteusers, name);
                dal.InsertUpdateDelete(sql);
            }
            if (Request["editshop"] != null)
            {
                if (Request.Form["select"] != null)
                {
                    isEdit = false;
                    shopToEdit = Request["select"];
                }
                else
                {
                    msg = "You need to select shop!!";
                }
            }
            if (Request["deleteshop"] != null)
            {
                if (Request.Form["select"] != null)
                {
                    string name = Request["select"];
                    sql = string.Format("delete from tblshops where name='{0}'", name);
                    dal.InsertUpdateDelete(sql);
                }
                else
                {
                    msg = "You need to select shop!!";
                }
                
            }

            sql = "select * from tblshops";
            DataTable dt = dal.GetDataTable(sql);
         %>
    <div>
       <center>
           <br /><br />
           <table border="2" style="background-color:lightblue">
               <tr style="background-color:lightgray; color:black">
                   <th>Select Shop</th>
                   <th>Picture Location</th>
                   <th>Name</th>
                   <th>Likes</th>
                   <th>Dislikes</th>
                   <th>Like Vote Users</th>
                   <th>Dislike Vote Users</th>
               </tr>

               
                   <%
                       foreach (DataRow row in dt.Rows)
                       {%>
                           <tr>
                               <% if (!isEdit && shopToEdit == row[1].ToString())
                                  {  %>
                                    <td><input type="radio" name="select"  value='<%=row[1].ToString() %>' checked="checked"/></td>
                               <%}
                                 else{ %>
                                    <td><input type="radio" name="select"  value='<%=row[1].ToString() %>'/></td>
                                <%}
                           for (int i = 0; i <= 5; i++)
                           {
                                   if (!isEdit)
                                   {
                                       if (shopToEdit == row[1].ToString() && i != 1)
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
                           }%>
                            </tr>          
                      <% }
                   %>
               

            <tr>
                 <td ><input type="submit" name="deleteshop"  value="Delete Selected Shop"/></td>
                <%if (isEdit){ %>
                    <td ><input type="submit" name="editshop"  value="Edit Selected Shop"/></td>
                <%} else { %>
                    <td ><input type="submit" name="updateshop"  value="Update Selected Shop"/></td>
                <%} %>
            </tr>
           </table>
           <h2 style="color:red"><%=msg %></h2>
       </center>
    </div>
</asp:Content>

