SET check_function_bodies = false;

CREATE TYPE en_bolleano AS ENUM('sim', 'nao');

CREATE TYPE en_tp_avalicao AS ENUM('positivo', 'negativo');

CREATE TYPE en_tp_item AS ENUM
  ('bola',  'carta',  'bebida',  'taco',  'quadra', ' papelaria', 'geral');

create sequence SQ_Usuario;

create sequence SQ_Avaliacao;

create sequence SQ_Jogo;

create sequence SQ_Item;

create sequence SQ_Regra;

create sequence SQ_Jogo_Item;

create sequence SQ_Grupo_Usuario;

create sequence SQ_Tipo_Atividade;

create sequence SQ_Categoria;

create sequence SQ_Grupo_Jogo;

create sequence SQ_Atividade;

create sequence SQ_Grupo;

CREATE TABLE "TB_Usuario"(
  id_usuario integer NOT NULL,
  nm_usuario varchar(50),
  ds_email varchar(50) NOT NULL,
  ds_senha varchar(20) NOT NULL,
  dt_nascimento date,
  dt_registro timestamp,
  CONSTRAINT pk_usuario PRIMARY KEY(id_usuario),
  CONSTRAINT un_usuario_email UNIQUE(ds_email)
);

COMMENT ON TABLE "TB_Usuario" IS
  'Tabela para armazenamento do dados do usuario.';

CREATE TABLE "TB_Jogo"(
  id_jogo integer NOT NULL,
  id_categoria integer NOT NULL,
  nm_jogo varchar(50) NOT NULL,
  nr_min_jogadores integer NOT NULL,
  nr_max_jogadores integer,
  fl_idade en_bolleano,
  fl_valido en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_jogo),
  CONSTRAINT un_jogo_nm_jogo UNIQUE(nm_jogo)
);

COMMENT ON TABLE "TB_Jogo" IS 'Tabela para o cadastro dos jogos da plataforma.';

CREATE TABLE "TB_Item"(
  id_item integer NOT NULL,
  tp_item en_tp_item,
  nm_item varchar(50),
  fl_necessario en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_item),
  CONSTRAINT un_item_nm_item UNIQUE(nm_item)
);

COMMENT ON TABLE "TB_Item" IS
  'Tabela para o cadastro de itens que podem ser usados para os jogos.';

CREATE TABLE "TB_Jogo_Item"(
  id_jogo_item integer NOT NULL,
  id_jogo integer NOT NULL,
  id_item integer NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_jogo_item)
);

COMMENT ON TABLE "TB_Jogo_Item" IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE "TB_Regra"(
  id_regra integer NOT NULL,
  id_jogo integer NOT NULL,
  nm_regra varchar(50) NOT NULL,
  ds_regra varchar(500),
  fl_opcional en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_regra)
);

COMMENT ON TABLE "TB_Regra" IS 'Tabela para o cadastro das regras do jogo.';

CREATE TABLE "TB_Avaliacao"(
  id_avaliacao integer NOT NULL,
  id_usuario integer NOT NULL,
  id_jogo integer NOT NULL,
  tp_avaliacao en_tp_avalicao,
  ds_avaliacao text,
  fl_jogado en_bolleano,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_avaliacao)
);

COMMENT ON TABLE "TB_Avaliacao" IS
  'Tabela para o cadastro das avalizações do usuario.';

CREATE TABLE "TB_Categoria"(
  id_categoria integer NOT NULL,
  nm_categoria text NOT NULL,
  ds_categoria text,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_categoria),
  CONSTRAINT un_nm_categoria UNIQUE(nm_categoria)
);

CREATE TABLE "TB_Grupo"(
  id_grupo integer NOT NULL,
  nm_grupo text NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_grupo)
);

CREATE TABLE "TB_Grupo_Jogo"(
  "id_Grupo_jogo" integer NOT NULL,
  id_grupo integer NOT NULL,
  id_jogo integer NOT NULL,
  fl_valido en_bolleano,
  "dt _encerramento" timestamp,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY("id_Grupo_jogo")
);

COMMENT ON TABLE "TB_Grupo_Jogo" IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE "TB_Grupo_Usuario"(
  id_grupo_usuario integer NOT NULL,
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  fl_valido date NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_grupo_usuario)
);

CREATE TABLE "TB_Atividade"(
  id_atividade integer NOT NULL,
  id_usuario integer NOT NULL,
  id_tipo_atividade integer NOT NULL,
  ds_atividade text,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_atividade)
);

CREATE TABLE "TB_Tipo_Atividade"(
  id_tipo_atividade integer NOT NULL,
  ds_grupo text,
  ds_subgrupo text,
  dt_registro timestamp,
  CONSTRAINT "Primary key" PRIMARY KEY(id_tipo_atividade)
);

ALTER TABLE "TB_Jogo_Item"
  ADD CONSTRAINT "FK_Item_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

ALTER TABLE "TB_Jogo_Item"
  ADD CONSTRAINT "FK_Jogo_Item"
    FOREIGN KEY (id_item) REFERENCES "TB_Item" (id_item);

ALTER TABLE "TB_Regra"
  ADD CONSTRAINT "FK_Regra_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

ALTER TABLE "TB_Avaliacao"
  ADD CONSTRAINT "FK_Avaliacao_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES "TB_Usuario" (id_usuario);

ALTER TABLE "TB_Avaliacao"
  ADD CONSTRAINT "FK_Avaliacao_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

ALTER TABLE "TB_Jogo"
  ADD CONSTRAINT "FK_Jogo_Categoria"
    FOREIGN KEY (id_categoria) REFERENCES "TB_Categoria" (id_categoria);

ALTER TABLE "TB_Grupo_Jogo"
  ADD CONSTRAINT "FK_Grupo_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

ALTER TABLE "TB_Grupo_Jogo"
  ADD CONSTRAINT "FK_Jogo_Grupo"
    FOREIGN KEY (id_grupo) REFERENCES "TB_Grupo" (id_grupo);

ALTER TABLE "TB_Grupo_Usuario"
  ADD CONSTRAINT "FK_Grupo_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES "TB_Usuario" (id_usuario);

ALTER TABLE "TB_Grupo_Usuario"
  ADD CONSTRAINT "FK_Usuario_Grupo"
    FOREIGN KEY (id_grupo) REFERENCES "TB_Grupo" (id_grupo);

ALTER TABLE "TB_Atividade"
  ADD CONSTRAINT "FK_Atividade_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES "TB_Usuario" (id_usuario);

ALTER TABLE "TB_Atividade"
  ADD CONSTRAINT "FK_Tipo_Atividade"
    FOREIGN KEY (id_tipo_atividade)
      REFERENCES "TB_Tipo_Atividade" (id_tipo_atividade);

