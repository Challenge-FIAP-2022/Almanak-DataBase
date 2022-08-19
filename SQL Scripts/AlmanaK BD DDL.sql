SET check_function_bodies = false;

/* Enum 'en_bolleano' */
CREATE TYPE en_bolleano AS ENUM('sim', 'nao');

/* Enum 'en_tp_avalicao' */
CREATE TYPE en_tp_avalicao AS ENUM('positivo', 'negativo');

/* Sequence 'SQ_Usuario' */
create sequence SQ_Usuario;

/* Sequence 'SQ_Avalicao' */
create sequence SQ_Avaliacao;

/* Sequence 'SQ_Jogo' */
create sequence SQ_Jogo;

/* Sequence 'SQ_Endereco' */
create sequence SQ_Endereco;

/* Sequence 'SQ_Item' */
create sequence SQ_Item;

/* Sequence 'SQ_Regra' */
create sequence SQ_Regra;

/* Sequence 'SQ_Jogo_Item' */
create sequence SQ_Jogo_Item;

/* Table 'TB_Usuario' */
CREATE TABLE "TB_Usuario"(
  id_usuario integer NOT NULL,
  nr_cpf_cnpj varchar(11) NOT NULL,
  nm_usuario varchar(50),
  ds_email varchar(50) NOT NULL,
  ds_senha varchar(20) NOT NULL,
  dt_nascimento date,
  dt_alteracao date,
  PRIMARY KEY(id_usuario),
  CONSTRAINT un_usuario_cpf_cnpj UNIQUE(nr_cpf_cnpj),
  CONSTRAINT un_usuario_email UNIQUE(ds_email)
);

COMMENT ON TABLE "TB_Usuario" IS
  'Tabela para armazenamento do dados do usuario.';

/* Table 'TB_Endereco' */
CREATE TABLE "TB_Endereco"(
  id_endereco integer NOT NULL,
  id_usuario integer NOT NULL,
  nm_pais varchar(15),
  cd_uf varchar(2),
  nm_cidade varchar(50),
  nr_cep integer,
  nm_rua varchar(50),
  nr_endereco integer,
  fl_valido en_bolleano,
  dt_alteracao date,
  PRIMARY KEY(id_endereco)
);

COMMENT ON TABLE "TB_Endereco" IS
  'Tabela para armazenamento dos enderecos do usuario.';

/* Table 'TB_Jogo' */
CREATE TABLE "TB_Jogo"(
  id_jogo integer NOT NULL,
  nm_jogo varchar(50) NOT NULL,
  nr_min_jogadores integer NOT NULL,
  nr_max_jogadores integer,
  fl_valido en_bolleano,
  dt_alteracao date,
  PRIMARY KEY(id_jogo),
  CONSTRAINT un_jogo_nm_jogo UNIQUE(nm_jogo)
);

COMMENT ON TABLE "TB_Jogo" IS 'Tabela para o cadastro dos jogos da plataforma.';

/* Table 'TB_Item' */
CREATE TABLE "TB_Item"(
  id_item integer NOT NULL,
  tp_item varchar(50),
  nm_item varchar(50),
  fl_necessario en_bolleano,
  PRIMARY KEY(id_item),
  CONSTRAINT un_item_nm_item UNIQUE(nm_item)
);

COMMENT ON TABLE "TB_Item" IS
  'Tabela para o cadastro de itens que podem ser usados para os jogos.';

/* Table 'TB_Jogo_Item' */
CREATE TABLE "TB_Jogo_Item"(
  id_jogo_item integer NOT NULL,
  id_jogo integer NOT NULL,
  id_item integer NOT NULL,
  PRIMARY KEY(id_jogo_item)
);

COMMENT ON TABLE "TB_Jogo_Item" IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

/* Table 'TB_Regra' */
CREATE TABLE "TB_Regra"(
  id_regra integer NOT NULL,
  id_jogo integer NOT NULL,
  nm_regra varchar(50) NOT NULL,
  ds_regra varchar(500),
  fl_opcional en_bolleano,
  dt_alteracao date,
  PRIMARY KEY(id_regra)
);

COMMENT ON TABLE "TB_Regra" IS 'Tabela para o cadastro das regras do jogo.';

/* Table 'TB_Avaliacao' */
CREATE TABLE "TB_Avaliacao"(
  id_avaliacao integer NOT NULL,
  id_usuario integer NOT NULL,
  id_jogo integer NOT NULL,
  ds_avaliacao text,
  tp_avaliacao en_tp_avalicao,
  fl_jogado en_bolleano,
  dt_alteracao date,
  PRIMARY KEY(id_avaliacao)
);

COMMENT ON TABLE "TB_Avaliacao" IS
  'Tabela para o cadastro das avalizações do usuario.';

/* Relation 'FK_Endereco_Usuario' */
ALTER TABLE "TB_Endereco"
  ADD CONSTRAINT "FK_Endereco_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES "TB_Usuario" (id_usuario);

/* Relation 'FK_Item_Jogo' */
ALTER TABLE "TB_Jogo_Item"
  ADD CONSTRAINT "FK_Item_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

/* Relation 'FK_Jogo_Item' */
ALTER TABLE "TB_Jogo_Item"
  ADD CONSTRAINT "FK_Jogo_Item"
    FOREIGN KEY (id_item) REFERENCES "TB_Item" (id_item);

/* Relation 'FK_Regra_Jogo' */
ALTER TABLE "TB_Regra"
  ADD CONSTRAINT "FK_Regra_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);

/* Relation 'FK_Avaliacao_Usuario' */
ALTER TABLE "TB_Avaliacao"
  ADD CONSTRAINT "FK_Avaliacao_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES "TB_Usuario" (id_usuario);

/* Relation 'FK_Avaliacao_Jogo' */
ALTER TABLE "TB_Avaliacao"
  ADD CONSTRAINT "FK_Avaliacao_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES "TB_Jogo" (id_jogo);
