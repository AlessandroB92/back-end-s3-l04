using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace back_end_s3_l04
{
    public partial class Preventivi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void BtnCalcola_Click(object sender, EventArgs e)
        {
            // Calcola il prezzo di base in base all'auto selezionata
            double prezzoBase = 0.0;
            switch (ddlAuto.SelectedValue)
            {
                case "-":
                    prezzoBase = 0.00; 
                    break;
                case "Fiat":
                    prezzoBase = 25050.00;
                    imgAuto.ImageUrl = "url_immagine_auto_marca1.jpg";
                    break;
                case "Ford":
                    prezzoBase = 27735.00;
                    imgAuto.ImageUrl = "url_immagine_auto_marca2.jpg";
                    break;
                case "Mercedes":
                    prezzoBase = 69000.00;
                    imgAuto.ImageUrl = "url_immagine_auto_marca3.jpg";
                    break;
                case "Audi":
                    prezzoBase = 37000.00;
                    imgAuto.ImageUrl = "url_immagine_auto_marca4.jpg";
                    break;
                case "Ferrari":
                    prezzoBase = 390000.00;
                    imgAuto.ImageUrl = "url_immagine_auto_marca5.jpg";
                    break;
                default:
                    prezzoBase = 0.0;
                    break;
            }

            // Visualizza il prezzo di base
            litPrezzoBase.Text = "<br />Prezzo di base: " + prezzoBase.ToString("0.00") + " EUR";

            // Calcola e visualizza il totale del preventivo
            double totaleOptional = 0.0;
            foreach (ListItem item in cblOptional.Items)
            {
                if (item.Selected)
                {
                    // Aggiunge il costo dell'optional selezionato
                    totaleOptional += GetCostoOptional(item.Value);
                }
            }

            // Calcola il costo della garanzia
            double totaleGaranzia = 0.0;
            if (!string.IsNullOrEmpty(txtAnniGaranzia.Text))
            {
                int anniGaranzia = Convert.ToInt32(txtAnniGaranzia.Text);
                totaleGaranzia = anniGaranzia * 120.00; // Ogni anno di garanzia costa 120,00 EUR
            }

            // Calcola il totale del preventivo
            double totalePreventivo = prezzoBase + totaleOptional + totaleGaranzia;

            // Visualizza i totali calcolati
            litTotalePreventivo.Text = string.Format("<br />Prezzo di base: {0:0.00} EUR<br />Totale degli optional: {1:0.00} EUR<br />Totale della garanzia: {2:0.00} EUR<br />Totale complessivo: {3:0.00} EUR",
                prezzoBase, totaleOptional, totaleGaranzia, totalePreventivo);
        }

        // Metodo per ottenere il costo di un optional in base al suo nome
        private double GetCostoOptional(string optional)
        {
            switch (optional)
            {
                case "Optional1":
                    return 800.00;
                case "Optional2":
                    return 1000.00;
                case "Optional3":
                    return 1800.00;
                // Aggiungi altri casi per gli altri optional
                default:
                    return 0.0;
            }
        }
    }
}