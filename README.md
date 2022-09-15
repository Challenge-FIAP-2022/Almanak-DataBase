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

Professor Marcel, optamos por criar uma base de dados em PostgreSQL para aprendermos outra linguagem de SQL que não só o da Oracle. Com isso, tivemos que fazer uma adaptação. Conforme conversamos, muitas das nossas procedures e triggers não contam com exception do tipo "when others" nem as criadas pelo DBA, contudo temos tratamento de exceção no código e registro de ocorrências em uma tabela de erro. Como são procedimentos que consomem dados da própria base, não teremos muita exceção do tipo "when others", dado que os cursores consumirão tabelas já preenchidas e sem inputs dos usuários. Fizemos assim para deixar tudo o mais automático possível e evitar ao máximo inputs humanos na base.
