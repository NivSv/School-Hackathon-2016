<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" %>

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
        string msg = "";
        if (Request["create"] != null)
        {
            string Name = Request["Name"];
            string PictureLocation = Request["PictureLocation"];
            if (Name != "" && PictureLocation != "")
            {
                string sql = string.Format("insert into tblshops values ('{0}', '{1}', {2}, {3},'{4}','{5}')", PictureLocation, Name, 0, 0, "", "");
                Dal dal = new Dal();
                dal.InsertUpdateDelete(sql);
                msg = "Created!!";
            }
            else
            {
                msg = " Input Invalid !!!";
            }
        }
    %>
                      <center><br /><br />
                      <table style="width: 488px;">
                       <tr>
                           <td class="auto-style16">Name:</td>
                           <td><input type="text" name="Name" style="width: 297px; height: 45px; font-family: Arial; font-size: x-large; color: #000000;" /></td>
                       </tr>
                       <tr>
                           <td class="auto-style16">Picture Location:</td>
                           <td><input type="text" name="PictureLocation" style="width: 297px; height: 45px; font-family: Arial; font-size: x-large; color: #000000;" /></td>
                        </tr> 
                    </table>
                    <br />
                  <input type="submit" name="create"  value="Create" style="height: 55px; width: 260px; font-size: x-large; font-family: Algerian; color: black; background-color: green;"/><br /><br />
                  <h2 style="color:red"><%=msg %></h2>
                  </center>
</asp:Content>

