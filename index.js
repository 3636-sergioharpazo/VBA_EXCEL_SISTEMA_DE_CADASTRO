// Importações
const qrcode = require('qrcode-terminal'); // qrcode para terminal
const qrcodeWeb = require("qrcode"); // qrcode para imagem web
const axios = require('axios');
const { Client, LocalAuth } = require('whatsapp-web.js'); // Adicionado LocalAuth
const express = require("express");

const app = express();
const port = 3001;

const client = new Client({
  authStrategy: new LocalAuth(),
});

let qrCodeImage = "";
let connectionStatus = "Desconectado"; // Inicializa como desconectado

// Geração do QR Code para terminal
client.on("qr", (qr) => {
  qrcode.toString(qr, { small: true }, (err, qrCode) => {
    if (!err) {
      console.log(qrCode); // Exibe o QR code no terminal
    }
  });

  // Geração do QR Code para imagem
  qrcodeWeb.toDataURL(qr, (err, url) => {
    if (!err) {
      qrCodeImage = url; // Armazena a URL da imagem do QR code
    }
  });
});

// Quando o cliente estiver pronto
client.on("ready", () => {
  console.log("Bot pronto!");
  connectionStatus = "Conectado"; // Atualiza para conectado
});

// Quando o cliente se desconectar
client.on("disconnected", () => {
  console.log("Bot desconectado.");
  connectionStatus = "Desconectado"; // Atualiza para desconectado
});

// Inicializa o cliente
client.initialize();

// Rota HTTP
app.get("/", (req, res) => {
  res.send(`
    <html>
      <head>
        <title>QR Code WhatsApp</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
          }
          h1 {
            color: #4CAF50;
          }
          .status {
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
            color: ${connectionStatus === "Conectado" ? "green" : "red"};
          }
        </style>
      </head>
      <body>
        <h1>Escaneie o QR Code para conectar</h1>
        <img src="${qrCodeImage}" />
        <div class="status">${connectionStatus}</div>
      </body>
    </html>
  `);
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});

// Evento quando a conexão for estabelecida com o celular
client.on("authenticated", () => {
  console.log("📲 WhatsApp conectado ao celular!");
});
