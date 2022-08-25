-- TB_Grupo

INSERT INTO tb_grupo values (nextval('sq_grupo'), 'inicial', current_timestamp);

-- TB_Plano

INSERT INTO tb_plano values (nextval('sq_plano'), 'Gamer', 'Plano gratuito, com anúncios.', 0, 'sim', null, current_timestamp);
INSERT INTO tb_plano values (nextval('sq_plano'), 'Pro Gamer', 'Plano limitado com acesso a alguns jogos.', 2.99, 'sim', null, current_timestamp);
INSERT INTO tb_plano values (nextval('sq_plano'), 'Elite', 'Acesso ilimitado a plataforma e maior peso nas decisões da comunidade.', 9.99, 'sim', null, current_timestamp);

-- TB_Usuario

insert into tb_usuario values( nextval('sq_usuario'), 'AlmanaK', 'almanak', 'almanak', current_date, current_timestamp); 
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

-- TB_Tipo_Atividade

INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Login', 'Login', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca por categoria', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca geral', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca por jogo', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Jogo Recomendado', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Filtro', 'Filtro por categoria', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Filtro', 'Filtro por Item', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Cadastro', 'Cadastro de cartao', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Jogo', 'Abertura tela do jogo', current_timestamp);
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Login', 'Abrir App', current_timestamp);

-- TB_Item

INSERT INTO tb_item values (nextval('sq_item'), 'carta', 'Cartas de Baralho', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'bebida alcoolica', 'qualquer uma', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'bastao', 'Taco de madeira', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'bola', 'Bola de futebol', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'tabuleiro', 'Tabuleiro de monopoly', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'bambole', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'bastao', 'raquete', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'quadra', 'quadra poliesportiva', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'corda', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'elastico', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'papel', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'lapis/ caneta', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'bolinha de gude', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'tabuleiro', 'pecas de chadrez', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'dado', 'dado de 6 lados', current_timestamp);
INSERT INTO tb_item values (nextval('sq_item'), 'bola', 'Bola qualquer', current_timestamp);

-- TB_Categoria

INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de cartas', 'Jogos que são jogados com quaisquer tipo de cartas', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Esporte', 'Categoria para abrigar os principais jogos de esportes.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de tabuleiro', 'Jogos que precisam de um tabuleiro para ser jogado.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Ao ar livre', 'Jogos para se jogar ao ar livre, utilizando um grande espaço.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de azar', 'Jogos que envolvem sorte.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos para Adultos', 'Jogos unicos para adultos, geralmente envolvendo bebidas.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Diversos', 'Jogos que não se enquadram nas demais categorias.', current_timestamp);
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos para crianças', 'Jogos destinados para menores de 12 anos.', current_timestamp);

-- TB_Jogo

INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Taco', 4, 4, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Pega Pega', 3, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Truco', 4, 6, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Sueca', 2, null, 'sim', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Bambole', 2, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Mimica', 2, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Stop!', 4, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Cordinha', 3, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Queimada', 4, null, 'nao', 'sim', 'nao', null, null, current_timestamp);
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Proibido falar não', 3, null, 'sim', 'sim', 'sim', null, null, current_timestamp);

-- TB_Regra

INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 1, 'Uma pessoa de cada dupla joga um taco para frente, com a missão de aproximá-lo ao máximo que puder de um determinado ponto – por exemplo: o meio fio de uma rua, ou um muro. Ganha essa a disputa o par do taco que aproximar mais perto do ponto escolhido. Se o bastão encostar ou passar do ponto, a dupla perde a disputa.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 2, 'Principal', 1, 'Escolhe-se um pegador e os demais se espalham pelo espaço de jogo. Quando alguém é pego, dá a mão para o pegador e passa a atuar em dupla com ele. Em seguida, em trio, quarteto e assim sucessivamente, formando uma “corrente”, até que reste apenas um fugitivo, que será declarado vencedor.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 3, 'Principal', 1, 'Em cada rodada, um jogador deve colocar uma de suas cartas na mesa, e o jogador com a carta mais forte vence a rodada. Quem ganhar 2 dessas rodadas ganha a mão e marca 1 ponto, e uma nova mão se inicia. Durante as rodadas, os jogadores têm a opção de pedir Truco, Seis, Nove e Doze, aumentando o valor da rodada.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 4, 'Principal', 1, 'Rodada - uma sequência de 4 jogadas, onde cada jogador joga uma carta, e o vencedor leva as 4 cartas. Carta mais alta - a carta de maior valor do naipe. A ordem das cartas é a seguinte, da menor para a maior: 2, 3, 4, 5, 6, Q, J, K, 7, A. Seguir o naipe - jogar um carta do mesmo naipe da primeira carta da rodada.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 5, 'Principal', 1, 'O desafio é ver quem consegue rodar o bambole por mais tempo na sintura. O último jogador que continuar rodando é o ganhador.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 6, 'Principal', 1, 'A cada rodada um jogar se levanta e faz uma mimica para os demais, o primeiro a adivinhar o que era ganhar e se tornar o proximo jogador.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 7, 'Principal', 1, 'Assim que a letra é escolhida, os participantes terão que escrever abaixo de cada tema, uma palavra com início da letra sorteada. Quem terminar primeiro de escrever em toda a linha com os temas grita: Stop!, e na mesma hora todos devem largar o lápis e parar de escrever. ', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 8, 'Principal', 1, 'Duas crianças batem ou giram a corda, enquanto uma terceira criança pula e diz: cor-di-nha Cada sílaba dita corresponde a um pulo. Quando a criança que pula fala a palavra completinha, ela sai da corda e dá vez a outro participante. Quem está pulando não pode pisar na corda.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 1, 'Os dois times se posicionam num campo dividido por uma linha central. Esta não pode ser ultrapassada e caso isto ocorra, o jogador infrator terá que ir para a área do queimado.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 2, 'O jogador deve arremessar a bola contra o time adversário, com o intuito de "queimá-los". Por sua parte, os adversários tentam se espalhar no campo ou ir ao fundo do mesmo, para não serem atingidos pela bola.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 3, 'Se a bola não atinge ninguém e apenas quica no campo adversário, o jogador pode pegá-la sem o risco de estar "queimado".', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 4, 'Os jogadores são "queimados" nos seguintes casos: quando a bola acerta qualquer parte do corpo ou quando pegam a bola, mas a deixam cair.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 5, 'Os jogadores "queimados" devem ir para uma área específica, atrás do campo do time adversário. Em alguns lugares no Brasil, esta é chamada de "prisão", "céu", "cemitério", "castigo", "base".', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 6, 'O jogador "queimado" pode voltar ao jogo se queimar outro jogador.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 7, 'Vence o time que conseguir "queimar" o maior número de jogadores.', 'nao', current_timestamp);
INSERT INTO tb_regra values (nextval('sq_regra'), 10, 'Principal', 1, 'Nesse jogo só se pode responder com perguntas, o primeiro jogador que não fizer uma pergunta deve beber. Após isso a rodada se reinicia.', 'nao', current_timestamp);

-- TB_Jogo_Item

INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 1, 3, 2, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 3, 1, 1, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 4, 1, 1, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 4, 2, null, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 5, 6, null, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 7, 11, null, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 7, 12, null, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 8, 9, 1, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 9, 16, 1, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 9, 8, 1, 'sim', current_timestamp);
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 10, 2, null, 'sim', current_timestamp);

-- TB_Jogo_Categoria

INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 1, 2, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 1, 4, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 2, 4, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 3, 1, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 3, 5, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 4, 1, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 4, 6, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 4, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 7, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 6, 7, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 7, 7, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 4, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 7, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 9, 2, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 9, 4, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 10, 6, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 2, 8, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 8, current_timestamp);
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 8, current_timestamp);
