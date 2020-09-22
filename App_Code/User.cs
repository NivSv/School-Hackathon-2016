using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for d
/// </summary>
public class User
{
     private string firstname;
     private string lastname;
     private string username;
     private string password;
     private string email;
     private int age;
     private bool gender;
     private string connectionUrl;



     private void SetConnectionUrl()
     {
         this.connectionUrl = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + HttpContext.Current.Server.MapPath("~/App_Data/Users.accdb");
     }

     public User(string firstname, string lastname, string username, string password, string email,int age, bool gender)
	{
        this.firstname = firstname;
        this.lastname = lastname;
        this.username = username;
        this.password = password;
        this.email = email;
        this.age = age;
        this.gender = gender;
  	}


}