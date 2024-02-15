<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preventivi.aspx.cs" Inherits="back_end_s3_l04.Preventivi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <title>Preventivo Auto</title>
    <style>
        body{
            background-image:url("https://t3.ftcdn.net/jpg/05/09/64/26/360_F_509642664_iJnbo6Nbv8WDn29YkIXToqT0FAyyxgDD.jpg");
            color: aliceblue;
            
        }
        #imgAuto{
            position: relative;
    left: 515px;
            width: 250px;
            object-fit:cover;
        }
        .container {
            background-color: navy;
            width: 60%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group {
            margin-bottom: 10px;
            height: 107px;
            width: 396px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 class="text-center mb-5">Concessionaria SuperClean</h1>
        <div class="container">
            <h2>Creazione di Preventivi Auto</h2>
            <div class="form-group">
                <label for="ddlAuto">Seleziona un'auto:</label>
                <asp:DropDownList ID="ddlAuto" runat="server">
                    <asp:ListItem Text="-" Value="-"></asp:ListItem>
                    <asp:ListItem Text="Fiat 500X" Value="Fiat"></asp:ListItem>
                    <asp:ListItem Text="Ford Focus" Value="Ford"></asp:ListItem>
                    <asp:ListItem Text="Audi A1" Value="Audi"></asp:ListItem>
                    <asp:ListItem Text="Mercedes Classe E" Value="Mercedes"></asp:ListItem>
                    <asp:ListItem Text="Ferrari Purosangue" Value="Ferrari"></asp:ListItem>
                </asp:DropDownList>
                <asp:Literal ID="litPrezzoBase" runat="server" />
                
                <asp:Image ID="imgAuto" runat="server" />
                    
            </div>
            <div class="form-group">
                <label>Seleziona gli optional:</label>
                <asp:CheckBoxList ID="cblOptional" runat="server">
                    <asp:ListItem Text="Tetto Panoramico" Value="Optional1"></asp:ListItem>
                    <asp:ListItem Text="Cerchi In Lega" Value="Optional2"></asp:ListItem>
                    <asp:ListItem Text="Sedili Riscaldati" Value="Optional3"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="form-group">
                <label>Numero di anni di garanzia:</label>
                <asp:TextBox ID="txtAnniGaranzia" runat="server"></asp:TextBox>
            </div>
            <asp:Button ID="btnCalcola" runat="server" Text="Calcola Preventivo" OnClick="BtnCalcola_Click" />
            <div class="form-group">
                <label>Totale Preventivo:</label>
                <asp:Literal ID="litTotalePreventivo" runat="server" />
            </div>
        </div>
    </form>
</body>
</html>