<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" %>
<%@ Import namespace="System.Data" %>

<script runat="server">

</script>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
        <%
            if((string)Session["login"] != "in")
                Response.Redirect("Login.aspx");
            string sql = "";
            Dal dal = new Dal();
            sql = "select * from tblshops";
            DataTable dt = dal.GetDataTable(sql);
            foreach (DataRow row in dt.Rows)
            {
                if (Request["startlike"+row[1].ToString()] != null)
                {
                    string likevoteusers = row[4].ToString();
                    likevoteusers = likevoteusers + (Session["name"]+",");
                    int likes = int.Parse(row[2].ToString());
                    likes = likes + 1;
                    sql = string.Format("UPDATE tblshops SET likes={0}, lvu='{1}' where name='{2}';", likes,likevoteusers, row[1].ToString());
                    dal.InsertUpdateDelete(sql);
                    Response.Redirect("Home.aspx");
                }
                if (Request["stoplike" + row[1].ToString()] != null)
                {
                    string likevoteusers = row[4].ToString();
                    string removename = (Session["name"] + ",");
                    int len = removename.Length;
                    int startindex = likevoteusers.IndexOf(removename);
                    likevoteusers = likevoteusers.Remove(startindex, len);
                    int likes = int.Parse(row[2].ToString());
                    likes = likes - 1;
                    sql = string.Format("UPDATE tblshops SET likes={0}, lvu='{1}' where name='{2}';", likes, likevoteusers, row[1].ToString());
                    dal.InsertUpdateDelete(sql);
                    Response.Redirect("Home.aspx");
                }
                if (Request["startdislike" + row[1].ToString()] != null)
                {
                    string dislikesvoteusers = row[5].ToString();
                    dislikesvoteusers = dislikesvoteusers + (Session["name"] + ",");
                    int dislikes = int.Parse(row[3].ToString());
                    dislikes = dislikes + 1;
                    sql = string.Format("UPDATE tblshops SET dislikes={0}, dvu='{1}' where name='{2}';", dislikes, dislikesvoteusers, row[1].ToString());
                    dal.InsertUpdateDelete(sql);
                    Response.Redirect("Home.aspx");
                }
                if (Request["stopdislike" + row[1].ToString()] != null)
                {
                    string dislikesvoteusers = row[5].ToString();
                    string removename = (Session["name"] + ",");
                    int len = removename.Length;
                    int startindex = dislikesvoteusers.IndexOf(removename);
                    dislikesvoteusers = dislikesvoteusers.Remove(startindex, len);
                    int dislikes = int.Parse(row[3].ToString());
                    dislikes = dislikes - 1;
                    sql = string.Format("UPDATE tblshops SET dislikes={0}, dvu='{1}' where name='{2}';", dislikes, dislikesvoteusers, row[1].ToString());
                    dal.InsertUpdateDelete(sql);
                    Response.Redirect("Home.aspx");
                }
            }
        %>
        &nbsp;<center>
        <br /><br />
        <div style="overflow-x:auto;">
            <table cellspacing="70">
                <tr>
                    <th class="tablehome">Picture</th>
                    <th class="tablehome">Name</th>
                    <th class="tablehome">Likes</th>
                    <th class="tablehome">Dislikes</th>
                </tr>
                <%
                    foreach (DataRow row in dt.Rows)
                    {
                        %>
                        <tr><td><img src=<%=row[0].ToString() %> style="height: 150px; width: 150px" /></td>
                        <td><h4 class="auto-style1"><%=row[1].ToString()%></h4></td>
                        <td>
                            <h4 class="auto-style2"><img src="Images/like.png" style="height: 30px; width: 30px" /><%=row[2].ToString()%></h4>
                            <%
                              if ((row[4].ToString()).Contains((Session["name"]+ ",")))
                              {
                            %>
                                <br /><input type="submit" name="stoplike<%=row[1].ToString()%>"  style="background-color:green" value="Like"/>
                            <%} 
                              else
                              { %>
                                <br /><input type="submit" name="startlike<%=row[1].ToString()%>"  value="Like"/>
                            <%} %>
                        </td>
                        <td>
                            <h4><img src="Images/dislike.png" style="height: 30px; width: 30px" /><%=row[3].ToString()%></h4>  
                            <%
                            if ((row[5].ToString()).Contains((Session["name"]+ ",")))
                            {
                            %>
                                <br /><input type="submit" name="stopdislike<%=row[1].ToString()%>" style="background-color:red" value="DisLike"/>
                            <%} 
                            else
                            { %>
                                <br /><input type="submit" name="startdislike<%=row[1].ToString()%>"  value="DisLike"/>
                            <%} %>
                        </td>
                        <%
                    }
                %>
            </table>
        </div>
    </center>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            direction: ltr;
        }
        .auto-style2 {
            direction: ltr;
        }
        .tablehome {
        border: 1px solid black;
        }
    </style>
</asp:Content>


