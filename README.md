
# OpnSense-MultiWan-Telegram

- Script for OPNsense: monitors multi-WAN gateway status and sends notifications via Telegram (or email with Monit service)



## Donation | Doações

(En)      Support our project via Pix or PayPal. <br />
(Pt-Br) Apoie nosso projeto via Pix ou PayPal: <br />

- Brazilian Pix: d56da244-4dc5-4f77-be6d-28e94fdd46b2 <br />
- Paypal:  https://bit.ly/MonitTelegram <br /><br />

## Screenshot
![Screenshot](https://github.com/macielmeireles/OpnSense-MultiWan-Telegram/blob/main/screenshot.jpg)


## Overview (En)
This project provides two scripts for monitoring the status of gateways in OPNsense and sending alerts to Telegram.

The `gateway_multiwan` script monitors the `offline`, `packet loss`, `online`, or `unknown` status of all gateways found in opnSense. If any of them change, it sends an alert using the `sendTelegram.sh` file to a group, via a Telegram bot. If the SMTP alert is configured, it will also be sent to your email. For it to work, the script needs to be added to your opnSense and set up to be executed and triggered by events through the already included package called Monit.


## Requirements
- OPNsense Firewall
- SSH terminal
- Download the two files from this GitHub repository (stable version) to your machine with OPNsense
- Telegram Account



## Quick Installation Guide
1. Enable SSH on OpnSense
2. Download Files
3. Set Permissions
4. Configure Telegram
5. Edit `sendTelegram.sh`
6. Enable Monit Service
7. Enable Script
8. Test

## Detailed Installation Guide

1. Enable SSH on OpnSense and download the files<br />
   1.1 Enable SSH on OpnSense: System > Settings > Administration <br />
   1.2 Access OpnSense via SSH from terminal: ssh root@192.168.1.1. Replace root with your username and 192.168.1.1 with your OpnSense IP address.<br />
   1.3 Navigate to the Monit service folder: `cd /usr/local/opnsense/scripts/OPNsense/Monit`<br />
   1.4 Use fetch to download "gateway_multiwan" and "sendTelegram.sh' from GitHub:<br /> 
      `fetch https://github.com/31337-4554551n/opnsense_gateways_status/blob/main/versions/stable/0.7/gateway_multiwan && fetch https://github.com/31337-4554551n/opnsense_gateways_status/blob/main/versions/stable/0.7/sendTelegram.sh`<br />

2. Set Permissions:<br />
   2.1 Set +x permission on the files:<br /> `chmod +x gateway_multiwan sendTelegram.sh`<br />

3. Telegram Configuration:<br />
   3.1 Create a Telegram group.<br />
   3.2 Create a bot with "BotFather".<br />
   3.3 Note down the bot token.<br />
   3.4 Add the bot and yourself to the group.<br />
   3.5 Get the group ID from the URL.<br />

4. Configure sendTelegram.sh:<br />
   4.1 Open sendTelegram.sh in a text editor.<br />
   4.2 Update TOKEN and CHAT_ID with your bot token and group ID.<br />

5. Enable Monit Service:<br />
   5.1 In OPNsense, go to Services > Monit > Services and click on Enable Monit.<br />
   5.2 Set your preferred polling interval.<br />

6. Enable Script:<br />
   6.1 OPNsense, go to Services > Monit > Services and duplicate the pre-existing service called gateway_alert.<br />
   6.2 In the Duplicate Item dialog box, enter a name for the new service, such as "gateway_multiwan".<br />
   6.3 In the Path field, enter the path to the shell script, such as `/usr/local/opnsense/scripts/OPNsense/Monit/gateway_multiwan`.<br />
   6.4 In Tests field, uncheck "NonZeroStatus" and check "ChangedStatus".<br />
   6.5 Click Save and Apply.<br />

Testing the Script<br />
To test the script, manually disable a WAN link in OPNsense. You should receive a Telegram alert.<br />

For more details on how to get your bot token in Telegram[^1^][2] or how to get your chat ID in Telegram, you can refer to these links.<br />

<sub>(1) How to Generate a Token for Telegram Bot API | https://medium.com/geekculture/generate-telegram-token-for-bot-api-d26faf9bf064</sub> <br />
<sub>(2) How to Find a Chat ID in Telegram | https://www.alphr.com/find-chat-id-telegram/ </sub> <br />
  


##


# (pt-br) Script de Monitoramento Multiwan Gateway no OPNsense e alerta via Telegram

## Visão Geral
Este projeto fornece dois arquivos para monitorar o status dos gateways no OPNsense e enviar alertas para o Telegram. 

O script `gateway_multiwan` monitora os status `offline`, `perda de pacote`, `online` ou `desconhecido` de todos os gateways encontrados no opnSense. 
Se algum deles mudar, ele envia um alerta usando o arquivo `sendTelegram.sh` para um grupo, via um bot do Telegram.
Caso o alerta SMTP esteja configurado, também será enviado para seu e-mail.
Para funcionar, o script precisa ser adicionado em seu opnSense e para ser executado e acionado por eventos através do pacote já incluído chamado Monit.

## Requisitos
- Firewall OPNsense
- Conta do Telegram
- Acesso ao Shell
- Baixe os dois arquivos deste repositório do GitHub (versão `stable`) para sua máquina com OPNsense

## Guia de Instalação Rápida
1. Baixar Arquivos
2. Definir Permissões
3. Configurar Telegram
4. Editar `sendTelegram.sh`
5. Habilitar Serviço Monit
6. Habilitar Script

## **Guia Detalhado de Instalação**

1. **Ative o SSH no OpnSense e baixe os arquivos**<br /> 
   1.1 Ative o SSH no OpnSense: Sistema > Configurações > Administração<br /> 
   1.2 Acesse o OpnSense via SSH a partir do terminal, exemplo: `ssh root@192.168.1.1` <br />
   1.3 Navegue até a pasta do serviço Monit: `cd /usr/local/opnsense/scripts/OPNsense/Monit`<br />
   1.4 Use fetch para baixar "gateway_multiwan" e "sendTelegram.sh' do GitHub:<br />
          `fetch https://github.com/macielmeireles/opnsense_gateways_status/blob/main/versions/stable/0.6/gateway_multiwan && fetch https://github.com/macielmeireles/opnsense_gateways_status/blob/main/versions/stable/0.6/sendTelegram.sh`<br />

2. **Defina as Permissões**<br />   
   2.1 Defina a permissão +x nos arquivos:<br /> `chmod +x gateway_multiwan sendTelegram.sh`<br />

3. **Configuração do Telegram**<br />
   3.1 Crie um grupo no Telegram.<br />
   3.2 Crie um bot com o "BotFather".<br />
   3.3 Anote o token do bot.<br />
   3.4 Adicione o bot e você mesmo ao grupo.<br />
   3.5 Obtenha o ID do grupo a partir da URL.<br />

4. **Configure o sendTelegram.sh**<br />
   4.1 Abra o sendTelegram.sh em um editor de texto.<br />
   4.2 Atualize TOKEN e CHAT_ID com o token do seu bot e o ID do grupo.<br />

5. **Ative o Serviço Monit**<br />
   5.1 No OPNsense, vá para Serviços > Monit > Serviços e clique em Ativar Monit.<br />
   5.2 Defina o intervalo de pesquisa de sua preferência.<br />

6. **Ative o Script**<br />
   6.1 No OPNsense, vá para Serviços > Monit > Serviços e duplique o serviço pré-existente chamado gateway_alert.<br />
   6.2 Na caixa de diálogo Duplicar Item, insira um nome para o novo serviço, como "gateway_multiwan".<br />
   6.3 No campo Caminho, insira o caminho para o script shell, como `/usr/local/opnsense/scripts/OPNsense/Monit/gateway_multiwan`.<br />
   6.4 No campo Testes, desmarque "NonZeroStatus" e marque "ChangedStatus".<br />
   6.5 Clique em Salvar e Aplicar.<br />

**Testando o Script**<br />
Para testar o script, desative manualmente um link WAN no OPnSense.<br />
Você deve receber um alerta no Telegram.<br />
