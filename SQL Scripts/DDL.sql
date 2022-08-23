SET check_function_bodies = false;

CREATE TYPE en_booleano AS ENUM('sim', 'nao');

CREATE TYPE en_tp_item AS ENUM
  ('bola',  'carta',  'bebida alcoolica',  'bastao',  'quadra',  'papelaria', 'tabuleiro',  'dado',  'geral')
  ;

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

create sequence sq_jogo_categoria;

create sequence sq_erro;

create sequence sq_plano;

create sequence sq_plano_usuario;

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
  id_usuario integer NOT NULL,
  nm_jogo varchar(50) NOT NULL,
  nr_min_jogadores integer NOT NULL,
  nr_max_jogadores integer,
  fl_idade en_booleano,
  fl_valido en_booleano,
  fl_elite en_booleano,
  ds_encerramento text,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_jogo" PRIMARY KEY(id_jogo),
  CONSTRAINT "UN_Nome_Jogo" UNIQUE(nm_jogo)
);

COMMENT ON TABLE tb_jogo IS 'Tabela para o cadastro dos jogos da plataforma.';

CREATE TABLE tb_item(
  id_item integer NOT NULL,
  tp_item en_tp_item,
  nm_item varchar(50),
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
  qt_item integer,
  fl_necessario en_booleano,
  dt_registro timestamp,
  CONSTRAINT "PK_Jogo_Item" PRIMARY KEY(id_jogo_item)
);

COMMENT ON TABLE tb_jogo_item IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE tb_regra(
  id_regra integer NOT NULL,
  id_jogo integer NOT NULL,
  nm_regra varchar(50) NOT NULL,
  nr_regra integer,
  ds_regra varchar(500),
  fl_opcional en_booleano,
  dt_registro timestamp,
  CONSTRAINT "PK_Regra" PRIMARY KEY(id_regra)
);

COMMENT ON TABLE tb_regra IS 'Tabela para o cadastro das regras do jogo.';

CREATE TABLE tb_avaliacao(
  id_avaliacao integer NOT NULL,
  id_usuario integer NOT NULL,
  id_jogo integer NOT NULL,
  vl_avaliacao numeric,
  ds_avaliacao text,
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
  fl_valido en_booleano,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Jogo" PRIMARY KEY(id_grupo_jogo)
);

COMMENT ON TABLE tb_grupo_jogo IS
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE tb_grupo_usuario(
  id_grupo_usuario integer NOT NULL,
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  fl_valido en_booleano NOT NULL,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Usuario" PRIMARY KEY(id_grupo_usuario)
);

CREATE TABLE tb_atividade(
  id_atividade integer NOT NULL,
  id_usuario integer NOT NULL,
  id_tipo_atividade integer NOT NULL,
  nm_tabela_alterada text,
  ds_atividade text,
  dt_registro timestamp,
  CONSTRAINT "PK_Atividade" PRIMARY KEY(id_atividade)
);

CREATE TABLE tb_tipo_atividade(
  id_tipo_atividade integer NOT NULL,
  nm_grupo text,
  nm_subgrupo text,
  dt_registro timestamp,
  CONSTRAINT "PK_Tipo_Atividade" PRIMARY KEY(id_tipo_atividade)
);

CREATE TABLE tb_jogo_categoria(
  id_jogo_categoria integer NOT NULL,
  id_jogo integer NOT NULL,
  id_categoria integer NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Jogo_Categoria" PRIMARY KEY(id_jogo_categoria)
);

CREATE TABLE tb_erro(
  id_erro integer NOT NULL,
  nm_erro text,
  ds_erro text,
  dt_registro timestamp,
  CONSTRAINT "PK_Id_Erro" PRIMARY KEY(id_erro)
);

COMMENT ON TABLE tb_erro IS
  'Tabela para o cadastro das exceções geradas dentro da base de dados.';

CREATE TABLE tb_plano(
  id_plano integer NOT NULL,
  nm_plano text,
  ds_plano text,
  vl_plano numeric NOT NULL,
  fl_valido en_booleano NOT NULL,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Plano" PRIMARY KEY(id_plano),
  CONSTRAINT "UN_Nome_Plano" UNIQUE(nm_plano)
);

CREATE TABLE tb_plano_usuario(
  id_plano_usuario integer NOT NULL,
  id_usuario integer NOT NULL,
  id_plano integer NOT NULL,
  fl_valido en_booleano,
  dt_encerramento regoperator,
  dt_registro timestamp,
  CONSTRAINT "PK_Plano_Usario" PRIMARY KEY(id_plano_usuario)
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

ALTER TABLE tb_jogo
  ADD CONSTRAINT "FK_Jogo_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_jogo_categoria
  ADD CONSTRAINT "FK_Jogo_Categoria"
    FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria);

ALTER TABLE tb_jogo_categoria
  ADD CONSTRAINT "FK_Categoria_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo);

ALTER TABLE tb_plano_usuario
  ADD CONSTRAINT "FK_Plano_Usario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_plano_usuario
  ADD CONSTRAINT "FK_Usuario_Plano"
    FOREIGN KEY (id_plano) REFERENCES tb_plano (id_plano);

create or replace function fn_safe_cast_integer(texto text)
returns integer language plpgsql
as $$
    begin
        return texto::integer;
    exception when others then
        return null;
    end;
$$;

create or replace procedure sp_usuario_sem_grupo()
language plpgsql
as
$$
    DECLARE
        varCursor refcursor;
        varId integer;
        varQtd integer:= 1;
    BEGIN
        open varCursor for
            select
            u.id_usuario
            from tb_usuario u
            left join (select distinct id_usuario from tb_grupo_usuario where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_usuario_sem_grupo', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), varId, 1, 'sim',current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;

create or replace procedure sp_usuario_sem_plano()
language plpgsql
as
$$
    DECLARE
        varCursor refcursor;
        varId integer;
        varQtd integer:= 1;
    BEGIN
        open varCursor for
            select
            u.id_usuario
            from tb_usuario u
            left join (select distinct id_usuario from tb_plano_usuario where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_usuario_sem_plano', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_plano_usuario values(nextval('sq_plano_usuario'), varId, 1, 'sim', null, current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;

create or replace function fn_cadastro_usuario() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), new.id_usuario, 1, 'sim', null, current_timestamp);
        insert into tb_plano_usuario values(nextval('sq_plano_usuario'), new.id_usuario, 1, 'sim', null, current_timestamp);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_cadastro_usuario
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_usuario();
