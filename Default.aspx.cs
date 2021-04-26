using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;

namespace Messages_WebRole
{
    public partial class _Default : System.Web.UI.Page
    {
        
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // Create message object from web form data.


            // Get Cloud Table object for Messages Table.


            // Create Table Operation to insert new Message Entity.


            // Insert new message into Messages Table.


            // Update web form. Clear text boxes. Refresh messages list.

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string rowKey = GetRowKeyFirstSelectedMessage();


        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {


        }
        
        protected void btnReplace_Click(object sender, EventArgs e)
        {


        }

        public IEnumerable<MessageEntity> GetMessages()
        {

            // Get Cloud Table object for Messages Table.


            // Create a Table Query object.


            // Get list from Messages Table.


            // Sort in reverse chronological order.


            // Output to data list on web form.

        }

        private CloudTable GetMessagesCloudTable()
        {

            // Get storage connection string. LOCAL: Storage Emulator. CLOUD: Azure Storage Account.
            

            // Access cloud storage account. Uses connection string obtained above.
            

            // Create cloud table client. Provides access to Tables in your Storage Account 
            

            // Get Cloud Table for Message Table.
            

            // Create Messages Table if it does not already exist. 
            

            // Output Messages Cloud Table object. Provides the means of accessing the Messages Table.
            
        }

        private string GetRowKeyFirstSelectedMessage()
        {
            List<string> selectedCustomerRowKeys = new List<string>();

            foreach (Control ctrl in dataListMessages.Controls)
            {
                CheckBox chkBox = (CheckBox)ctrl.FindControl("RowKey");

                if (chkBox.Checked)
                {
                    return chkBox.Text;
                }
            }

            return string.Empty;
        }
    }
}