<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style7 {
            font-family: Algerian;
            font-size: x-large;
            width: 172px;
            height: 57px;
            color: #000000;
        }
        .auto-style8 {
            height: 57px;
        }
        .auto-style16 {
            font-family: Algerian;
            font-size: x-large;
            width: 172px;
            color: #000000;
        }
        .auto-style17 {
            height: 45px;
            width: 161px;
        }
        </style>
</head>
    <body background="Images/cold.jpg" style="font-family: 'Arial Black'" >
    <%
        string ms = "*";
        string msg = "";
        if (Request["finish"] != null)
        {
            string reqfirstname = Request["firstname"];
            string reqlastname = Request["lastname"];
            string requsername = Request["username"];
            string reqpassword = Request["password"];
            string reqemail = Request["email"];
            string reqage = Request["age"];
            string reqgender = Request["gender"];
            if (reqfirstname != "" && reqlastname != "" && requsername != "" && reqpassword != "" && reqemail != "" && reqage != "")
            {
                if (int.Parse(reqage) >= 0)
                {
                    string sql = string.Format("insert into tblusers values ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}', {7})", requsername, reqpassword, reqemail, reqage, reqgender, reqfirstname, reqlastname, 0);
                    Dal dal = new Dal();
                    dal.InsertUpdateDelete(sql);
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    msg = " Invalid Age !!!";
                }
            }
            else
            {
                msg = " Input Invalid !!!";
            }
        }
         %>
      <center style="height: 577px">
         <form id="form1">
             <div>
                  <img src="Images/TellUsLogo.png" style="height: 474px; width: 535px" />
                  <br />
               <table>
                 <td style="font-family: Arial; font-size: x-large; color: #f00;" class="auto-style17" ><% =msg %></td>

               </table>  
                  <table style="width: 488px; color: #CC0000;">
                       <tr>

                            <td class="auto-style1"><% =ms%></td>
                           <td class="auto-style16">Firstname:</td>
                           <td><input type="text" name="firstname" style="width: 297px; height: 45px; font-family: Arial; font-size: x-large; color: #000000;" /></td>
                       </tr>
                       <tr>
                           <td class="auto-style1"><% =ms%></td>
                           <td class="auto-style16">Lastname:</td>
                           <td><input type="text" name="lastname" style="width: 297px; height: 45px; font-family: Arial; font-size: x-large; color: #000000;" /></td>
                        </tr> 
                        <tr>
                             <td class="auto-style1"><% =ms%></td>
                           <td class="auto-style16">Username:</td>
                           <td><input type="text" name="username" style="width: 297px; height: 45px; font-family: Arial; font-size: x-large; color: #000000;" /></td>
                        </tr>
                        <tr>
                             <td class="auto-style1"><% =ms%></td>
                            <td class="auto-style16">Password:</td>
                            <td><input type="password" name="password" style="height: 45px; width: 297px; font-family: Arial; font-size: x-large;" size="20" /></td>    
                        </tr>
                        <tr>
                             <td class="auto-style1"><% =ms%></td>
                            <td class="auto-style16">Email:</td>
                            <td><input type="email" name="email" style="height: 45px; width: 297px; font-family: Arial; font-size: x-large;" size="20" /></td>           
                        </tr>
                        <tr>
                             <td class="auto-style1"><% =ms%></td>
                            <td class="auto-style16">Age:</td>
                            <td><input type="number" name="age" style="height: 45px; width: 297px; font-family: Arial; font-size: x-large; margin-bottom: 2px;"  /></td>
                        </tr>
                        <tr>
                            <td class="auto-style1"><% =ms%></td>
                            <td class="auto-style7">Gender:</td>
                            <td colspan="2" class="auto-style8"> 
                            <select name="gender" style="height: 45px; width: 301px; font-size: xx-large; font-family: Algerian; text-align: center; color: #000066;">
                            <option value="1">Male</option>  
                            <option value="2">Female</option>  
                            </select ></td>                            
                        </tr>
                    </table>
                  <input type="submit" name="finish"  value="Click for Register" style="height: 55px; width: 260px; font-size: x-large; font-family: Algerian; color: #990000; background-color: #CC3300;"/><br /><br />
                    
            </form>
        </center>
    </body>
</html>
