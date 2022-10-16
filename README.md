# Documentação AlmanaK DB

## Integrantes do Grupo
- Bianca Man Tchuin Chang Lee (RM: 89171)
- Danilo Zequim de Moura (RM: 89045)
- Eric Brianez Giannetti (RM: 87087)
- Matheus Pismel de Jeronymo (RM: 86931)
- Otavio de Magalhães Gomes (RM: 87680)
- Zack Lorenzzo Corrêa (RM: 87149)
<hr>
<br>

## Disclaimer
Como o referido projeto está vinculado a uma base de dados de produção, os dados obtidos como respostas de cada requisição 
podem variar de acordo com a interação dos demais usuários.
<hr>
<br>

## Descrição do projeto
O projeto consiste na criação de um aplicativo mobile, onde os usuários podem consultar jogos presenciais para jogar no seu tempo de lazer. 
Com a pandemia, muitas crianças ficaram sem brincar com seus amigos, então o app poderá dar sugestões de brincadeiras! Mas não para por ai... 
a aplicação não se limita a crianças, podendo ser para adultos também. Podem ser selecionados itens ou categorias para trazer diferentes opções
de jogos na tela. Você pode consultar as regras do jogo, avaliar, comentar, entre outras funções.
<hr>
<br>

## Base de dados
Caso queira visualizar os scripts, eles podem ser encontrados <a href="/SQL Scripts/DDL.sql">aqui</a>. 
Caso queira visualizar melhor o layout da base de dados, recomendamos acessar o link abaixo, que possui um relatório interativo da base.
Link: https://almanak-db-report.herokuapp.com/
<hr>
<br>

## Notas Extras
Professor Marcel, conforme conversamos na última aula, por termos criado nossa base de dados em PostgreSQL, não existe a possibilidade de criarmos os packages, uma vez que essa funcionalidade não existe nessa linguagem. Acordamos então de lhe entregar as views com os dados processados e histórico dos clientes (que se encontra no link: https://github.com/Challenge-FIAP-2022/Almanak-DataBase/blob/master/SQL%20Scripts/VIEW.sql). Essa view cria um array de datas e cruza com os dados dos usuários. Como temos data de início e encerramento em todos os campos, podemos ter então o histórico de mudanças de planos, jogos, número de logins, número de avaliações entre outros KPIs. Caso tenha alguma dúvida, estamos à disposição. Criamos também uma view materializada das regras dos jogos convertendo o JSON de retorno do Watson Assistant em uma tabela para podermos entender os assuntos de cada regra, o código se encontra no mesmo link.
