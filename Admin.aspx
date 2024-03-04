﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="YourNamespace.Admin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
   <link rel="icon" href="ic.png"/>

  <title>Profile</title>


   <style>
       
        footer {
  background-color:rgba(24,62,250,0.8);
  padding: 20px 0;
  text-align: center;
  color:white;
  position: absolute;
  top:110%;
  left: 0;
  bottom: 0;
  width: 100%;
}

/*    .gridview-container {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        height: 100vh;
    }

    .gridview-table {
        border: 2px solid #FFD700;
        padding: 20px;
    }*/

.container {
  max-width: 960px;
  margin: 0 auto;
  color:white;
}

p {
  color: #555;
  font-size: 14px;
  margin: 0;
}


        .info-message {
              display: none;
              position: absolute;
              top: 30px;
              left: 0;
              background-color: #fff;
              padding: 10px;
              box-shadow: 0 2px 4px rgba(0,0,0,0.2);
            }

            .Buttons1:hover + .info-message {
              display: block;
            }
        
       .logow{
                height:30px;
                border-radius:100%;
                position:absolute;
                top:10px;
                left:10px;
       }
       header{
                height:50px;
                background-color:rgba(0, 0, 127,0.6);
                font-family: 'Franklin Gothic';
       }
       body{
                margin: 0;
                padding: 0;
                background-color: rgba(50,80,220,1);
               /* background:linear-gradient(to top right, purple, rgba(24,62,250,1),cornflowerblue,turquoise);*/
                 /* background:radial-gradient(circle at center, cornflowerblue 0, turquoise,rgba(24,62,250,1), cornflowerblue 100%);*/
                font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
       }
       .dashboard_bg{
               position:absolute;
               background-color:ghostwhite;
               top:12%;
               width:98%;
               height:90%;
               border-radius:50px;
               left:15px;
       } 
       .generalpages{
      	/*display: inline-block;*/
		        padding: 10px;
		        background: rgba(0, 0, 127,0.4);
		        color: white;
		        text-decoration: none;
		        border: 1px solid rgba(0, 0, 127,0.6);
		        border-radius:40px;
                font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                font-size:13.25px;
                cursor:pointer;
                height:36px;
                text-align:center;
       }
      .generalpages:hover{
        background-color:#4c84e9;
      }
      .bookingic{
                position:absolute;
                top:15.75%; 
                left:840px;
                width:50px;
                border-radius:100px;
      }
      .recordic{
                position:absolute;
                top:15.75%;
                left:1320px;
                width:50px;
                border-radius:100px;
      }
      .billic{
                position:absolute;
                top:29.35%;
                left:840px;
                width:50px;
                border-radius:100px;
      }
      .feedbackic{
                position:absolute;
                top:29.35%;
                left:1320px;
                width:50px;
                border-radius:100px;
      }
      .bookingimage{
                position:absolute;top:150px ;left:50px
      }
      .container2{background-color:white;padding:20px ;border-radius:10px;
                position:absolute;
                border:none ;text-align:right; width:600px; height:400px;
      }
       .inp{background-color:cornflowerblue; border:2px solid cornflowerblue ;border-radius:5px;
                font-size: 15px;display:inline-block;width:150px;height:20px;
                margin-block:10px;padding-left:10px;margin-right:30px
       }

      .lab{font-size:20px }
      .book{background-color:cornflowerblue ;border-radius:5px; font-size: 20px;margin-right:40px}
      .image2{position:absolute;top:1100px;left:100px}   /*picture*/
      .boxh{position:absolute;left:54%;color:steelblue;top: 147px;
       }
      /* booking */
                .booking {
                  border: none;
                  outline: double;
                  background-color: white;
                  border: /*2px dotted #3498db;*/none;
                  font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                  color: steelblue;
                  padding: 8px 16px;
                  cursor: pointer;
                  position:absolute;
                  top:200px;
                  left:570px;
              
                  border-radius:40px;
                 font-size:20px;
                
                }

                .booking:hover {
                  background:linear-gradient(to top right, purple, rgba(24,62,250,1),cornflowerblue,turquoise);
                  color: #fff;
                }

                /* History */
                .history {
                  border: none;
                  outline: double;
                  background-color: white;
                  color: steelblue;
                  padding: 8px 16px;
                  cursor: pointer;
                  position:absolute;
                  top:200px;
                  left:1050px;
                  width:350px;
                  height:100px;
                  border-radius:40px;
                  font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                  font-size:20px;
                  text-align:left;}

                .history:hover {
                  background:linear-gradient(to top right, purple, rgba(24,62,250,1),cornflowerblue,turquoise);
                  color: #fff;
                }
                /* Get Bill */
                .bill {
                  border: /*2px dotted #3498db;*/none;
                  outline: double;
                  font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                  color: steelblue;
                  background-color: white;
                  padding: 8px 16px;
                  cursor: pointer;
                  position:absolute;
                  top:450px;
                  left:570px;
                  width:350px;
                  border-radius:40px;
                  height:100px;
                 font-size:25px;
                 text-align:left;
                }

                .bill:hover {
                  background:linear-gradient(to top right, purple, rgba(24,62,250,1),cornflowerblue,turquoise);
                  color: #fff;
                }
                /* Get Feedback */
                .feedback {
                  border: none;
                  outline: double;
                  color: steelblue;
                  background-color: white;
                  padding: 8px 16px;
                  cursor: pointer;
                  border-radius:40px;
                  position:relative;
                  font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                  top:450px;
                  left:1050px;
                  font-size:20px;
                }

                .feedback:hover {
                  background:linear-gradient(to top right, purple, rgba(24,62,250,1),cornflowerblue,turquoise);
                  color: #fff;
                }
                .userimg{
                    height: 150px;
                    position:absolute;
                    left:35%;
                    top:40%;
                }
                .coverphoto{
                    position:absolute;
                    height:50%;
                    width:100%;
                    left:3px;
                    border-radius: 50px 50px 0 0;
           top: -2px;
       }
                #formContainer {
                      display: none;
                      position: fixed;
                      top: 50%;
                      left: 50%;
                      transform: translate(-50%, -50%);
                      background: #ffffff;
                      padding: 20px;
                      z-index: 9999;
                    }

                    #feedbackformContainer {
                      display: none;
                      position: fixed;
                      top: 50%;
                      left: 50%;
                      transform: translate(-50%, -50%);
                      background: #ffffff;
                      padding: 20px;
                      z-index: 9999;
                    }
                    .input-wrapper {
                      position: relative;
                    }
                    .feedback-corner {
                      position: absolute;
                      top: 0;
                      right: 0;
                      width: 0;
                      height: 0;
                      border-style: solid;
                      border-width: 15px 0 0 15px;
                      border-color: transparent transparent transparent #ff0000;
                    }
                    .animated-list li {
                      opacity: 0;
                      transform: translateX(-100px);
                      animation: animate-list 0.5s ease-in-out forwards;
                    }

                    @keyframes animate-list {
                      0% {
                        opacity: 0;
                        transform: translateX(-100px);
                      }
                      100% {
                        opacity: 1;
                        transform: translateX(0);
                      }
                    }
                       .my-gridview {
                          font-family: Arial, sans-serif;
                          border-collapse: collapse;
                          height: 10%;
                          margin: 0 auto;
                          cursor: pointer;
                          top:28%;
                          border-radius:40px;
                          background: #fff;
                          overflow: hidden;
                          left:51%;
                          position:absolute;
                          box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                       }

.my-gridview td,
.my-gridview th {
  border: 1px solid #dbConnect;
  padding: 8px;
}

.my-gridview th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #007bff;
  color: #fff;
}

.my-gridview tr:nth-child(even) {
  background-color: #f2f2f2;
}

.my-gridview tr:hover {
  background-color: #dbConnect;
}

.my-gridview .header {
  font-weight: bold;
  text-transform: uppercase;
}


              .my-gridview2 {
                          font-family: Arial, sans-serif;
                          border-collapse: collapse;
                          height: 10%;
                          margin: 0 auto;
                          cursor: pointer;
                          top:70%;
                          border-radius:40px;
                          background: #fff;
                          overflow: hidden;
                          left:58%;
                          position:absolute;
                          box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
                       }

.my-gridview2 td,
.my-gridview2 th {
  border: 1px solid #dbConnect;
  padding: 8px;
}

.my-gridview2 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #007bff;
  color: #fff;
}

.my-gridview2 tr:nth-child(even) {
  background-color: #f2f2f2;
}

.my-gridview2 tr:hover {
  background-color: #dbConnect;
}

.my-gridview2 .header {
  font-weight: bold;
  text-transform: uppercase;
}


   </style>

  </head>
  <body >
      <form runat="server">
 
  <div id="fcontentContainer">
      <div id="contentContainer">
         <header>
               
                <asp:Image runat="server" src="logow.png" CssClass="logow" />
                <div style="font-size:20px;color:white;position:absolute;left:40px;top:13px">  &nbsp Hospital Management System </div> 
                <div style="font-size:20px;color:white;position:absolute;right:40px;top:5px"> 
                 <asp:Button runat="server" ID="Buttonx" OnClick="Buttonx_Click" CssClass="generalpages" Text="Log Out"></asp:Button>
                </div> 
         </header>    
<div class="dashboard_bg">
    <%--<button class="booking" id="btnViewAccountDetails" onclick="toggleTable(); return false;">View Account Details</button>--%>

   <%-- <div id="tableContainer" style="display: none;" class="gridview-container">--%>
     <%--   <table class="gridview-table">
            <tr>
                <td>--%>
              <%--  </td>
            </tr>
        </table>--%>
   <%-- </div>--%>
                    <asp:GridView ID="GridView1" CssClass="my-gridview" runat="server" AutoGenerateColumns="true">
                    </asp:GridView>
                     <asp:GridView ID="GridView2" CssClass="my-gridview2" runat="server" AutoGenerateColumns="false" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="261px">
                        <Columns>
                            <asp:BoundField DataField="PatientId" HeaderText="Patient ID" />
                            <asp:BoundField DataField="TotalAppointments" HeaderText="Total Appointments" />
                            <asp:BoundField DataField="TotalCost" HeaderText="Total Cost" />
                        <%--    <asp:TemplateField HeaderText="Actions">
                               
                            </asp:TemplateField>--%>
                        </Columns>
                    </asp:GridView>
    <asp:Label ID="lblSelectedPatientId" runat="server"></asp:Label>
<asp:Label ID="lblSelectedTotalAppointments" runat="server"></asp:Label>
<asp:Label ID="lblSelectedTotalCost" runat="server"></asp:Label>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function toggleTable() {
        var tableContainer = $("#tableContainer");
        if (tableContainer.css("display") === "none") {
            tableContainer.show();
        }
    }
</script>
          <%--  <button class="feedback" id="schedule_n"> View Today's Schedule </button>--%>
             <%--   <div class="buttonsdiv">
         
           
                    <button class="booking" id="showFormBtn">&nbsp &nbsp &nbsp &nbsp &nbsp My Schedule </button>
                      <asp:Image class="bookingic" ImageUrl="bookingicon.jpg" runat="server"/>
                         <button class="history">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Get Record</button>
                          <asp:Image class="recordic" ImageUrl="recordicon.png" runat="server"/>
                    <button class="bill">&nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Get Bill</button>
                    <asp:Image class="billic" ImageUrl="billicon.jpg" runat="server"/>
               

                    <button class="feedback" id="showfeedbackform">&nbsp &nbsp &nbsp &nbsp &nbsp Give Feedback</button>
                        <asp:Image class="feedbackic" ImageUrl="feedbackicon.png" runat="server"/>
           
                 </div>--%>
            </div>

            
            
           <%--</div>--%>
      <div style="position:absolute;height:600px;width:500px;left:40px;top:15%;border-radius:40px;background-color:white;text-align:center"> <asp:Image runat="server" cssClass="coverphoto" src="https://media.istockphoto.com/id/1176833186/vector/office-worker-clerk-flat-vector-illustration-company-employee-economist-isolated-cartoon.jpg?s=612x612&w=0&k=20&c=6DMBuIW4XIMp0VrQr50bUMb7lFk4TdwB9vsV3DwONxw="  /> <asp:Image runat="server" src="user1.png" CssClass="userimg" />
          <div style="background-color:white;text-align:center;top:70%;position:absolute;left:30%;color:steelblue;text-size-adjust:auto">
                <h2>Welcome, <asp:Label ID="lblWelcome" runat="server" /></h2>
            <br />
            <h3><asp:Label ID="lblDetails" runat="server"></asp:Label></h3>

          </div>
      </div>
          
       
             <footer>
                <div class="container">
                    <p style="color:white">&copy 2023 Your Website. All rights reserved.</p>
                </div>
            </footer>
  </div>

  
      
       <%--<div class="container2" id="formContainer" style="display: none;">
       <form class="myform" id="myForm">--%>
                    <h1 class="boxh" >Doctors' Salary Information</h1>
                    <br /><br /><br /><br /><br /><br /><br /><br />
          <h1 style="position:absolute;color:steelblue;top:62%; left: 54%;" >Patients' Bill Information</h1>
                    <br /><br /><br /><br /><br /><br /><br /><br />
            
                    <%--book :
                    <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>--%>
           <%--         <asp:Button CssClass="book" ID="create" Text=" BOOK " runat="server"/>--%>
             
  <%--    </form>
   </div>
   --%>

    <%--feedback--%>
      
<%--    <div class="container2" id="feedbackformContainer" style="display: none;">
       <form class="myform2" id="myForm2" >
            <h1 class="boxh" >PROVIDE FEEDBACK</h1>
            <br /><br /><br /><br /><br /><br /><br /><br />
            
            <div class="message-container">
  <label for="inputMessage">Message:</label>
  <textarea id="inputMessage" placeholder="Enter your message"></textarea>
</div>


            <br /><br />
            <asp:Button CssClass="book" ID="Button1" Text=" Submit " runat="server"/>
            <asp:Image class="bookingimage" ImageUrl="feedbackicon.png" runat="server"/>
            </form>
         </div>
            --%>

   <script>
       document.getElementById('showFormBtn').addEventListener('click', function (e) {
           e.preventDefault();

           var formContainer = document.getElementById('formContainer');
           var contentContainer = document.getElementById('contentContainer');

           formContainer.style.display = 'block';
           contentContainer.style.transform = 'translate(-9999px, -9999px)';
       });

       document.addEventListener('click', function (e) {
           var formContainer = document.getElementById('formContainer');
           var contentContainer = document.getElementById('contentContainer');

           if (!formContainer.contains(e.target) && e.target.id !== 'showFormBtn') {
               formContainer.style.display = 'none';
               contentContainer.style.transform = 'none';
           }
       });
       /*feedback*/
       document.getElementById('showfeedbackform').addEventListener('click', function (e) {
           e.preventDefault();

           var formContainer = document.getElementById('feedbackformContainer');
           var contentContainer = document.getElementById('fcontentContainer');

           formContainer.style.display = 'block';
           contentContainer.style.transform = 'translate(-9999px, -9999px)';
       });

       document.addEventListener('click', function (e) {
           var formContainer = document.getElementById('feedbackformContainer');
           var contentContainer = document.getElementById('fcontentContainer');

           if (!formContainer.contains(e.target) && e.target.id !== 'showfeedbackform') {
               formContainer.style.display = 'none';
               contentContainer.style.transform = 'none';
           }
       });

      
   </script>          

           
          </form>
  </body>
</html>
