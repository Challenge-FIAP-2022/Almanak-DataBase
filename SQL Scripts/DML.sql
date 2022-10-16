--===================================================================================================================
----------------------------------------------- TB_Grupo ------------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_grupo values (nextval('sq_grupo'), 'inicial', cast('2022-01-01' as timestamp));

INSERT INTO tb_grupo values (nextval('sq_grupo'), 'KNN 1', cast('2022-01-01' as timestamp));
INSERT INTO tb_grupo values (nextval('sq_grupo'), 'KNN 2', cast('2022-01-01' as timestamp));
INSERT INTO tb_grupo values (nextval('sq_grupo'), 'KNN 3', cast('2022-01-01' as timestamp));
INSERT INTO tb_grupo values (nextval('sq_grupo'), 'KNN 4', cast('2022-01-01' as timestamp));
INSERT INTO tb_grupo values (nextval('sq_grupo'), 'KNN 5', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Plano ------------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_plano values (nextval('sq_plano'), 'Gamer', 'Plano gratuito, com anúncios.', 0, 'sim', null, cast('2022-01-01' as timestamp));
INSERT INTO tb_plano values (nextval('sq_plano'), 'Pro Gamer', 'Plano com pagamento mensal para o recebimento de um jogo de cartas ou similar trimestralmente.', 20, 'sim', null, cast('2022-01-01' as timestamp));
INSERT INTO tb_plano values (nextval('sq_plano'), 'Elite', 'Plano com pagamento mensal para o recebimento de um jogo de tabuleiro ou similar trimestralmente.', 100, 'sim', null, cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Usuario ----------------------------------------------------------
--===================================================================================================================

insert into tb_usuario values( nextval('sq_usuario'), 'AlmanaK', 'almanak', 'almanak', current_date, cast('2022-01-01' as timestamp)); 
insert into tb_usuario values( nextval('sq_usuario'), 'Carla Louise da Rocha', 'carla_louise_darocha@mundivox.com.br', '5YKUEmmHXW', '1996-07-01', cast('2022-01-10' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Thomas Ruan Benício Farias', 'thomas-farias80@facebook.com', '0ctdOMUd0d', '1981-02-26', cast('2022-01-25' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Alana Tereza Clara Freitas', 'alana-freitas71@stembalagens.com.br', 'BCGK695qhT', '1945-05-21', cast('2022-02-13' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Ruan Ryan Rezende', 'ruan-rezende84@comercialrizzo.com', '5Sc1zFhyij', '1965-05-08', cast('2022-02-15' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Isabel Camila Sara Martins', 'isabel_camila_martins@julietavinhas.fot.br', 'XqiFx4Zjt2', '1975-02-11', cast('2022-03-07' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Gabriel Severino Moura', 'gabriel.severino.moura@grupoaerius.com.br', 's71l4tanBr', '2001-01-23', cast('2022-03-23' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Sueli Analu Duarte', 'sueli_analu_duarte@zuinzuin.com.br', 'BiYAniYeYh', '1982-01-17', cast('2022-04-14' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Nicole Isis Nascimento', 'nicole.isis.nascimento@ozsurfing.com.br', 'USH8JwQtIA', '1950-07-02', cast('2022-04-22' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Mirella Benedita Aragão', 'mirellabeneditaaragao@clickfios.com.br', 'XRuMS9hY9R', '1965-08-04', cast('2022-05-06' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Mário Renan Anderson Silva', 'mariorenansilva@expressoforte.com.br', 'D3NAP7dax6', '1988-04-17', cast('2022-05-06' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Bento Yago Rocha', 'bento.yago.rocha@yahoo.com .br', 'CiXJTeW75U', '1988-07-14', cast('2022-05-11' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Eduardo Raimundo da Costa', 'eduardo-dacosta85@artedaserra.com.br', 'PjFzN4dXSM', '1947-01-25', cast('2022-05-14' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Juan Raimundo Enrico Pereira', 'juan_raimundo_pereira@luxafit.com.br', 'tHH3ac1Jy9', '1963-07-12', cast('2022-05-18' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Kevin Nicolas da Luz', 'kevin-daluz76@trt15.jus.br', 'pXbKu04zKk', '1998-06-01', cast('2022-06-01' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Lívia Priscila Tereza de Paula', 'livia_priscila_depaula@inepar.com.br', 'jucNaRr0KG', '1976-03-25', cast('2022-06-05' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Emilly Sônia Baptista', 'emillysoniabaptista@destaco.com', '0OPOIunaqB', '1977-04-17', cast('2022-06-09' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Joaquim Augusto Fogaça', 'joaquim-fogaca73@cntbrasil.com.br', 'Ikmx0WPlhA', '2004-04-01', cast('2022-06-19' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Rebeca Priscila da Mata', 'rebeca.priscila.damata@etirama.com.br', 'lchl783kpR', '1981-02-11', cast('2022-07-03' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Renan Eduardo Samuel Figueiredo', 'renaneduardofigueiredo@outloock.com', 'qW91oyRMO0', '1976-01-27', cast('2022-07-18' as timestamp));
insert into tb_usuario values( nextval('sq_usuario'), 'Jorge Otávio Raul Assis', 'jorge_assis@fulltransport.com.br', 'ZK4uH5qDhz', '1988-06-26', cast('2022-07-08' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Tipo_Atividade ---------------------------------------------------
--===================================================================================================================

INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Login', 'Login', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca por categoria', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca geral', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Busca por jogo', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Busca', 'Jogo Recomendado', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Filtro', 'Filtro por categoria', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Filtro', 'Filtro por Item', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Cadastro', 'Cadastro de cartao', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Jogo', 'Abertura tela do jogo', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Login', 'Abrir App', cast('2022-01-01' as timestamp));
INSERT INTO tb_tipo_atividade values (nextval('sq_tipo_atividade'), 'Duvida', 'Duvida por audio', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Item -------------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_item values (nextval('sq_item'), 'carta', 'Cartas de Baralho', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'bebida_alcoolica', 'qualquer uma', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'bastao', 'Taco de madeira', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'bola', 'Bola de futebol', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'tabuleiro', 'Tabuleiro de monopoly', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'bambole', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'bastao', 'raquete', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'quadra', 'quadra poliesportiva', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'corda', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'elastico', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'papel', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'papelaria', 'lapis/ caneta', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'geral', 'bolinha de gude', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'tabuleiro', 'pecas de chadrez', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'dado', 'dado de 6 lados', cast('2022-01-01' as timestamp));
INSERT INTO tb_item values (nextval('sq_item'), 'bola', 'Bola qualquer', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Categoria --------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de cartas', 'cards', null, 'Jogos que são jogados com quaisquer tipo de cartas', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Esporte', 'soccer-field',  null, 'Categoria para abrigar os principais jogos de esportes.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de tabuleiro', 'checkerboard', null, 'Jogos que precisam de um tabuleiro para ser jogado.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Ao ar livre', 'pine-tree', null, 'Jogos para se jogar ao ar livre, utilizando um grande espaço.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos de azar', 'clover', null, 'Jogos que envolvem sorte.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos para Adultos', 'block-helper', null, 'Jogos unicos para adultos, geralmente envolvendo bebidas.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Diversos', 'strategy', null, 'Jogos que não se enquadram nas demais categorias.', cast('2022-01-01' as timestamp));
INSERT INTO tb_categoria values (nextval('sq_categoria'), 'Jogos para crianças', 'human-child', null, 'Jogos destinados para menores de 12 anos.', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Jogo -------------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Taco', 'https://images.unsplash.com/photo-1523275147196-8c1f5e82a3a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 4, 4, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Pega Pega', 'https://images.unsplash.com/photo-1532341556711-1c37110eaaac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80', 3, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Truco', 'https://images.unsplash.com/photo-1501003878151-d3cb87799705?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', 4, 6, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Sueca', 'https://images.unsplash.com/photo-1608135383810-3a615f1ad2ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80', 2, null, 'sim', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Bambole', 'https://i.pinimg.com/originals/57/6a/75/576a75d665da672def14bfeb7fd9cdd8.jpg', 2, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Mimica', 'https://st.depositphotos.com/3332767/4588/i/600/depositphotos_45881451-stock-photo-mime-artist-running-with-flowers.jpg', 2, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Stop!', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbvtjd3TmDYegdm-3pEy95mjt491VpjUZIVQ&usqp=CAU', 4, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Cordinha', 'https://ambientacao.unyleya.edu.br/pluginfile.php/435/mod_page/content/144/Imagem1.png', 3, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Queimada', 'https://images.unsplash.com/photo-1593786930094-d5c8164ac771?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80', 4, null, 'nao', 'sim', 'nao', null, null, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo values (nextval('sq_jogo'), 1, 'Proibido falar não', 'https://images.unsplash.com/photo-1584483456442-b0bfd23f20fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80', 3, null, 'sim', 'sim', 'sim', null, null, cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Regra ------------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 1, 'Uma pessoa de cada dupla joga um taco para frente.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 2, 'Com a missão de aproximá-lo ao máximo que puder de um determinado ponto, por exemplo:', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 3, 'O meio fio de uma rua, ou um muro.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 4, 'Ganha essa a disputa o par do taco que aproximar mais perto do ponto escolhido.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 1, 'Principal', 5, 'Se o bastão encostar ou passar do ponto, a dupla perde a disputa.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 2, 'Principal', 1, 'Escolhe-se um pegador e os demais se espalham pelo espaço de jogo.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 2, 'Principal', 2, 'Quando alguém é pego, dá a mão para o pegador e passa a atuar em dupla com ele.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 2, 'Principal', 3, 'Em seguida, em trio, quarteto e assim sucessivamente, formando uma corrente.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 2, 'Principal', 4, 'Até que reste apenas um fugitivo, que será declarado vencedor.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 3, 'Principal', 1, 'Em cada rodada, um jogador deve colocar uma de suas cartas na mesa,', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 3, 'Principal', 2, 'e o jogador com a carta mais forte vence a rodada.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 3, 'Principal', 3, 'Quem ganhar 2 dessas rodadas ganha a mão e marca 1 ponto,e uma nova mão se inicia.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 3, 'Principal', 4, 'Durante as rodadas, os jogadores têm a opção de pedir Truco, Seis, Nove e Doze, aumentando o valor da rodada.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 4, 'Principal', 1, 'Rodada: uma sequência de 4 jogadas, onde cada jogador joga uma carta, e o vencedor leva as 4 cartas.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 4, 'Principal', 2, 'Carta mais alta menos a carta de maior valor do naipe.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 4, 'Principal', 3, 'A ordem das cartas é a seguinte, da menor para a maior: 2, 3, 4, 5, 6, Q, J, K, 7, A.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 4, 'Principal', 4, 'Seguir o naipe, jogar um carta do mesmo naipe da primeira carta da rodada.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 5, 'Principal', 1, 'O desafio é ver quem consegue rodar o bambole por mais tempo na sintura. O último jogador que continuar rodando é o ganhador.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 5, 'Principal', 2, 'O último jogador que continuar rodando é o ganhador.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 6, 'Principal', 1, 'A cada rodada um jogar se levanta e faz uma mimica para os demais, o primeiro a adivinhar o que era ganhar e se tornar o proximo jogador.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 6, 'Principal', 1, 'o primeiro a adivinhar o que era ganhar e se tornar o proximo jogador.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 7, 'Principal', 1, 'Assim que a letra é escolhida, os participantes terão que escrever abaixo de cada tema, uma palavra com início da letra sorteada.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 7, 'Principal', 2, 'Quem terminar primeiro de escrever em toda a linha com os temas grita: Stop!, e na mesma hora todos devem largar o lápis e parar de escrever.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 7, 'Principal', 3, 'O Jogador que tiver mais categorias completas é o ganhador.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 8, 'Principal', 1, 'Duas crianças batem ou giram a corda, enquanto uma terceira criança pula e diz: cor-di-nha.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 8, 'Principal', 2, 'Cada sílaba dita corresponde a um pulo.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 8, 'Principal', 3, 'Quando a criança que pula fala a palavra completinha, ela sai da corda e dá vez a outro participante.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 8, 'Principal', 4, 'Quem está pulando não pode pisar na corda.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 1, 'Os dois times se posicionam num campo dividido por uma linha central. Esta não pode ser ultrapassada e caso isto ocorra, o jogador infrator terá que ir para a área do queimado.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 2, 'O jogador deve arremessar a bola contra o time adversário, com o intuito de queimá-los. Por sua parte, os adversários tentam se espalhar no campo ou ir ao fundo do mesmo, para não serem atingidos pela bola.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 3, 'Se a bola não atinge ninguém e apenas quica no campo adversário, o jogador pode pegá-la sem o risco de estar queimado.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 4, 'Os jogadores são queimados nos seguintes casos: quando a bola acerta qualquer parte do corpo ou quando pegam a bola, mas a deixam cair.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 5, 'Os jogadores queimados devem ir para uma área específica, atrás do campo do time adversário. Em alguns lugares no Brasil, esta é chamada de prisão, céu, cemitério, "astigo, base.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 6, 'O jogador queimado pode voltar ao jogo se queimar outro jogador.', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 9, 'Principal', 7, 'Vence o time que conseguir queimar o maior número de jogadores.', 'nao', cast('2022-01-01' as timestamp));

INSERT INTO tb_regra values (nextval('sq_regra'), 10, 'Principal', 1, 'Nesse jogo só se pode responder com perguntas,', 'nao', cast('2022-01-01' as timestamp));
INSERT INTO tb_regra values (nextval('sq_regra'), 10, 'Principal', 2, 'o primeiro jogador que não fizer uma pergunta deve beber. Após isso a rodada se reinicia.', 'nao', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Jogo_Item --------------------------------------------------------
--===================================================================================================================

INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 1, 3, 2, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 3, 1, 1, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 4, 1, 1, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 4, 2, null, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 5, 6, null, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 7, 11, null, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 7, 12, null, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 8, 9, 1, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 9, 16, 1, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 9, 8, 1, 'sim', cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_item values (nextval('sq_jogo_item'), 10, 2, null, 'sim', cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Jogo_Categoria ---------------------------------------------------
--===================================================================================================================

INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 1, 2, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 1, 4, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 2, 4, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 3, 1, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 3, 5, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 4, 1, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 4, 6, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 4, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 7, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 6, 7, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 7, 7, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 4, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 7, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 9, 2, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 9, 4, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 10, 6, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 2, 8, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 5, 8, cast('2022-01-01' as timestamp));
INSERT INTO tb_jogo_categoria values (nextval('sq_jogo_categoria'), 8, 8, cast('2022-01-01' as timestamp));

--===================================================================================================================
----------------------------------------------- TB_Avaliação --------------------------------------------------------
--===================================================================================================================

call sp_preencher_avaliacao(100);

--===================================================================================================================
----------------------------------------------- Commit --------------------------------------------------------------
--===================================================================================================================

commit;