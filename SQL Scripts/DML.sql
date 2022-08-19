-- TB_Usuario

insert into tb_usuario values( nextval('sq_usuario'), 'teste','teste','teste',current_timestamp,current_timestamp); 
insert into tb_usuario values( nextval('sq_usuario'), 'Carla Louise da Rocha', 'carla_louise_darocha@mundivox.com.br', '5YKUEmmHXW', '1996-07-01', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Thomas Ruan Benício Farias', 'thomas-farias80@facebook.com', '0ctdOMUd0d', '1981-02-26', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Alana Tereza Clara Freitas', 'alana-freitas71@stembalagens.com.br', 'BCGK695qhT', '1945-05-21', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Ruan Ryan Rezende', 'ruan-rezende84@comercialrizzo.com', '5Sc1zFhyij', '1965-05-08', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Isabel Camila Sara Martins', 'isabel_camila_martins@julietavinhas.fot.br', 'XqiFx4Zjt2', '1975-02-11', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Gabriel Severino Moura', 'gabriel.severino.moura@grupoaerius.com.br', 's71l4tanBr', '2001-01-23', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Sueli Analu Duarte', 'sueli_analu_duarte@zuinzuin.com.br', 'BiYAniYeYh', '1982-01-17', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Nicole Isis Nascimento', 'nicole.isis.nascimento@ozsurfing.com.br', 'USH8JwQtIA', '1950-07-02', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Mirella Benedita Aragão', 'mirellabeneditaaragao@clickfios.com.br', 'XRuMS9hY9R', '1965-08-04', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Mário Renan Anderson Silva', 'mariorenansilva@expressoforte.com.br', 'D3NAP7dax6', '1988-04-17', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Bento Yago Rocha', 'bento.yago.rocha@yahoo.com .br', 'CiXJTeW75U', '1988-07-14', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Eduardo Raimundo da Costa', 'eduardo-dacosta85@artedaserra.com.br', 'PjFzN4dXSM', '1947-01-25', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Juan Raimundo Enrico Pereira', 'juan_raimundo_pereira@luxafit.com.br', 'tHH3ac1Jy9', '1963-07-12', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Kevin Nicolas da Luz', 'kevin-daluz76@trt15.jus.br', 'pXbKu04zKk', '1998-06-01', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Lívia Priscila Tereza de Paula', 'livia_priscila_depaula@inepar.com.br', 'jucNaRr0KG', '1976-03-25', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Emilly Sônia Baptista', 'emillysoniabaptista@destaco.com', '0OPOIunaqB', '1977-04-17', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Joaquim Augusto Fogaça', 'joaquim-fogaca73@cntbrasil.com.br', 'Ikmx0WPlhA', '2004-04-01', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Rebeca Priscila da Mata', 'rebeca.priscila.damata@etirama.com.br', 'lchl783kpR', '1981-02-11', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Renan Eduardo Samuel Figueiredo', 'renaneduardofigueiredo@outloock.com', 'qW91oyRMO0', '1976-01-27', current_timestamp);
insert into tb_usuario values( nextval('sq_usuario'), 'Jorge Otávio Raul Assis', 'jorge_assis@fulltransport.com.br', 'ZK4uH5qDhz', '1988-06-26', current_timestamp);

-- TB_Categoria

INSERT INTO tb_categoria values (nextval('sq_categori'), 'Jogos de cartas', 'Jogos que são jogados com quaisquer tipo de cartas', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categori'), 'Esporte', 'Categoria para abrigar os principais jogos de esportes.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categori'), 'Ao ar livre', 'Jogos para se jogar ao ar livre, utilizando um grande espaço.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categori'), 'Diversos', 'Jogos que não se enquadram nas demais categorias.', current_timestamp);

-- TB_Jogo

INSERT INTO tb_jogo values (nextval('sq_jogo'), 'Taco', 1, 4, null, 'nao', 'sim', current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 'Pega Pega', 3, 2, null, 'nao', 'sim', current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 'Truco', 1, 4, 6, 'nao', 'sim', current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 'Sueca', 1, 2, null, 'sim', 'sim', current_timestamp);

-- [TO DO]

-- TB_Regra

INSERT INTO "TB_Regra" values (nextval('sq_regra'), 1, 'principal', 'Uma pessoa de cada dupla joga um taco para frente, com a missão de aproximá-lo ao máximo que puder de um determinado ponto – por exemplo: o meio fio de uma rua, ou um muro. Ganha essa a disputa o par do taco que aproximar mais perto do ponto escolhido. Se o bastão encostar ou passar do ponto, a dupla perde a disputa.', 'sim', current_timestamp);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 2, 'principal', 'Escolhe-se um pegador e os demais se espalham pelo espaço de jogo. Quando alguém é pego, dá a mão para o pegador e passa a atuar em dupla com ele. Em seguida, em trio, quarteto e assim sucessivamente, formando uma “corrente”, até que reste apenas um fugitivo, que será declarado vencedor.', 'sim', current_timestamp);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 3, 'principal', 'Em cada rodada, um jogador deve colocar uma de suas cartas na mesa, e o jogador com a carta mais forte vence a rodada. Quem ganhar 2 dessas rodadas ganha a mão e marca 1 ponto, e uma nova mão se inicia. Durante as rodadas, os jogadores têm a opção de pedir Truco, Seis, Nove e Doze, aumentando o valor da rodada.', 'sim', current_timestamp);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 4, 'principal', 'Rodada - uma sequência de 4 jogadas, onde cada jogador joga uma carta, e o vencedor leva as 4 cartas. Carta mais alta - a carta de maior valor do naipe. A ordem das cartas é a seguinte, da menor para a maior: 2, 3, 4, 5, 6, Q, J, K, 7, A. Seguir o naipe - jogar um carta do mesmo naipe da primeira carta da rodada.', 'sim', current_timestamp);

-- TB_Item

INSERT INTO "TB_Item" values (nextval('sq_item'), 'Cartas', 'Baralho', 'sim');
INSERT INTO "TB_Item" values (nextval('sq_item'), 'Bebida', 'Bebida alcoolica', 'sim');
INSERT INTO "TB_Item" values (nextval('sq_item'), 'Bastao', 'Taco', 'sim');
INSERT INTO "TB_Item" values (nextval('sq_item'), 'Bola', 'Bola de futebol', 'sim');


-- TB_Jogo_Item

INSERT INTO "TB_Jogo_Item" values (nextval('sq_jogo_item'), 1, 1);
INSERT INTO "TB_Jogo_Item" values (nextval('sq_jogo_item'), 2, 2);
INSERT INTO "TB_Jogo_Item" values (nextval('sq_jogo_item'), 3, 3);
INSERT INTO "TB_Jogo_Item" values (nextval('sq_jogo_item'), 4, 4);


-- TB_Avaliacao

INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 1, 1, null, 'positivo', 'sim', current_timestamp);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 2, 1, null, 'positivo', 'sim', current_timestamp);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 3, 1, null, 'positivo', 'sim', current_timestamp);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 1, 2, 'Jogo muito cansativo.', 'negativo', 'sim', current_timestamp);
