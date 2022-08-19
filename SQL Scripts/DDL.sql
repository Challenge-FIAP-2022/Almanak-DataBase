SET check_function_bodies = false;

CREATE TYPE en_bolleano AS ENUM('sim', 'nao');

CREATE TYPE en_tp_avalicao AS ENUM('positivo', 'negativo');

CREATE TYPE en_tp_item AS ENUM
  ('bola',  'carta',  'bebida',  'taco',  'quadra', ' papelaria', 'geral');

create sequence sq_usuario;

create sequence sq_avaliacao;

create sequence sq_jogo;

create sequence sq_item;

create sequence sq_regra;

create sequence sq_jogo_item;

create sequence sq_grupo_usuario;

create sequence sq_tipo_atividade;

create sequence sq_categoria;

create sequence sq_grupo_jogo;

create sequence sq_atividade;

create sequence sq_grupo;

CREATE TABLE tb_usuario(
  id_usuario integer NOT NULL,
  nm_usuario varchar(50),
  ds_email varchar(50) NOT NULL,
  ds_senha varchar(20) NOT NULL,
  dt_nascimento date,
  dt_registro timestamp,
  CONSTRAINT "PK_Usuario" PRIMARY KEY(id_usuario),
  CONSTRAINT "UN_Usuario_Email" UNIQUE(ds_email)
);

COMMENT ON TABLE tb_usuario IS 'Tabela para armazenamento do dados do usuario.';

CREATE TABLE tb_jogo(
  id_jogo integer NOT NULL,
  id_categoria integer NOT NULL,
  nm_jogo varchar(50) NOT NULL,
  nr_min_jogadores integer NOT NULL,
  nr_max_jogadores integer,
  fl_idade en_bolleano,
  fl_valido en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "PK_jogo" PRIMARY KEY(id_jogo),
  CONSTRAINT "UN_Nome_Jogo" UNIQUE(nm_jogo)
);

COMMENT ON TABLE tb_jogo IS 'Tabela para o cadastro dos jogos da plataforma.';

CREATE TABLE tb_item(
  id_item integer NOT NULL,
  tp_item en_tp_item,
  nm_item varchar(50),
  fl_necessario en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "PK_Item" PRIMARY KEY(id_item),
  CONSTRAINT "UN_Nome_Item" UNIQUE(nm_item)
);

COMMENT ON TABLE tb_item IS
  'Tabela para o cadastro de itens que podem ser usados para os jogos.';

CREATE TABLE tb_jogo_item(
  id_jogo_item integer NOT NULL,
  id_jogo integer NOT NULL,
  id_item integer NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Jogo_Item" PRIMARY KEY(id_jogo_item)
);

COMMENT ON TABLE tb_jogo_item IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE tb_regra(
  id_regra integer NOT NULL,
  id_jogo integer NOT NULL,
  nm_regra varchar(50) NOT NULL,
  ds_regra varchar(500),
  fl_opcional en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "PK_Regra" PRIMARY KEY(id_regra)
);

COMMENT ON TABLE tb_regra IS 'Tabela para o cadastro das regras do jogo.';

CREATE TABLE tb_avaliacao(
  id_avaliacao integer NOT NULL,
  id_usuario integer NOT NULL,
  id_jogo integer NOT NULL,
  tp_avaliacao en_tp_avalicao,
  ds_avaliacao text,
  fl_jogado en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "PK_Avaliacao" PRIMARY KEY(id_avaliacao)
);

COMMENT ON TABLE tb_avaliacao IS
  'Tabela para o cadastro das avalizações do usuario.';

CREATE TABLE tb_categoria(
  id_categoria integer NOT NULL,
  nm_categoria text NOT NULL,
  ds_categoria text,
  dt_registro timestamp,
  CONSTRAINT "PK_Categoria" PRIMARY KEY(id_categoria),
  CONSTRAINT "UN_Nome_Categoria" UNIQUE(nm_categoria)
);

CREATE TABLE tb_grupo(
  id_grupo integer NOT NULL,
  nm_grupo text NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo" PRIMARY KEY(id_grupo)
);

CREATE TABLE tb_grupo_jogo(
  id_grupo_jogo integer NOT NULL,
  id_grupo integer NOT NULL,
  id_jogo integer NOT NULL,
  fl_valido en_bolleano,
  "dt _encerramento" timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Jogo" PRIMARY KEY(id_grupo_jogo)
);

COMMENT ON TABLE tb_grupo_jogo IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE tb_grupo_usuario(
  id_grupo_usuario integer NOT NULL,
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  fl_valido date NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Usuario" PRIMARY KEY(id_grupo_usuario)
);

CREATE TABLE tb_atividade(
  id_atividade integer NOT NULL,
  id_usuario integer NOT NULL,
  id_tipo_atividade integer NOT NULL,
  ds_atividade text,
  dt_registro timestamp,
  CONSTRAINT "PK_Atividade" PRIMARY KEY(id_atividade)
);

CREATE TABLE tb_tipo_atividade(
  id_tipo_atividade integer NOT NULL,
  ds_grupo text,
  ds_subgrupo text,
  dt_registro timestamp,
  CONSTRAINT "PK_Tipo_Atividade" PRIMARY KEY(id_tipo_atividade)
);

ALTER TABLE tb_jogo_item
  ADD CONSTRAINT "FK_Item_Jogo" FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo)
  ;

ALTER TABLE tb_jogo_item
  ADD CONSTRAINT "FK_Jogo_Item" FOREIGN KEY (id_item) REFERENCES tb_item (id_item)
  ;

ALTER TABLE tb_regra
  ADD CONSTRAINT "FK_Regra_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo);

ALTER TABLE tb_avaliacao
  ADD CONSTRAINT "FK_Avaliacao_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_avaliacao
  ADD CONSTRAINT "FK_Avaliacao_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo);

ALTER TABLE tb_jogo
  ADD CONSTRAINT "FK_Jogo_Categoria"
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria);

ALTER TABLE tb_grupo_jogo
  ADD CONSTRAINT "FK_Grupo_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo);

ALTER TABLE tb_grupo_jogo
  ADD CONSTRAINT "FK_Jogo_Grupo"
    FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);

ALTER TABLE tb_grupo_usuario
  ADD CONSTRAINT "FK_Grupo_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_grupo_usuario
  ADD CONSTRAINT "FK_Usuario_Grupo"
    FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);

ALTER TABLE tb_atividade
  ADD CONSTRAINT "FK_Atividade_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_atividade
  ADD CONSTRAINT "FK_Tipo_Atividade"
    FOREIGN KEY (id_tipo_atividade) REFERENCES tb_tipo_atividade (id_tipo_atividade)
  ;
