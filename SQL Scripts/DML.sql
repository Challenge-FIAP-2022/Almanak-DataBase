-- TB_Usuario

INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '41762758393', 'Nathan Miguel Julio da Rosa', 'nathan_darosa@knowconsulting.com.br', 'cmU7akalUF', '1972-05-02', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '24360679700', 'Isadora Lorena Porto', 'isadoralorenaporto@elevaconsultancy.com.br', 'HtoZwZnNtQ', '1979-02-12', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '18454737952', 'Rita Joana Assis', 'rita_joana_assis@unitau.com.br', '3kXYAFizjI', '1987-02-08', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '92677700204', 'Nelson Renan Juan da Costa', 'nelson-dacosta81@aulicinobastos.com.br', 'iZAfgDdtoP', '1958-03-12', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '43591226670', 'Anthony Alexandre Ribeiro', 'anthony.alexandre.ribeiro@powerblade.com.br', 'thesZ9MxhK', '1976-05-16', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '7083270600', 'Amanda Mirella Luzia de Paula', 'amanda_depaula@sectron.com.br', 'Ao2qauxK1p', '1987-03-04', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '11130881253', 'Theo Hugo Fernando Moreira', 'theo_moreira@inductothermgroup.com.br', 'xJkhh6sqFE', '1973-04-25', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '51228335249', 'Noah Cauã André Costa', 'noah_costa@fredericodiniz.com', 'feRfGlCQ2S', '1976-01-07', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '50163095230', 'Davi Victor Castro', 'davi.victor.castro@raya3.com.br', 'qtWxs3XzCB', '1974-01-02', current_date);
INSERT INTO "TB_Usuario" values (nextval('sq_usuario'), '58042952090', 'Geraldo Enzo Oliveira', 'geraldo_oliveira@systemsadvisers.com', 'o5d3A0e358', '1979-01-23', current_date);

-- TB_Endereco

INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 1, 'Brasil', 'CE', 'Juazeiro do Norte', 63050080, 'Rua Afonso Melo', 615, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 2, 'Brasil', 'SE', 'Aracaju', 49092030, 'Rua Francisco Xavier da Paixão', 129, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 3, 'Brasil', 'DF', 'Brasília', 73350151, 'Quadra EQ 1/2 Bloco A', 611, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 4, 'Brasil', 'MG', 'Poços de Caldas', 37704388, 'Rua Luiz José Dias Neto', 160, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 5, 'Brasil', 'ES', 'Serra', 29166835, 'Rua das Mangas', 220, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 6, 'Brasil', 'AC', 'Rio Branco', 69906402, 'Rua Nossa Senhora de Fátima', 324, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 7, 'Brasil', 'GO', 'Aparecida de Goiânia', 74926786, 'Rua Hugo de Carvalho Ramos', 554, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 8, 'Brasil', 'SC', 'Joinville', 89224380, 'Rua Arraias', 670, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 9, 'Brasil', 'PI', 'Picos', 64600074, 'Travessa Joaquim Paraíba de Oliveira', 918, 'sim', current_date);
INSERT INTO "TB_Endereco" values (nextval('sq_endereco'), 10, 'Brasil', 'GO', 'Catalão', 75704400, 'Rua Antônio Lopes Correia', 145, 'sim', current_date);


-- TB_Jogo

INSERT INTO "TB_Jogo" values (nextval('sq_jogo'), 'Taco', 4, null, 'sim', current_date);
INSERT INTO "TB_Jogo" values (nextval('sq_jogo'), 'Pega Pega', 2, null, 'sim', current_date);
INSERT INTO "TB_Jogo" values (nextval('sq_jogo'), 'Truco', 4, 6, 'sim', current_date);
INSERT INTO "TB_Jogo" values (nextval('sq_jogo'), 'Sueca', 2, null, 'sim', current_date);


-- TB_Regra

INSERT INTO "TB_Regra" values (nextval('sq_regra'), 1, 'principal', 'Uma pessoa de cada dupla joga um taco para frente, com a missão de aproximá-lo ao máximo que puder de um determinado ponto – por exemplo: o meio fio de uma rua, ou um muro. Ganha essa a disputa o par do taco que aproximar mais perto do ponto escolhido. Se o bastão encostar ou passar do ponto, a dupla perde a disputa.', 'sim', current_date);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 2, 'principal', 'Escolhe-se um pegador e os demais se espalham pelo espaço de jogo. Quando alguém é pego, dá a mão para o pegador e passa a atuar em dupla com ele. Em seguida, em trio, quarteto e assim sucessivamente, formando uma “corrente”, até que reste apenas um fugitivo, que será declarado vencedor.', 'sim', current_date);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 3, 'principal', 'Em cada rodada, um jogador deve colocar uma de suas cartas na mesa, e o jogador com a carta mais forte vence a rodada. Quem ganhar 2 dessas rodadas ganha a mão e marca 1 ponto, e uma nova mão se inicia. Durante as rodadas, os jogadores têm a opção de pedir Truco, Seis, Nove e Doze, aumentando o valor da rodada.', 'sim', current_date);
INSERT INTO "TB_Regra" values (nextval('sq_regra'), 4, 'principal', 'Rodada - uma sequência de 4 jogadas, onde cada jogador joga uma carta, e o vencedor leva as 4 cartas. Carta mais alta - a carta de maior valor do naipe. A ordem das cartas é a seguinte, da menor para a maior: 2, 3, 4, 5, 6, Q, J, K, 7, A. Seguir o naipe - jogar um carta do mesmo naipe da primeira carta da rodada.', 'sim', current_date);

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

INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 1, 1, null, 'positivo', 'sim', current_date);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 2, 1, null, 'positivo', 'sim', current_date);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 3, 1, null, 'positivo', 'sim', current_date);
INSERT INTO "TB_Avaliacao" values (nextval('sq_avaliacao'), 1, 2, 'Jogo muito cansativo.', 'negativo', 'sim', current_date);
