SET check_function_bodies = false;

CREATE TYPE en_bolleano AS ENUM('sim', 'nao');

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
  fl_idade en_bolleano,
  fl_valido en_bolleano,
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
  fl_necessario en_bolleano,
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
  fl_opcional en_bolleano,
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
  fl_valido en_bolleano,
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
  fl_valido en_bolleano NOT NULL,
  dt_encerramento timestamp,
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

create or replace function fn_safe_cast_integer(texto text)
returns integer language plpgsql
as $$
    begin
        return texto::integer;
    exception when others then
        return null;
    end;
$$;

create or replace procedure sp_grupo_inicial()
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
            left join (select id_usuario from tb_grupo_usuario where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_inicial', 'Nenhum valor a ser inserido.', current_timestamp);
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

create or replace procedure sp_grupo_jogo_inicial()
language plpgsql
as
$$
    DECLARE
        varCursorUpdate refcursor;
        varRecordUpdate record;
        varQtdUpdate integer:= 1;

        varCursorInsert refcursor;
        varIdInsert integer;
        varQtdInsert integer:= 1;
    BEGIN
        -- Update Jogos antigos
        open varCursorUpdate for
        	select * from tb_grupo_jogo where id_grupo = 1 and fl_valido = 'sim';

		fetch varCursorUpdate into varRecordUpdate;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_jogo', 'Nenhum valor a ser atualizado.', current_timestamp);
			raise notice 'Nenhum valor a ser atualizado.';
		else
			loop
				update tb_grupo_jogo set fl_valido = 'nao', dt_encerramento = current_timestamp where id_grupo_jogo = varRecordUpdate.id_grupo_jogo;
				fetch varCursorUpdate into varRecordUpdate;
				exit when not found;
				varQtdUpdate:= varQtdUpdate + 1;
			end loop;
			raise notice '% valores atualizados com sucesso.', TO_CHAR(varQtdUpdate, 'fm999G999');
		end if;

        close varCursorUpdate;

        -- Insert New Grupo
        open varCursorInsert for
			select

			j.id_jogo

			from tb_jogo j

			left join tb_atividade a
				on j.id_jogo = fn_safe_cast_integer(a.ds_atividade)

			left join tb_tipo_atividade ta
				on a.id_tipo_atividade = ta.id_tipo_atividade
				and ta.nm_grupo in ('Jogo', 'Busca')
				and ta.nm_subgrupo in ('Abertura tela do jogo', 'Busca por jogo')

			order by count(*) over (partition by nm_jogo) ,1

			limit 5;

		fetch varCursorInsert into varIdInsert;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_jogo', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_grupo_jogo values(nextval('sq_grupo_jogo'), 1, varIdInsert, 'sim', null, current_timestamp);
				fetch varCursorInsert into varIdInsert;
				exit when not found;
				varQtdInsert:= varQtdInsert + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtdInsert, 'fm999G999');
		end if;

        close varCursorInsert;

    END;
$$;

create or replace function fn_grupo_inical() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), new.id_usuario, 1, 'sim',current_timestamp);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_grupo_inicial
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_grupo_inical();
