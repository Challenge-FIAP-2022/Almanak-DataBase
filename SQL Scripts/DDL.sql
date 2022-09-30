SET check_function_bodies = false;

CREATE TYPE en_booleano AS ENUM('sim', 'nao');

CREATE TYPE en_tp_item AS ENUM
  ('bola',  'carta',  'bebida_alcoolica',  'bastao',  'quadra',  'papelaria', 'tabuleiro',  'dado',  'geral')
  ;

create sequence sq_usuario;

create sequence sq_avaliacao;

create sequence sq_jogo;

create sequence sq_item;

create sequence sq_regra;

create sequence sq_jogo_item;

create sequence sq_usuario_grupo;

create sequence sq_tipo_atividade;

create sequence sq_categoria;

create sequence sq_jogo_grupo;

create sequence sq_atividade;

create sequence sq_grupo;

create sequence sq_jogo_categoria;

create sequence sq_erro;

create sequence sq_plano;

create sequence sq_contrato;

create sequence sq_categoria_regra;

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
  lk_imagem text,
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
  lk_icone text,
  lk_imagem text,
  ds_categoria text,
  dt_registro timestamp,
  CONSTRAINT "PK_Categoria" PRIMARY KEY(id_categoria),
  CONSTRAINT "UN_Nome_Categoria" UNIQUE(nm_categoria)
);

COMMENT ON TABLE tb_categoria IS
  'Tabela para o cadastro das categorias que os jogos podem ter.';

CREATE TABLE tb_grupo(
  id_grupo integer NOT NULL,
  nm_grupo text NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo" PRIMARY KEY(id_grupo)
);

COMMENT ON TABLE tb_grupo IS
  'Tabela para o cadastro dos possiveis grupos que os usuarios poderao ser agrupados.'
  ;

CREATE TABLE tb_jogo_grupo(
  id_jogo_grupo integer NOT NULL,
  id_grupo integer NOT NULL,
  id_jogo integer NOT NULL,
  fl_valido en_booleano,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Jogo" PRIMARY KEY(id_jogo_grupo)
);

COMMENT ON TABLE tb_jogo_grupo IS
  'Tabela com o historico dos jogos recomendados para cada um dos grupos.';

CREATE TABLE tb_usuario_grupo(
  id_usuario_grupo integer NOT NULL,
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  fl_valido en_booleano NOT NULL,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Usuario" PRIMARY KEY(id_usuario_grupo)
);

COMMENT ON TABLE tb_usuario_grupo IS
  'Tabela para agrupamento dos usuario, para que se possa recomendar jogos a esses grupos.'
  ;

CREATE TABLE tb_atividade(
  id_atividade integer NOT NULL,
  id_usuario integer NOT NULL,
  id_tipo_atividade integer NOT NULL,
  nm_tabela_alterada text,
  ds_atividade text,
  dt_registro timestamp,
  CONSTRAINT "PK_Atividade" PRIMARY KEY(id_atividade)
);

COMMENT ON TABLE tb_atividade IS
  'Tabela para o registro das atividades executados por um usuario.';

CREATE TABLE tb_tipo_atividade(
  id_tipo_atividade integer NOT NULL,
  nm_grupo text,
  nm_subgrupo text,
  dt_registro timestamp,
  CONSTRAINT "PK_Tipo_Atividade" PRIMARY KEY(id_tipo_atividade)
);

COMMENT ON TABLE tb_tipo_atividade IS
  'Tabela para o cadastro dos tipos de atividade que o usuario pode executar no app, como logar, entrar no app, buscar um jogo, etc...'
  ;

CREATE TABLE tb_jogo_categoria(
  id_jogo_categoria integer NOT NULL,
  id_jogo integer NOT NULL,
  id_categoria integer NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Jogo_Categoria" PRIMARY KEY(id_jogo_categoria)
);

COMMENT ON TABLE tb_jogo_categoria IS
  'Tabela para o relacionamento de jogos com suas respectivas categortias.';

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

COMMENT ON TABLE tb_plano IS
  'Tabela para o cadastro dos planos que os usuarios poderao contratar.';

CREATE TABLE tb_contrato(
  id_contrato integer NOT NULL,
  id_usuario integer NOT NULL,
  id_plano integer NOT NULL,
  fl_valido en_booleano,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Plano_Usario" PRIMARY KEY(id_contrato)
);

COMMENT ON TABLE tb_contrato IS
  'Tabela para o cadastro do historico de planos contratados pelos usuarios.';

CREATE TABLE tb_categoria_regra(
  id_categoria_regra integer NOT NULL,
  id_regra integer NOT NULL,
  js_categoria text,
  dt_registro date,
  CONSTRAINT "Primary key" PRIMARY KEY(id_categoria_regra)
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

ALTER TABLE tb_jogo_grupo
  ADD CONSTRAINT "FK_Grupo_Jogo"
    FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo);

ALTER TABLE tb_jogo_grupo
  ADD CONSTRAINT "FK_Jogo_Grupo"
    FOREIGN KEY (id_grupo) REFERENCES tb_grupo (id_grupo);

ALTER TABLE tb_usuario_grupo
  ADD CONSTRAINT "FK_Grupo_Usuario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_usuario_grupo
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

ALTER TABLE tb_contrato
  ADD CONSTRAINT "FK_Plano_Usario"
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario (id_usuario);

ALTER TABLE tb_contrato
  ADD CONSTRAINT "FK_Usuario_Plano"
    FOREIGN KEY (id_plano) REFERENCES tb_plano (id_plano);

ALTER TABLE tb_categoria_regra
  ADD CONSTRAINT "FK_Categoria_Regra"
    FOREIGN KEY (id_regra) REFERENCES tb_regra (id_regra);

create or replace function fn_safe_cast_integer(texto text)
returns integer language plpgsql
as $$
    begin
        return texto::integer;
    exception when others then
        return null;
    end;
$$;

create or replace function fn_nota_usuario(nomeUsuario text, dataref date)
returns numeric(6,4) language plpgsql
as $$
    declare
        varResult numeric(6,4);

    begin

		with avaliacaoTemp as (
			select
			ta.vl_avaliacao as valor,

			cast(date(ta.dt_registro) - min(date(ta.dt_registro)) over () + 1 as decimal) /
			cast(max(date(ta.dt_registro)) over () - min(date(ta.dt_registro)) over () + 1 as decimal)
			as peso

			from tb_avaliacao ta
			left join tb_usuario tu on ta.id_usuario = tu.id_usuario
			where
				lower(tu.nm_usuario) = lower(nomeUsuario)
				and ta.dt_registro <= dataref
		),

		avaliacao as (
		    select
		    valor, peso, sum(peso) over () as pesoTotal
		    from avaliacaoTemp
		)

		select
		sum(valor * peso/ pesoTotal)  into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_usuario(id integer, dataref date)
returns numeric(6,4) language plpgsql
as $$
    declare
        varResult numeric(6,4);

    begin

		with avaliacaoTemp as (
			select
			ta.vl_avaliacao as valor,

			cast(date(ta.dt_registro) - min(date(ta.dt_registro)) over () + 1 as decimal) /
			cast(max(date(ta.dt_registro)) over () - min(date(ta.dt_registro)) over () + 1 as decimal)
			as peso

			from tb_avaliacao ta
			where
				ta.id_usuario = id
				and ta.dt_registro <= dataref
		),

		avaliacao as (
		    select
		    valor, peso, sum(peso) over () as pesoTotal
		    from avaliacaoTemp
		)

		select
		sum(valor * peso/ pesoTotal)  into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_jogo(nomeJogo text, dataref date)
returns numeric(6,4) language plpgsql
as $$
    declare
        varResult numeric(6,4);

    begin

		with avaliacaoTemp as (
			select
			ta.vl_avaliacao as valor,

			cast(date(ta.dt_registro) - min(date(ta.dt_registro)) over () + 1 as decimal) /
			cast(max(date(ta.dt_registro)) over () - min(date(ta.dt_registro)) over () + 1 as decimal)
			as peso

			from tb_avaliacao ta
			left join tb_jogo tj on ta.id_jogo = tj.id_jogo
			where
				lower(tj.nm_jogo) = lower(nomeJogo)
				and ta.dt_registro <= dataref
		),

		avaliacao as (
		    select
		    valor, peso, sum(peso) over () as pesoTotal
		    from avaliacaoTemp
		)

		select
		sum(valor * peso/ pesoTotal)  into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_jogo(id integer, dataref date)
returns numeric(6,4) language plpgsql
as $$
    declare
        varResult numeric(6,4);

    begin

		with avaliacaoTemp as (
			select
			ta.vl_avaliacao as valor,

			cast(date(ta.dt_registro) - min(date(ta.dt_registro)) over () + 1 as decimal) /
			cast(max(date(ta.dt_registro)) over () - min(date(ta.dt_registro)) over () + 1 as decimal)
			as peso

			from tb_avaliacao ta
			where
				ta.id_jogo = id
				and ta.dt_registro <= dataref
		),

		avaliacao as (
		    select
		    valor, peso, sum(peso) over () as pesoTotal
		    from avaliacaoTemp
		)

		select
		sum(valor * peso/ pesoTotal)  into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_jogo(idJogo integer, idGrupo integer, dataref date)
returns numeric(6,4) language plpgsql
as $$
    declare
        varResult numeric(6,4);

    begin

		with avaliacaoTemp as (
			select
			ta.vl_avaliacao as valor,

			cast(date(ta.dt_registro) - min(date(ta.dt_registro)) over () + 1 as decimal) /
			cast(max(date(ta.dt_registro)) over () - min(date(ta.dt_registro)) over () + 1 as decimal)
			as peso

			from tb_avaliacao ta
			left join tb_jogo tj on ta.id_jogo = tj.id_jogo
			left join tb_usuario tu on ta.id_usuario = tu.id_usuario
			left join (select id_usuario, id_grupo from tb_usuario_grupo where fl_valido = 'sim') tug on tu.id_usuario = tug.id_usuario

			where
				ta.id_jogo = idJogo
				and ta.dt_registro <= dataref
				and tug.id_grupo = idGrupo
		),

		avaliacao as (
		    select
		    valor, peso, sum(peso) over () as pesoTotal
		    from avaliacaoTemp
		)

		select
		sum(valor * peso/ pesoTotal)  into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_random_between(floor numeric, ceil numeric)
returns integer language plpgsql
as
$$
    begin
        return floor(random()*(ceil-floor+1))+floor;
    exception when others then
        return null;
    end;
$$;

create or replace function fn_jogos_recomendados(id integer)
  returns table (like tb_jogo)
AS
$$
	BEGIN
		return query
		    select
			j.*
			from tb_jogo_grupo jg
			left join tb_jogo j
				on jg.id_jogo = j.id_jogo
			left join tb_grupo g
				on jg.id_grupo = g.id_grupo
			left join tb_usuario_grupo ug
				on g.id_grupo = ug.id_grupo
			where
				jg.fl_valido = 'sim'
				and ug.fl_valido = 'sim'
				and ug.id_usuario = id
			order by 1 desc,2;
	END;
$$language plpgsql;

create or replace function fn_one_hot_tp_item()
returns text language plpgsql
as $$
    declare
        resultado text;
    begin

		with

			tpItem as (
				select distinct
				tp_item
				from tb_item
			)
		select

		string_agg(concat(
			'case when string_agg(distinct i.tp_item::text, ',
		    quote_literal(','),
		    ') like ',
			quote_literal(concat('%', tp_item::text, '%')),
			' then 1 else 0 end as oh_',
			lower(replace(tp_item::text,' ','_'))
		), ', ') into resultado

		from tpItem;

		return resultado;

    end;
$$;

create or replace function fn_one_hot_categoria()
returns text language plpgsql
as $$
    declare
        resultado text;
    begin
		with

			categoria as (
				select distinct
				nm_categoria
				from tb_categoria
			)
		select

		string_agg(concat(
			'case when string_agg(distinct nm_categoria, ',
		    quote_literal(','),
		    ') like ',
			quote_literal(concat('%', nm_categoria::text, '%')),
			' then 1 else 0 end as oh_',
			lower(replace(nm_categoria::text,' ','_'))
		), ', ') into resultado

		from categoria;

		return resultado;

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
            left join (select distinct id_usuario from tb_usuario_grupo where fl_valido = 'sim') gu
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
				insert into tb_usuario_grupo values(nextval('sq_usuario_grupo'), varId, 1, 'sim', null, current_timestamp);
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
            left join (select distinct id_usuario from tb_contrato where fl_valido = 'sim') gu
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
				insert into tb_contrato values(nextval('sq_contrato'), varId, 1, 'sim', null, current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;

create or replace procedure sp_preencher_avaliacao(nr_loops integer)
language plpgsql
as
$$
    DECLARE
        varIdUsuario integer;
        varQtdUsuario integer;
        varArrUsuario integer array;
        varDtRegistro timestamp;

        varIdJogo integer;
        varQtdjogo integer;
        varArrjogo integer array;

        vl_nota numeric;

    BEGIN

        select count(*),array_agg(id_usuario) into varQtdUsuario, varArrUsuario from tb_usuario;
        select count(*),array_agg(id_jogo) into varQtdjogo, varArrjogo from tb_jogo;

        for i in 1..nr_loops loop

            vl_nota:= random();
			if vl_nota >= 0.5 then
				vl_nota:= 0;
			else
				vl_nota:= 0.5;
			end if;
            vl_nota:= fn_random_between(2,5) + vl_nota;

            if vl_nota > 5 then vl_nota:= 5; end if;

            varIdUsuario = varArrUsuario[fn_random_between(1,varQtdUsuario)];
            varIdJogo = varArrjogo[fn_random_between(1,varQtdjogo)];

            select dt_registro into varDtRegistro from tb_usuario where id_usuario = varIdUsuario;
            varDtRegistro:= varDtRegistro + random() * (current_timestamp - varDtRegistro);

            insert into tb_avaliacao values (nextval('sq_avaliacao'), varIdUsuario, varIdJogo, vl_nota, null, varDtRegistro);

		end loop;

    END;
$$;

create or replace procedure sp_recomendar_jogo()
language plpgsql
as
$$
    DECLARE
        varCursorJogo refcursor;
        varCursorGrupo refcursor;
        varRecordJogo record;
        varRecordGrupo record;
        varQtd integer:= 0;
    BEGIN

        -- Grupo Inicial

        open varCursorJogo for
			select
			id_jogo,
			fn_nota_jogo(id_jogo,current_date)
			from tb_jogo
			order by 2 desc,1
			limit 5
        ;

		loop
			fetch varCursorJogo into varRecordJogo;
			exit when not found;
			insert into tb_jogo_grupo values(nextval('sq_jogo_grupo'), 1, varRecordJogo.id_jogo , 'sim', null, current_timestamp);
			varQtd := varQtd + 1;
		end loop;

        close varCursorJogo;

        --Demais Grupos

        open varCursorGrupo for
			select distinct
			id_grupo
			from tb_usuario_grupo
			where
				id_grupo != 1
				and fl_valido = 'sim'
			order by 1
        ;

        loop
			fetch varCursorGrupo into varRecordGrupo;
			exit when not found;

			open varCursorJogo for
				select
				id_jogo,
				fn_nota_jogo(id_jogo, varRecordGrupo.id_grupo, current_date)
				from tb_jogo
				order by 2 desc,1
				limit 5
			;

			loop
				fetch varCursorJogo into varRecordJogo;
				exit when not found;
				insert into tb_jogo_grupo values(nextval('sq_jogo_grupo'), varRecordGrupo.id_grupo , varRecordJogo.id_jogo , 'sim', null, current_timestamp);
				varQtd := varQtd + 1;
			end loop;

			close varCursorJogo;

		end loop;

		raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
        close varCursorGrupo;

    END;
$$;

create or replace function fn_cadastro_usuario() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_usuario_grupo values(nextval('sq_usuario_grupo'), new.id_usuario, 1, 'sim', null, new.dt_registro);
        insert into tb_contrato values(nextval('sq_contrato'), new.id_usuario, 1, 'sim', null ,new.dt_registro);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_cadastro_usuario
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_usuario();

create or replace function fn_cadastro_contrato() returns trigger as
$tb_contrato$
    DECLARE
        varCursor refcursor;
        varRecord record;
        varQtd Integer;

    BEGIN
        select count(*) into varQtd from tb_contrato where id_usuario = new.id_usuario;
        if varQtd = 0 then
            return new;

        else
            select count(*) into varQtd from tb_contrato where id_usuario = new.id_usuario and fl_valido = 'sim';

            if varQtd = 0 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_contrato', concat('Usuario ', new.id_usuario, ' sem um contrato valido.'), current_timestamp);
			    raise notice 'TG_Cadastro_Contrato: Usuario % sem um contrato valido.', new.id_usuario;
                return new;

            elsif varQtd > 1 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_contrato', concat('Usuario ', new.id_usuario, ' com mais de um contrato valido.'), current_timestamp);
			    raise notice 'TG_Cadastro_Contrato: Usuario % com mais de um contrato valido.', new.id_usuario;

            end if;

                open varCursor for
                    select * from tb_contrato where id_usuario = new.id_usuario and fl_valido = 'sim'
                ;

                loop
                    fetch varCursor into varRecord;
                    exit when not found;
                    update tb_contrato set dt_encerramento = current_timestamp, fl_valido = 'nao' where id_contrato = varRecord.id_contrato;
			    end loop;
                return new;
        end if;
    END;
$tb_contrato$ language plpgsql;

create or replace trigger tg_cadastro_contrato
    before insert on tb_contrato
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_contrato();

create or replace function fn_agrupar_usuario() returns trigger as
$tb_usuario_grupo$
    DECLARE

        varCursor refcursor;
        varRecord record;
        varQtd Integer;

    BEGIN
        select count(*) into varQtd from tb_usuario_grupo where id_usuario = new.id_usuario;
        if varQtd = 0 then
            return new;

        else
            select count(*) into varQtd from tb_usuario_grupo where id_usuario = new.id_usuario and fl_valido = 'sim';

            if varQtd = 0 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_usuario_grupo', concat('Usuario ', new.id_usuario, ' sem um grupo valido.'), current_timestamp);
			    raise notice 'TG_Classificacao_Grupo: Usuario % sem um contrato valido.', new.id_usuario;
                return new;

            elsif varQtd > 1 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_usuario_grupo', concat('Usuario ', new.id_usuario, ' com mais de um grupo valido.'), current_timestamp);
			    raise notice 'TG_Classificacao_Grupo: Usuario % com mais de um contrato valido.', new.id_usuario;

            end if;

                open varCursor for
                    select * from tb_usuario_grupo where id_usuario = new.id_usuario and fl_valido = 'sim'
                ;

                loop
                    fetch varCursor into varRecord;
                    exit when not found;
                    update tb_usuario_grupo set dt_encerramento = current_timestamp, fl_valido = 'nao' where id_usuario_grupo = varRecord.id_usuario_grupo;
			    end loop;
                return new;
        end if;
    END;
$tb_usuario_grupo$ language plpgsql;

create or replace trigger tg_agrupar_usuario
    before insert on tb_usuario_grupo
    FOR EACH ROW EXECUTE FUNCTION fn_agrupar_usuario();

create or replace function fn_cadastro_jogo_grupo() returns trigger as
$tb_jogo_grupo$
    DECLARE
        varCursor refcursor;
        varRecord record;
        varQtd Integer;
        varQtdDesejada Integer := 5;

    BEGIN
        select count(*) into varQtd from tb_jogo_grupo where id_grupo = new.id_grupo;
        if varQtd < varQtdDesejada then
            return new;

        else
            select count(*) into varQtd from tb_jogo_grupo where id_grupo = new.id_grupo and fl_valido = 'sim';

            if varQtd = 0 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_jogo_grupo', concat('Grupo ', new.id_grupo, ' sem jogos recomendados validos.'), current_timestamp);
			    raise notice 'TG_Cadastro_JOGO_GRUPO: Grupo % sem jogos recomendados validos.', new.id_grupo;
                return new;

            elsif varQtd < varQtdDesejada then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_jogo_grupo', concat('Grupo ', new.id_grupo, ' com menos de ', varQtdDesejada ,' jogos recomendados validos.'), current_timestamp);
			    raise notice 'TG_Cadastro_JOGO_GRUPO: Grupo % com menos de % jogos recomendados validos.', new.id_grupo, varQtdDesejada;
                return new;

            elsif varQtd > varQtdDesejada then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_jogo_grupo', concat('Grupo ', new.id_grupo, ' com mais de ', varQtdDesejada ,'jogos recomendados validos.'), current_timestamp);
			    raise notice 'TG_Cadastro_JOGO_GRUPO: Grupo % com mais de % jogos recomendados validos.', new.id_grupo, varQtdDesejada;

            end if;

			open varCursor for
				select * from tb_jogo_grupo where id_grupo = new.id_grupo and fl_valido = 'sim' order by dt_registro limit (varQtd - 4)
			;

			loop
				fetch varCursor into varRecord;
				exit when not found;
				update tb_jogo_grupo set dt_encerramento = current_timestamp, fl_valido = 'nao' where id_jogo_grupo = varRecord.id_jogo_grupo;
			end loop;
			return new;
        end if;
    END;
$tb_jogo_grupo$ language plpgsql;

create or replace trigger tg_cadastro_jogo_grupo
    before insert on tb_jogo_grupo
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_jogo_grupo();

create materialized view vw_usuario_kpi as

with

    DatasArray as (
		select
			date(dt_array) as dt_array
		from generate_series('2022-01-01', current_date, '1 day':: interval) as dt_array
	),

	usuario as (
		select
		id_usuario,
		nm_usuario,
		dt_nascimento as dt_nascimento,
		date(dt_registro) as dt_registro
		from tb_usuario
	),

	contrato as (
		select
		tc.id_usuario,
		tp.id_plano,
		tp.nm_plano,
		tp.vl_plano,
		date(tc.dt_registro) as dt_registro,
		coalesce(tp.dt_encerramento :: date, '2500-01-01'::date) as dt_encerramento
		from tb_contrato tc
		left join tb_plano tp on tc.id_plano = tp.id_plano
	),

	jogo as (
		select
		id_usuario,
		id_jogo,
		date(dt_registro) as dt_registro
		from tb_jogo
	),

	avaliacao as (
		select
		id_usuario,
		id_avaliacao,
		vl_avaliacao,
		date(dt_registro) as dt_registro
		from tb_avaliacao
	),

	atividade as (
		select
		ta.id_usuario,
		ta.id_atividade,
		tta.nm_grupo,
		tta.nm_subgrupo,
		date(ta.dt_registro) as dt_registro
		from tb_atividade ta
		left join tb_tipo_atividade tta
			on ta.id_tipo_atividade = tta.id_tipo_atividade
	)

select

-- Datas
d.dt_array as dt_referencia,

-- Usuario
u.id_usuario,
u.nm_usuario,
extract(year from age(d.dt_array, u.dt_nascimento)) as vl_idade,
d.dt_array - u.dt_registro as vl_dias_registrado,

-- Plano
c.id_plano,
c.nm_plano,
c.vl_plano,
d.dt_array - c.dt_registro as vl_dias_no_plano,

-- Jogo
count(distinct j.id_jogo) filter (where j.dt_registro = d.dt_array) as qt_jogo_criado,
count(distinct j.id_jogo) as qt_hist_jogo_criado,

-- Avaliação
count(distinct a.id_avaliacao) filter (where a.dt_registro = d.dt_array) as qt_avaliacao,
count(distinct a.id_avaliacao) as qt_hist_avaliacao,
avg(a.vl_avaliacao) filter (where a.dt_registro = d.dt_array) as vl_nota,
fn_nota_usuario(u.id_usuario, d.dt_array) as vl_hist_nota,

-- Atividade

count(distinct ac.id_atividade) filter (where ac.dt_registro = d.dt_array) as qt_atividade,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'login' and ac.dt_registro = d.dt_array) as qt_atividade_login,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'cadastro' and ac.dt_registro = d.dt_array) as qt_atividade_cadastro,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'jogo' and ac.dt_registro = d.dt_array) as qt_atividade_jogo,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) in ('busca', 'filtro') and ac.dt_registro = d.dt_array) as qt_atividade_busca,

count(distinct ac.id_atividade) as qt_hist_atividade,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'login') as qt_hist_atividade_login,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'cadastro') as qt_hist_atividade_cadastro,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) = 'jogo') as qt_hist_atividade_jogo,
count(distinct ac.id_atividade) filter (where lower(ac.nm_grupo) in ('busca', 'filtro')) as qt_hist_atividade_busca,

-- Geral
current_timestamp as dt_updated

from DatasArray d

left join usuario u
	on d.dt_array >= u.dt_registro

left join contrato c
	on u.id_usuario = c.id_usuario
	and d.dt_array >= c.dt_registro
	and d.dt_array < c.dt_encerramento

left join jogo j
	on u.id_usuario = j.id_usuario
	and d.dt_array >= j.dt_registro

left join avaliacao a
	on u.id_usuario = a.id_usuario
	and d.dt_array >= a.dt_registro

left join atividade ac
	on u.id_usuario = ac.id_usuario
	and d.dt_array >= ac.dt_registro

where
    u.id_usuario is not null

group by 1,2,3,4,5,6,7,8,9
order by 1,2;

create materialized view vw_jogo_kpi as

with

	DatasArray as (
		select
			date(dt_array) as dt_array
		from generate_series('2022-01-01', current_date, '1 day':: interval) as dt_array
	),

	jogo as (
		select
		id_jogo,
		nm_jogo,
		nr_min_jogadores,
		nr_max_jogadores,
		case when fl_idade = 'sim' then 1 else 0 end as fl_idade,
		date(dt_registro) as dt_registro,
		coalesce(dt_encerramento :: date, '2500-01-01'::date) as dt_encerramento
		from tb_jogo
	),

	item as (
		select
		tji.id_jogo,
		ti.tp_item,
		date(tji.dt_registro) as dt_registro
		from tb_jogo_item tji
		left join tb_item ti
			on tji.id_item = ti.id_item
	),

	categoria as (
		select
		tjc.id_jogo,
		tc.nm_categoria,
		date(tjc.dt_registro) as dt_registro
		from tb_jogo_categoria tjc
		left join tb_categoria tc
			on tjc.id_categoria = tc.id_categoria

	),

	avaliacao as (
		select
		id_jogo,
		id_avaliacao,
		vl_avaliacao,
		date(dt_registro) as dt_registro
		from tb_avaliacao
	)

select

-- Datas
d.dt_array as dt_referencia,

-- Jogo
j.id_jogo,
j.nm_jogo,
j.nr_min_jogadores,
j.nr_max_jogadores,
j.fl_idade,

-- Item

case when string_agg(distinct i.tp_item::text,',') like '%bola%' then 1 else 0 end as oh_bola,
case when string_agg(distinct i.tp_item::text,',') like '%carta%' then 1 else 0 end as oh_carta,
case when string_agg(distinct i.tp_item::text,',') like '%bebida_alcoolica%' then 1 else 0 end as oh_bebida_alcoolica,
case when string_agg(distinct i.tp_item::text,',') like '%bastao%' then 1 else 0 end as oh_bastao,
case when string_agg(distinct i.tp_item::text,',') like '%quadra%' then 1 else 0 end as oh_quadra,
case when string_agg(distinct i.tp_item::text,',') like '%papelaria%' then 1 else 0 end as oh_papelaria,
case when string_agg(distinct i.tp_item::text,',') like '%tabuleiro%' then 1 else 0 end as oh_tabuleiro,
case when string_agg(distinct i.tp_item::text,',') like '%dado%' then 1 else 0 end as oh_dado,
case when string_agg(distinct i.tp_item::text,',') like '%geral%' then 1 else 0 end as oh_geral,

-- Categoria

case when string_agg(distinct nm_categoria,',') like '%Ao ar livre%' then 1 else 0 end as oh_ar_livre,
case when string_agg(distinct nm_categoria,',') like '%Diversos%' then 1 else 0 end as oh_diversos,
case when string_agg(distinct nm_categoria,',') like '%Esporte%' then 1 else 0 end as oh_esporte,
case when string_agg(distinct nm_categoria,',') like '%Jogos de azar%' then 1 else 0 end as oh_jogos_de_azar,
case when string_agg(distinct nm_categoria,',') like '%Jogos de cartas%' then 1 else 0 end as oh_jogos_de_cartas,
case when string_agg(distinct nm_categoria,',') like '%Jogos de tabuleiro%' then 1 else 0 end as oh_jogos_de_tabuleiro,
case when string_agg(distinct nm_categoria,',') like '%Jogos para Adultos%' then 1 else 0 end as oh_jogos_para_adultos,
case when string_agg(distinct nm_categoria,',') like '%Jogos para crianças%' then 1 else 0 end as oh_jogos_para_crianças,

-- Avaliação
count(distinct a.id_avaliacao) filter (where a.dt_registro = d.dt_array) as qt_avaliacao,
count(distinct a.id_avaliacao) as qt_hist_avaliacao,
avg(a.vl_avaliacao) filter (where a.dt_registro = d.dt_array) as vl_nota,
fn_nota_jogo(j.id_jogo, d.dt_array) as vl_hist_nota

from DatasArray d

left join jogo j
	on d.dt_array >= j.dt_registro
	and d.dt_array < j.dt_encerramento

left join item i
	on j.id_jogo = i.id_jogo
	and d.dt_array >= i.dt_registro

left join categoria c
	on j.id_jogo = c.id_jogo
	and d.dt_array >= c.dt_registro

left join avaliacao a
	on j.id_jogo = a.id_jogo
	and d.dt_array >= a.dt_registro

where
	j.id_jogo is not null

group by 1,2,3,4,5,6
order by 1,2;

commit;
