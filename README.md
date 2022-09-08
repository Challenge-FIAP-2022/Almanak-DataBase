# Documentação AlmanaK DB

## Disclaimer

Como o referido projeto está vinculado a uma base de dados de produção, os dados obtidos como respostas de cada requisição podem variar de acordo com a interação dos demais usuários.

<hr>
<br>

## Integrantes do Grupo

- Bianca Man Tchuin Chang Lee (RM: 89171)
- Danilo Zequim de Moura (RM: 89045)
- Eric Brianez Giannetti (RM: 87087)
- Matheus Pismel de Jeronymo (RM: 86931)
- Otavio de Magalhães Gomes (RM: 87680)
- Zack Lorenzzo Corrêa (RM: 87149)

<hr>
<br>


## Descriação do projeto
O projeto na criação de um app para Android em que os usuários possam consultar jogos prosenciais para jogar no seu tempo de lazer. 
Com a pandemia muitas crianças ficaram sem brincar com seus amigos, então o app poderá dar sugestões de brincadeiras, 
contudo a aplicação não se limite a crianças, podendo ser para adultos também.
<hr>
<br>

## Base de dados

Caso queira ver os scripts eles podem ser encontrados <a href="/SQL Scripts/DDL.sql">aqui</a>. 

Caso queira ver melhor o layout da base, recomendamos acessar o link abaixo com um relatório interativo da da base.

Link: https://almanak-db-report.herokuapp.com/

<hr>
<br>

## Notas Extras

Professor optamos por criar uma base de dados em PostgreSQL para aprendermos outra linguagem de SQL que não só o da Oracle. Com isso tivemos que fazer uma adaptação, conforme conversamos muitas das nossas procedures e triggers não contam com exception do tipo "when others" nem as ciradas pelo DBA, contudo temos tratamento de exceção no código e registro de  ocorrências em uma tabela de erro. Como são procedimentos que consomem dados da própria base não teremos muitas exceção do tipo "when others" dado que os cursores consumirão tabelas já preenchidas e sem inputs dos usuários, fizemos assim para deixar tudo o mais automático possivel e evitar ao máximo inputs humanos na base.