namespace CinemaTicketsCompany
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Drawing.Printing;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;
    using System.Windows.Forms;

    public partial class CinemaTicketsCompany : Form
    {
        private string mode;
        private DB db;
        public CinemaTicketsCompany()
        {
            db = new DB("L:\\KEKW.fdb");
            db.Connect();
            InitializeComponent();
            changeMode("request");
            List<string> ids = db.Query("SELECT ID FROM REQUESTS");
            foreach(string id in ids)
            {
                requestSelectPickComboBox.Items.Add(id);
            }
            requestSelectPickComboBox.SelectedIndex = 0;
        }
        private void changeMode(string _mode)
        {
            if (_mode == "request")
            {
                previousButton.Enabled = false;
                nextButton.Enabled = true;
                printButton.Enabled = true;
                mainTabs.SelectedTab = requestPage;
                mode = _mode;
            }
            else if (_mode == "smeti")
            {
                previousButton.Enabled = true;
                nextButton.Enabled = true;
                printButton.Enabled = true;
                mainTabs.SelectedTab = smetiPage;
                mode = _mode;
            }
            else if (_mode == "print")
            {
                previousButton.Enabled = true;
                nextButton.Enabled = false;
                printButton.Enabled = true;
                mainTabs.SelectedTab = printPage;
                mode = _mode;
            }
        }
        private void nextButton_Click(object sender, EventArgs e)
        {
            if (mode == "request")
            {
                changeMode("smeti");
            }
            else if (mode == "smeti")
            {
                changeMode("print");
            }
        }

        private void previousButton_Click(object sender, EventArgs e)
        {
            if (mode == "print")
            {
                changeMode("smeti");
            }
            else if (mode == "smeti")
            {
                changeMode("request");
            }
        }

        private void requestSelectNewButton_Click(object sender, EventArgs e)
        {
            List<string> attributes = new List<string>
            {
                "ID",
                "CLIENT",
                "OBJECT",
                "STARTDATE",
                "FINISHDATE",
                "SMETA"
            };
            List<string> values = new List<string>
            {
                "NULL",
                "0",
                "0",
                "01-Jan-00",
                "01-Jan-00",
                "0"
            };
            string id = db.GetIdInsert("REQUESTS", attributes, values, "ID");
            requestSelectPickComboBox.Items.Add(id);
            requestSelectPickComboBox.SelectedItem = id;

        }

        private void requestAddressSaveButton_Click(object sender, EventArgs e)
        {

        }

        private void printButton_Click(object sender, EventArgs e)
        {
            changeMode("print");
            PrintDocument docToPrint = new PrintDocument();
            printPreview.Document = docToPrint;
            docToPrint.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(PrintPage);
        }

        private void PrintPage(object sender, PrintPageEventArgs e)
        {
            string text = "ЗАЯВКА 0";
            e.Graphics.DrawString(text, new Font("Georgia", 35, FontStyle.Regular),
                Brushes.Black, 10, 10);
            printPreview.StartPage = 2;
        }
    }
}
