<%@ Page Language="C#" %>
<%@ Import namespace="System.Data" %>
<!DOCTYPE html>

<script runat="server">
 
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            font-family: Algerian;
            font-size: x-large;
            width: 172px;
        }
        .auto-style4 {
            height: 38px;
        }
    </style>
</head>
   
   
    <body background="Images/cold.jpg" style="font-family: 'Arial Black'" >
            <%
            string msg = "";
            
            if (Request["register"] != null)
                Response.Redirect("Register.aspx");
            if (Request["login"] != null)
            {
                string requsername = Request["username1"];
                string reqpassword = Request["password1"];
                string sql = "";
                Dal dal = new Dal();
                sql = "select * from tblusers";
                DataTable dt = dal.GetDataTable(sql);
                foreach (DataRow row in dt.Rows)
                {
                    if (row[0].ToString() == requsername && row[1].ToString() == reqpassword)
                    {
                        Session["login"] = "in";
                        Session["name"] = row[0].ToString();
                        Session["nameuser"] = row[0].ToString();
                        if (row[7].ToString() == "1")
                        {
                            Session["admin"] = "yes";
                        }
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        msg = "the username or password is incorrect!!";
                    }
                }
            }
            %>
         <form id="form2">
            <center style="height: 577px">
            <div>
            <img src="Images/TellUsLogo.png" style="height: 474px; width: 535px" />
            <br /><br /><br />
            <table>
                <tr>
                    <td class="auto-style3">Username:</td>
                    <td><input type="text" name="username1" style="width: 266px; height: 55px; font-family: 'Arial Rounded MT Bold'; font-size: x-large; color: #000000;" /></td>
                </tr>
                <tr>
                    <td class="auto-style3">Password:</td>
                    <td><input type="password" name="password1" style="height: 54px; width: 265px; font-family: 'Arial Rounded MT Bold'; font-size: x-large;" /></td>  
                </tr>
            </table>
            <br />
            <table>
                <tr>
                     <td colspan="2"><br /><br /><input type="submit" name="login"  value="Login" style="height: 55px; width: 260px; color: #00FF00; font-size: x-large; font-family: Algerian; background-color: #009933;"/></td>
                     <td><br /><br /><input type="submit" name="register"  value="Register" style="height: 55px; width: 260px; font-size: x-large; font-family: Algerian; color: #990000; background-color: #CC3300;"/></td>
                </tr>
            </table>
            <br />    
                <h2 style="color:red"><%=msg %></h2>
            </div>   
            </center>
        </form>
    </body>
</html>
