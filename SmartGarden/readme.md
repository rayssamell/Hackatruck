# 🌱 SmartGarden

## 🎯 Objetivo

Bem-vindo ao **SmartGarden**, o projeto final desenvolvido no **HackaTruck**.  
É um sistema inteligente que une **IoT** e **Inteligência Artificial** para ajudar no cuidado com plantas de forma prática e automatizada.

## 👨‍🎓 Alunos Integrantes da Equipe
* Diego Feitosa Ferreira dos Santos
* Eduardo De Graza Franco
* João Costa Calazans
* Marcella Ferreira Chaves Costa
* Rayssa Mell de Souza Silva

## 🚀 Visão Geral
O Smart Garden permite que o usuário tire uma foto da planta, e a IA (via Gemini) reconhece a espécie, retornando:

* O nome da planta
* A luminosidade indicada
* Uma breve descrição
* A umidade ideal

Simultaneamente, um sensor de umidade coleta os dados reais do solo e compara com os parâmetros ideais fornecidos pela IA. Com isso, o sistema informa se a planta:
* Precisa ser regada
* Está com umidade ideal
* Está com umidade excessiva

## 🔧 Tecnologias Utilizadas
📱 SwiftUI – desenvolvimento da aplicação para interface com o usuário em dispositivos Apple.
🔁 Postman – utilizado para testar e consumir as APIs envolvidas no projeto.
☁️ IBM Cloudant – banco de dados NoSQL usado para armazenar informações das plantas e leituras de umidade.
🔗 Node-RED – responsável por orquestrar e conectar as APIs, sensores e banco de dados de forma visual e interativa.
🌿 Gemini (IA) – identifica a planta a partir da imagem e retorna dados ideais, como umidade e luminosidade para a espécie reconhecida.
📡 IoT (Sensor de Umidade) – coleta em tempo real os dados de umidade do solo onde a planta está.
🔌 Arduino IDE + ESP8266 – plataforma utilizada para programar o microcontrolador ESP8266, responsável pela leitura do sensor e envio dos dados ao sistema.

## ⚙️ Como Funciona
O usuário tira uma foto da planta usando a interface do sistema.
A imagem é enviada à IA (Gemini), que retorna o nome da planta e suas necessidades ideais de luz e umidade.
O sistema lê a umidade real do solo via sensor.
A lógica compara o valor lido com o valor ideal e classifica a situação da planta:
🌵 Seca – precisa ser regada
🌿 Ideal – não é necessário regar
💦 Excesso – umidade acima do ideal

## 📄 Licença
Este projeto está licenciado sob a **MIT License** - veja o arquivo [LICENSE](LICENSE) para mais detalhes.
