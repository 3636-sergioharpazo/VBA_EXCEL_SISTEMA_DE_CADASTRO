const { Client, LocalAuth } = require("whatsapp-web.js");
const qrcode = require("qrcode");
const express = require("express");

const app = express();
const port = 3000;

const client = new Client({
  authStrategy: new LocalAuth(),
});

let qrCodeImage = "";

client.on("qr", (qr) => {
  qrcode.toDataURL(qr, (err, url) => {
    if (!err) {
      qrCodeImage = url;
    }
  });
});

client.on("ready", () => {
  console.log("Bot pronto!");
});

client.initialize();

app.get("/", (req, res) => {
  let refreshScript = qrCodeImage
    ? ""
    : `<script>setTimeout(() => location.reload(), 3000);</script>`;

  res.send(`
    <html>
      <head><title>QR Code WhatsApp</title></head>
      <body>
        <h1>Escaneie o QR Code para conectar</h1>
        ${qrCodeImage ? `<img src="${qrCodeImage}" />` : "<p>Gerando QR Code...</p>"}
        ${refreshScript}
      </body>
    </html>
  `);
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
