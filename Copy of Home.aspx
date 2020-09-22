<%@ Page Title="" Language="C#" MasterPageFile="~/Top.master" %>
<%@ Import namespace="System.Data" %>

<script runat="server">

</script>

<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
        <%
            if (Request["Replace"] != null)
            {
                Dal dal = new Dal();
                string sql = "";
                sql = string.Format("UPDATE tblusers SET pass='123' WHERE name='niv'");
                dal.InsertUpdateDelete(sql);
            }
        %>
    <center>
        <input type="submit" name="Replace"  value="Replace"/>
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


