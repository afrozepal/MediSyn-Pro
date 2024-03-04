using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve the query string parameters and display them in headings
            if (!IsPostBack)
            {
                // Check if the query parameters exist in the URL
                if (Request.QueryString["name"] != null && Request.QueryString["gender"] != null && Request.QueryString["id"] != null)
                {
                    // Retrieve the name and gender from the query parameters
                    string name = Request.QueryString["name"];
                    string gender = Request.QueryString["gender"];

                    // Display the welcome message and details
                    lblWelcome.Text = name;
                    lblDetails.Text = "Gender: " + gender;

                    string connectionString = "Data Source=DANAA;Initial Catalog=dbconnect;User ID=sa;Password=database;";

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // Create a DataTable to store the retrieved data for GridView1
                        DataTable adminTable = new DataTable();

                        // SQL query to select all rows from the admin table for GridView1
                        string query = @"
                            SELECT
                                
                                d.DoctorId AS DoctorID,
                                d.DoctorName AS Name,
                                COUNT(a.appointment_id) AS TotalAppointments,
                                s.Cost * COUNT(a.appointment_id) AS Salary
                            FROM
                                Doctor d
                                JOIN Appointment a ON d.DoctorId = a.doctor_id
                                JOIN Specialization s ON d.Specialization = s.SpecializationName
                            GROUP BY
                                d.DoctorId, d.DoctorName, s.Cost;
                        ";

                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            // Open the database connection
                            connection.Open();

                            // Execute the query and fetch the results into the DataTable
                            SqlDataAdapter adapter = new SqlDataAdapter(command);
                            adapter.Fill(adminTable);

                            // Close the database connection
                            connection.Close();
                        }

                        // Bind the DataTable to GridView1
                        GridView1.DataSource = adminTable;
                        GridView1.DataBind();
                    }

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        // Create a DataTable to store the retrieved data for GridView2
                        DataTable billTable = new DataTable();

                        // SQL query to drop the existing BillView if it exists
                        string dropViewQuery = "IF OBJECT_ID('BillView', 'V') IS NOT NULL DROP VIEW BillView";

                        // Execute the drop view query
                        using (SqlCommand command = new SqlCommand(dropViewQuery, connection))
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                        }

                        // SQL query to create the BillView
                        string createViewQuery = @"
                         CREATE VIEW BillView AS
                            SELECT
                                Appointment.patient_id AS PatientId,
                                COUNT(Appointment.appointment_id) AS TotalAppointments,
                                COUNT(Appointment.appointment_id) * Specialization.Cost AS TotalCost
                            FROM
                                Appointment
                                JOIN Doctor ON Appointment.doctor_id = Doctor.DoctorId
                                JOIN Specialization ON Doctor.Specialization = Specialization.SpecializationName
                            GROUP BY
                                Appointment.patient_id, Specialization.Cost;


                        ";

                        // Execute the create view query
                        using (SqlCommand command = new SqlCommand(createViewQuery, connection))
                        {
                            command.ExecuteNonQuery();
                        }

                        // SQL query to select all rows from the BillView
                        string selectQuery = "SELECT * FROM BillView";

                        // Execute the select query and fetch the results into the DataTable
                        using (SqlCommand command = new SqlCommand(selectQuery, connection))
                        {
                            SqlDataAdapter adapter = new SqlDataAdapter(command);
                            adapter.Fill(billTable);
                        }
                        // Bind the DataTable to GridView2
                        GridView2.DataSource = billTable;
                        GridView2.DataBind();
                    }
                }
                else
                {
                    // Redirect to the login page if the query parameters are missing
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void Buttonx_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Check if any row is selected
            if (GridView2.SelectedRow != null)
            {
                // Get the selected row
                GridViewRow selectedRow = GridView2.SelectedRow;

                // Access the data in the selected row's cells
                string selectedPatientId = selectedRow.Cells[0].Text;
                string selectedTotalAppointments = selectedRow.Cells[1].Text;
                string selectedTotalCost = selectedRow.Cells[2].Text;

                // Perform any desired operations with the selected data
                // Example: Display the selected data in labels or perform additional database operations
                lblSelectedPatientId.Text = selectedPatientId;
                lblSelectedTotalAppointments.Text = selectedTotalAppointments;
                lblSelectedTotalCost.Text = selectedTotalCost;
            }
        }
    }
}