// leitor de qr code
const qrcode = require('qrcode-terminal');
const { Client, Buttons, List, MessageMedia } = require('whatsapp-web.js'); // Mudança Buttons
const client = new Client();

// serviço de leitura do qr code
client.on('qr', qr => {
    qrcode.generate(qr, {small: true});
});

// apos isso ele diz que foi tudo certo
client.on('ready', () => {
    console.log('Tudo certo! WhatsApp conectado.');
});

// E inicializa tudo 
client.initialize();

const delay = ms => new Promise(res => setTimeout(res, ms)); // Função que usamos para criar o delay entre uma ação e outra

// Funil
client.on('message', async msg => {

    if (msg.body.match(/(menu|Menu|dia|tarde|noite|oi|Oi|Olá|olá|ola|Ola)/i) && msg.from.endsWith('@c.us')) {

        const chat = await msg.getChat();

        await delay(3000); //delay de 3 segundos
        await chat.sendStateTyping(); // Simulando Digitação
        await delay(3000); //Delay de 3000 milisegundos mais conhecido como 3 segundos
        const contact = await msg.getContact(); //Pegando o contato
        const name = contact.pushname; //Pegando o nome do contato
        await client.sendMessage(msg.from, 
            `Olá, ${name.split(" ")[0]}! 👋 Eu sou o assistente virtual do *WM Hair & Beauty*. Como posso ajudá-lo(a) hoje? Por favor, escolha uma das opções abaixo:\n\n` +
            `1️⃣ - Serviços e preços\n` +
            `2️⃣ - Agendar horário\n` +
            `3️⃣ - Promoções da semana\n` +
            `4️⃣ - Localização\n` +
            `5️⃣ - Outras dúvidas`
        ); 
        await delay(3000); //delay de 3 segundos
        await chat.sendStateTyping(); // Simulando Digitação
        await delay(5000); //Delay de 5 segundos
    }

    // Opção 1: Serviços e preços
    if (msg.body === '1' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();

        await delay(3000);
        await chat.sendStateTyping();
        await delay(3000);
        await client.sendMessage(msg.from, 
            `💇‍♀️ *Serviços e Preços* 💇‍♂️\n\n` +
            `- Corte feminino: R$50\n` +
            `- Corte masculino: R$30\n` +
            `- Escova modeladora: R$40\n` +
            `- Coloração: a partir de R$120\n` +
            `- Manicure e Pedicure: R$50\n` +
            `- Tratamento capilar: a partir de R$150\n\n` +
            `Para mais informações ou agendamentos, digite *2*!`
        );
    }

    // Opção 2: Agendar horário
    if (msg.body === '2' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();

        await delay(3000);
        await chat.sendStateTyping();
        await delay(3000);
        await client.sendMessage(msg.from, 
            `Para agendar seu horário no *WM Hair & Beauty*, por favor, envie a seguinte informação:\n` +
            `- Nome completo\n` +
            `- Serviço desejado\n` +
            `- Dia e horário de preferência\n\n` +
            `Nossa equipe confirmará sua reserva assim que possível. 🕒`
        );
    }

    // Opção 3: Promoções da semana
    if (msg.body === '3' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();

        await delay(3000);
        await chat.sendStateTyping();
        await delay(3000);
        await client.sendMessage(msg.from, 
            `🎉 *Promoções da Semana* 🎉\n\n` +
            `1️⃣ Escova + hidratação: R$70\n` +
            `2️⃣ Manicure + pedicure: R$40\n` +
            `3️⃣ Tintura + corte: R$150\n\n` +
            `Aproveite essas ofertas incríveis! Válidas até sábado. 💅`
        );
    }

    // Opção 4: Localização
    if (msg.body === '4' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();

        await delay(3000);
        await chat.sendStateTyping();
        await delay(3000);
        await client.sendMessage(msg.from, 
            `📍 *WM Hair & Beauty* está localizado em:\n\n` +
            `Rua Condessa de Barral, Nº5 - Jardim Santa Edwiges\nCidade, CEP: 04835-020\nSão Paulo-SP \n\n` +
            `Estamos abertos de segunda a sábado, das 9h às 19h. Esperamos sua visita! 🌟`
        );
    }

    // Opção 5: Outras dúvidas
    if (msg.body === '5' && msg.from.endsWith('@c.us')) {
        const chat = await msg.getChat();

        await delay(3000);
        await chat.sendStateTyping();
        await delay(3000);
        await client.sendMessage(msg.from, 
            `Se você tiver outras dúvidas ou precisar de mais informações, por favor, envie sua pergunta aqui. Nossa equipe está à disposição! 😊`
        );
    }
});
