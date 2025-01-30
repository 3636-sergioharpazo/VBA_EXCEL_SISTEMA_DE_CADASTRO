// Importações
const qrcode = require('qrcode-terminal');
const qrcodeWeb = require("qrcode");
const axios = require('axios');
const { Client } = require('whatsapp-web.js');
const express = require("express");

// Inicializa o cliente
const client = new Client();
const app = express();
const port = 3001;

let qrCodeImage = "";

// Serviço de leitura do QR Code (Terminal e Web)
client.on('qr', qr => {
    qrcode.generate(qr, { small: true }); // Exibe no terminal

    // Gera o QR Code para a interface web
    qrcodeWeb.toDataURL(qr, (err, url) => {
        if (!err) {
            qrCodeImage = url;
        }
    });
});

// Evento quando o bot estiver pronto
client.on("ready", () => {
    console.log("✅ Bot conectado ao WhatsApp!");
});

// Evento quando a conexão for estabelecida com o celular
client.on("authenticated", () => {
    console.log("📲 WhatsApp conectado ao celular!");
});

// Inicializa o cliente
client.initialize();

// Rota para exibir o QR Code na página web
app.get("/", (req, res) => {
    let refreshScript = qrCodeImage
        ? ""
        : `<script>setTimeout(() => location.reload(), 3000);</script>`;

    res.send(`
    <!DOCTYPE html>
    <html lang="pt-BR">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>QR Code WhatsApp</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
          body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
          }
          .container {
            text-align: center;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
          }
        </style>
      </head>
      <body>
        <div class="container">
          <h1 class="mb-3">Escaneie o QR Code para conectar</h1>
          ${qrCodeImage 
            ? `<img src="${qrCodeImage}" class="img-fluid" />`
            : `<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Carregando...</span></div>
               <p class="mt-3">Gerando QR Code...</p>`}
          ${refreshScript}
        </div>
      </body>
    </html>
  `);
});

// Inicia o servidor Express
app.listen(port, () => {
    console.log(`🌐 Servidor rodando em http://localhost:${port}`);
});


// Evento quando a conexão for estabelecida com o celular
client.on("authenticated", () => {
    console.log("📲 WhatsApp conectado ao celular!");
});

// Inicializa o cliente
client.initialize();

// Rota para exibir o QR Code na página web
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

// Inicia o servidor Express
app.listen(port, () => {
    console.log(`🌐 Servidor rodando em http://localhost:${port}`);
});

// Quando o cliente estiver pronto
client.on('ready', () => {
    console.log('Tudo certo! WhatsApp conectado.');
    


// Executa a função a cada 5 minuto para garantir precisão
setInterval(enviarLembretes, 5 * 60 * 1000);



});

client.initialize();

// Função para criar delay
const delay = ms => new Promise(res => setTimeout(res, ms));

// Variáveis para armazenar os dados do cliente e do agendamento
let cliente_nome = '';
let data_agendamento = '';
let horario_agendamento = '';
let servico_id = '';


// Manipulação de mensagens
client.on('message', async msg => {
    const cliente_telefone = msg.from.split('@')[0];

    // Resposta ao menu inicial
    if (/^(menu|Menu|dia|tarde|noite|oi|Oi|Voltar|voltar|Olá|olá|ola|Ola)$/i.test(msg.body) && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();
        const contact = await msg.getContact();
        const name = contact.pushname || "Cliente";

       
        await delay(2000);
        await chat.sendStateTyping();
        await delay(2000);

        await client.sendMessage(
            msg.from,
            `Olá, ${name.split(" ")[0]}! 👋 Eu sou o assistente virtual do *WM Hair & Beauty*. Como posso ajudá-lo(a) hoje? Escolha uma das opções abaixo:\n\n` +
            `1️⃣ - Serviços e preços\n` +
            `2️⃣ - Agendar horário\n` +
            `3️⃣ - Promoções da semana\n` +
            `4️⃣ - Localização\n` +
            `5️⃣ - Outras dúvidas\n` +
            `6️⃣ - Consultar agendamento`
        );
    }

    // Resposta para a opção "Serviços e Preços"
    if (msg.body === '1' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();
        await delay(2000);
        await chat.sendStateTyping();
        await delay(2000);


        let servicosDisponiveis = {};
        try {
            const response = await axios.get('https://antoniooliveira.shop/consultar-servicos_bot.php');
            servicosDisponiveis = response.data.servicos;
        } catch (error) {
            console.error('Erro ao carregar serviços:', error);
            await client.sendMessage(msg.from, '❌ Erro ao consultar serviços. Tente novamente mais tarde.');
            return;
        }
       
        const listaServicos = Object.entries(servicosDisponiveis)
            .map(([codigo, { nome, preco }]) => ` ${nome} - R$ ${preco}`)
            .join('\n');
       
        await client.sendMessage(
            msg.from,
            `💇‍♀️ *Serviços e Preços* 💇‍♂️\n\n` +
            `📝\n${listaServicos}\n` +
            `Digite *2* para agendar seu horário! `
        );
    }

   

    // Resposta para "Localização"
    if (msg.body === '4' && msg.from.endsWith('@c.us')) {

        const chat = await msg.getChat();
        await delay(2000);
        await chat.sendStateTyping();
        await delay(2000);


        await client.sendMessage(
            msg.from,
            `📍 *Localização do WM Hair & Beauty* 📍\n\n` +
            `Endereço: Avenida Bela Vista, 1234, Centro\n` +
            `Cidade: São Paulo - SP\n\n` +
            `Estamos ansiosos para sua visita! 😊`
        );
    }


    function delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
    
 // Resposta para "Promoções da Semana"
 if (msg.body === '3' && msg.from.endsWith('@c.us')) {

    const chat = await msg.getChat();
    await delay(2000);
    await chat.sendStateTyping();
    await delay(2000);


 // Consultar os serviços disponíveis
 let servicosDisponiveis = {};
 try {
     const response = await axios.get('https://antoniooliveira.shop/consultar-servicos_bot_p.php');
     servicosDisponiveis = response.data.servicos;
 } catch (error) {
     console.error('Erro ao carregar serviços:', error);
     await client.sendMessage(msg.from, '❌ Erro ao consultar serviços. Tente novamente mais tarde.');
     return;
 }

 const listaServicos = Object.entries(servicosDisponiveis)
     .map(([codigo, { nome, preco }]) => ` ${nome} - R$ ${preco}`)
     .join('\n');


     await client.sendMessage(
        msg.from,
        `🎉 *Promoções da Semana* 🎉\n\n` +
        `📝\n${listaServicos}\n` +
        `Aproveite essas ofertas incríveis! Válidas até sábado. 💅\n\n` +  // Adicionei o '+' aqui
        `Digite *2* para agendar seu horário!\n`
    );
    
}

// Verifica se o cliente digitou '6' para iniciar a consulta


// Função assíncrona para tratar o código do agendamento
async function handleAgendamento(msg) {
    
    const codigoAgendamento = msg.body;

    try {
        // Envia a requisição POST para consultar o código do agendamento
        const response = await axios.post('https://antoniooliveira.shop/consulta_bot_codigo.php', {
            protocolo: codigoAgendamento
        });
        const chat = await msg.getChat();
        await delay(2000);
        await chat.sendStateTyping();
        await delay(2000);
        // Se o agendamento for encontrado, envia os detalhes
        if (response.data.encontrado) {
            const { nome, telefone, servico, data, horario } = response.data.dados;
            await client.sendMessage(msg.from, 
                `🔍 *Detalhes do Agendamento*\n\n` +
                `📋 Código: ${codigoAgendamento}\n` +
                `👤 Nome: ${nome}\n` +
                `📞 Telefone: ${telefone}\n` +
                `💇‍♀️ Serviço: ${servico}\n` +
                `📅 Data: ${data}\n` +
                `⏰ Horário: ${horario}\n\n` +
                `📌 Se precisar de algo, digite *menu* para ver as opções.`
            );
            
        } else {
            // Caso o agendamento não seja encontrado
            await client.sendMessage(msg.from, `❌ Não foi possível localizar o agendamento com o código informado.`);
        }
    } catch (error) {
        // Se ocorrer um erro ao fazer a requisição
        console.error('Erro ao consultar o agendamento:', error);
        await client.sendMessage(msg.from, `❌ Houve um problema ao consultar o agendamento. Tente novamente mais tarde.`);
    }
}

if (msg.body === '6' && msg.from.endsWith('@c.us')) {
    const chat = await msg.getChat();
    await delay(2000);
    await chat.sendStateTyping();
    await delay(2000);

    client.sendMessage(msg.from, '📅 Por favor, digite o código do agendamento (protocolo) para consultar.');

    // Aguarda apenas a próxima mensagem do usuário
    const listener = async (newMsg) => {
        if (newMsg.from === msg.from) {
            if (newMsg.body.match(/^\d+$/)) {
                client.removeListener('message', listener); // Remove o listener para evitar múltiplas execuções
                handleAgendamento(newMsg);
            } else {
                client.sendMessage(msg.from, '❌ Por favor, insira um código de agendamento válido.');
            }
        }
    };

    client.on('message', listener);
}


    // Resposta para "Outras Dúvidas"
    if (msg.body === '5' && msg.from.endsWith('@c.us')) {

        const chat = await msg.getChat();
        await delay(2000);
        await chat.sendStateTyping();
        await delay(2000);

        await client.sendMessage(
            msg.from,
            `❓ *Outras Dúvidas* ❓\n\n` +
            `Por favor, descreva sua dúvida que entraremos em contato para ajudá-lo(a).`
        );
    }

     // Verifica se o usuário quer editar algum dado
     if (msg.body.startsWith('editar') && msg.from.endsWith('@c.us')) {
        const editField = msg.body.split(' ')[1]; // Exemplo: 'editar nome'
    
        if (editField === 'nome') {
            // Resetando as variáveis
            cliente_nome = '';
            await client.sendMessage(msg.from, `📝 Por favor, envie novamente seu nome completo.`);
            cliente_nome = msg.body;
        } else if (editField === 'serviço') {
            // Resetando as variáveis
            servico_id = '';
         
            await client.sendMessage(msg.from, `📝 Por favor, envie o serviço desejado novamente.`);
            servico_id = msg.body;
        } else if (editField === 'data') {
            // Resetando as variáveis
            data_agendamento = '';
            await client.sendMessage(msg.from, `📝 Por favor, envie a data desejada novamente no formato DD/MM/AAAA.`);
            data_agendamento = msg.body;
            
        } else if (editField === 'horário') {
            // Resetando as variáveis
            horario_agendamento = '';
            await client.sendMessage(msg.from, `📝 Por favor, envie o horário desejado novamente no formato HH:mm.`);
            horario_agendamento = msg.body;
        } else {
            await client.sendMessage(msg.from, `❌ Não entendi. Para editar algum dado, envie: 'editar nome', 'editar serviço', 'editar data' ou 'editar horário'.`);
        }
    }
    function delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }
//menu 2
if (msg.body === '2' && msg.from.endsWith('@c.us')) {

    const chat = await msg.getChat();
    await delay(2000);
    await chat.sendStateTyping();
    await delay(2000);

    let cliente_nome = '';
    //let cliente_telefone = '';
    let servico_id = '';
    let data_agendamento = '';
    let horario_agendamento = '';
    let protocolo = '';
    let confirmacao = false;

    let cliente_telefone = msg.from.split('@')[0];

    async function solicitarCampo(campo, mensagemValidacao, regex = null, mensagemConfirmacao = '') {
        let campoValido = false;
        while (!campoValido) {
            if (!campo || (regex && !regex.test(campo))) {
                if (campo && regex && !regex.test(campo)) {
                    await client.sendMessage(msg.from, mensagemValidacao);
                }
                const resposta = await esperarMensagem(msg.from);
                if (resposta.toLowerCase() === 'menu') {
                    await client.sendMessage(msg.from, '🔙 Retornando ao menu principal.');
                    return null;
                }
                campo = resposta;
            }
    
            if (regex && !regex.test(campo)) {
                // Se a resposta não atender ao padrão regex, continue pedindo
                await client.sendMessage(msg.from, mensagemValidacao);
            } else {
                campoValido = true; // Quando o campo for válido
            }
        }
    
        if (mensagemConfirmacao) {
            await client.sendMessage(msg.from, `✅ ${mensagemConfirmacao}: ${campo}`);
        }
        return campo;
    }
    
    async function esperarMensagem(user) {
        return new Promise((resolve) => {
            const listener = (response) => {
                if (response.from === user) {
                    client.off('message', listener);
                    resolve(response.body);
                }
            };
            client.on('message', listener);
        });
    }
    
    async function verificarDisponibilidade(servico_id, data_agendamento) {
        const [dia, mes, ano] = data_agendamento.split('/');
        const dataFormatada = `${ano}-${mes}-${dia}`;
        try {
            const response = await axios.post('https://antoniooliveira.shop/verificar-horario.php', {
                servico_id: servico_id,
                data_agendamento: dataFormatada
            }, {
                headers: { 'Content-Type': 'application/json' }
            });
            return response.data.horarios_disponiveis || [];
        } catch (error) {
            await client.sendMessage(msg.from, '❌ Erro ao verificar horários disponíveis. Tente novamente.');
            return [];
        }
    }
    
    let servicosDisponiveis = {};
    try {
        const response = await axios.get('https://antoniooliveira.shop/consultar-servicos_bot.php');
        servicosDisponiveis = response.data.servicos;
    } catch (error) {
        await client.sendMessage(msg.from, '❌ Erro ao consultar serviços. Tente novamente mais tarde.');
        return;
    }
    
    const listaServicos = Object.entries(servicosDisponiveis)
        .map(([codigo, { nome, preco }]) => `   ${codigo}️⃣ ${nome} - R$ ${preco}`)
        .join('\n');
    
    await client.sendMessage(
        msg.from,
        `🌟 *Agendamento de Horário* 🌟\n\n` +
        `Digite *Nome Completo:*\n\n` +
        `Escolha *Código do Serviço:* da lista abaixo:\n\n${listaServicos}\n\n` +
        `Digite a *Data:*  (Formato: 📅 DD/MM/AAAA)\n\n` +
         `Digite *Menu* para retornar ao menu principal.`
    );
    
    cliente_nome = await solicitarCampo(cliente_nome, '❌ Nome inválido. Por favor, envie seu nome completo.', null, 'Nome recebido');
    if (!cliente_nome) return;
    
    servico_id = await solicitarCampo(servico_id, `❌ Código inválido. Escolha um código válido:\n${listaServicos}`, /^[0-9]+$/, 'Serviço escolhido');
    if (!servico_id) return;
    
    data_agendamento = await solicitarCampo(data_agendamento, '❌ Data inválida! Envie no formato DD/MM/AAAA.', /^\d{2}\/\d{2}\/\d{4}$/, 'Data recebida');
    if (!data_agendamento) return;
    
    const horariosDisponiveis = await verificarDisponibilidade(servico_id, data_agendamento);
    
    if (horariosDisponiveis.length > 0) {
        let mensagem = `✅ *Horários disponíveis para ${data_agendamento}:*\n\n`;
        horariosDisponiveis.forEach(horario => {
            mensagem += `🕒 ${horario}\n\n`;
        });
        mensagem += `*Escolha o seu Horário:* (Formato: ⏰ HH:mm)\n\n`;
        await client.sendMessage(msg.from, mensagem);
    } else {
        await client.sendMessage(msg.from, `❌ *Nenhum horário disponível para ${data_agendamento}.*`);
        return;
    }
    
    horario_agendamento = await solicitarCampo(horario_agendamento, '❌ Horário inválido! Envie no formato HH:mm.', /^([01]\d|2[0-3]):([0-5]\d)$/, 'Horário recebido');
    if (!horario_agendamento) return;
    
    await client.sendMessage(
        msg.from,
        `📝 Confirme as informações:\n\n` +
        `Nome: ${cliente_nome}\n` +
        `Serviço: ${servicosDisponiveis[servico_id].nome}\n` +
        `Preço: R$ ${servicosDisponiveis[servico_id].preco}\n` +
        `Data: ${data_agendamento}\n` +
        `Horário: ${horario_agendamento}\n\n` +
        `Digite *Sim* ✅ para confirmar\nDigite *Cancelar* ❌ para cancelar e voltar ao menu principal\nDigite *Menu* para retornar ao menu principal.`
    );

    const resposta = await esperarMensagem(msg.from);
    if (resposta.toLowerCase() === 'sim') {
        confirmacao = true;
    } else {
        await client.sendMessage(msg.from, '❌ Agendamento cancelado. Retornando ao menu principal.');
        return;
    }

    try {
        const protocoloResponse = await axios.post('https://antoniooliveira.shop/gerar_protocolo.php', {
            cliente_nome,
            cliente_telefone,
            servico_id,
            data_agendamento,
            horario_agendamento: `${horario_agendamento}:00`
        });

        protocolo = protocoloResponse.data.protocolo;

        if (protocolo) {
            await client.sendMessage(
                msg.from,
                `✅ *Agendamento Confirmado!*\n` +
                `📜 *Protocolo:* ${protocolo}\n` +
                `👤 *Nome:* ${cliente_nome}\n` +
                `💼 *Serviço:* ${servicosDisponiveis[servico_id].nome}\n` +
                `💰 *Preço:* R$ ${servicosDisponiveis[servico_id].preco}\n` +
                `📅 *Data:* ${data_agendamento}\n` +
                `⏰ *Horário:* ${horario_agendamento}`
            );
            
        } else {
            await client.sendMessage(msg.from, '❌ Erro ao confirmar o agendamento. Tente novamente.');
        }
    } catch (error) {
        await client.sendMessage(msg.from, '❌ Erro ao confirmar o agendamento. Tente novamente.');
    }

//final do menu 2







}




})

const agendamentosNotificados = new Set();

async function enviarLembretes() {
   // console.log('🔔 Verificando agendamentos para enviar lembretes...');

    try {
        const response = await axios.get('https://antoniooliveira.shop/consultar-agendamentos.php');
        //console.log('Resposta da API:', response.data); 

        if (!response.data || !response.data.agendamentos || response.data.agendamentos.length === 0) {
          //  console.log('⚠️ Nenhum agendamento encontrado.');
            return;
        }

        const agendamentos = response.data.agendamentos;

        for (const agendamento of agendamentos) {
            const { cliente_telefone, cliente_nome, servico, data_agendamento, horario_agendamento } = agendamento;

            if (!cliente_telefone || !cliente_nome || !servico || !data_agendamento || !horario_agendamento) {
                console.log(`⚠️ Dados incompletos para o telefone: ${cliente_telefone}. Verifique na plataforma.`);
                continue;
            }

            // Converter data e horário para o formato dd/mm/aaaa HH:mm
            const dataObj = new Date(`${data_agendamento}T${horario_agendamento}`);
            const dataFormatada = dataObj.toLocaleDateString('pt-BR');
            const horaFormatada = dataObj.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' });

            const chaveUnica = `${cliente_telefone}-${dataFormatada}-${horaFormatada}`;
            if (agendamentosNotificados.has(chaveUnica)) {
               // console.log(`⏳ Lembrete já enviado para ${cliente_telefone}, ignorando...`);
                continue;
            }

            const mensagem = `🔔 Olá, ${cliente_nome}! Lembrete do seu agendamento:\n\n📅 Data: ${dataFormatada}\n🕒 Horário: ${horaFormatada}\n💇 Serviço: ${servico}\n\nEstamos te esperando! 😊`;

            if (client && client.sendMessage) {
                const numeroWhatsApp = `${cliente_telefone}@c.us`;
                await client.sendMessage(numeroWhatsApp, mensagem);
                agendamentosNotificados.add(chaveUnica);
              //  console.log(`📩 Lembrete enviado para ${cliente_telefone}`);
            } else {
                console.error('❌ Erro: client.sendMessage não está definido');
            }
        }
    } catch (error) {
        console.error('❌ Erro ao buscar agendamentos:', error.message || error);
    }
}
