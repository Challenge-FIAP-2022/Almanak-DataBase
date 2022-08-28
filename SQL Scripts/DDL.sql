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

CREATE TABLE tb_grupo(
  id_grupo integer NOT NULL,
  nm_grupo text NOT NULL,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo" PRIMARY KEY(id_grupo)
);

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
  'Tebela relacionamento entre o item e o jogo que utilizara esse item.';

CREATE TABLE tb_usuario_grupo(
  id_usuario_grupo integer NOT NULL,
  id_usuario integer NOT NULL,
  id_grupo integer NOT NULL,
  fl_valido en_booleano NOT NULL,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Grupo_Usuario" PRIMARY KEY(id_usuario_grupo)
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

CREATE TABLE tb_contrato(
  id_contrato integer NOT NULL,
  id_usuario integer NOT NULL,
  id_plano integer NOT NULL,
  fl_valido en_booleano,
  dt_encerramento timestamp,
  dt_registro timestamp,
  CONSTRAINT "PK_Plano_Usario" PRIMARY KEY(id_contrato)
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

create or replace view vw_usuario_kpi as

with DatasArray as (
    select
        date(dt_array) as dt_array
    from generate_series('2022-01-01', current_date, '1 day':: interval) as dt_array
),

usuario as (
    select
    id_usuario,
    nm_usuario,
    date(dt_registro) as dt_registro,
    dt_nascimento,
    min(date(dt_registro)) over() as min_data,
    row_number() over (partition by id_usuario order by dt_registro desc) as nr_linha
    from tb_usuario
    qualify

),

contrato as (
    select
    tpu.id_usuario,
    tp.id_plano,
    tp.nm_plano,
    tp.vl_plano,
    date(tpu.dt_registro) as dt_registro,
    coalesce(tp.dt_encerramento :: date, '2500-01-01') as dt_encerramento,
    case
		when tp.nm_plano != 'Gamer' then date(tpu.dt_registro) - lag(date(tpu.dt_registro)) over w1
		else 0
	end as nr_dias_upgrade_plano,
    row_number() over (partition by tpu.id_usuario order by tpu.dt_registro desc) as nr_linha
    from tb_contrato tpu
    left join tb_plano tp on tpu.id_plano = tp.id_plano
    window
    	w1 as (partition by tpu.id_usuario order by tpu.dt_registro rows between unbounded preceding and current row)
),

avaliacaoTemp as (
    select distinct
    id_avaliacao,
	id_usuario,
	date(dt_registro) as dt_registro,
	vl_avaliacao,
	min(date(ta.dt_registro)) over w1 as min_date,
	max(date(ta.dt_registro)) over w1 as max_date,
	row_number() over (partition by id_usuario order by dt_registro desc) as nr_linha
	from tb_avaliacao ta
	window
		w1 as (partition by ta.id_usuario order by ta.dt_registro rows between unbounded preceding and current row)
),

avaliacao as (
	select
	dta.dt_array as dt_ref,
	a.id_usuario,
	a.dt_registro,
	sum(case when a.dt_registro = dta.dt_array then 1 else 0 end) over w1 as qtd,
	sum(a.vl_avaliacao * (date(a.dt_registro) - min_date +1) / (date(a.dt_registro) - max_date +1)) as vl_avaliacao_media
	from avaliacaoTemp a
	left join DatasArray dta
		on a.dt_registro <= dta.dt_array
	where
	    a.nr_linha = 1
	group by 1,2,3
	window
		w1 as (partition by a.id_usuario order by a.dt_registro rows between unbounded preceding and current row)
)

select

dta.dt_array as dt_ref,

u.id_usuario,
u.nm_usuario,
case
    when extract(year from current_timestamp - u.dt_nascimento) > 18 then 'sim'
    else 'nao'
end as fl_maiorirdade,
u.dt_registro as dt_registro,
coalesce(current_date - u.dt_registro, 0) as nr_dias_registrado,

c.id_plano,
c.nm_plano as nm_current_plano,
c.nr_dias_upgrade_plano,

coalesce(a.qtd, 0) as nr_avaliacoes,
coalesce(a.vl_avaliacao_media, 0)

from usuario u

left join DatasArray dta
    on u.min_data <= dta.dt_array

left join contrato c
    on u.id_usuario = c.id_usuario
	and dta.dt_array >= c.dt_registro
	and dta.dt_array < c.dt_encerramento

left join avaliacao a
	on u.id_usuario = a.id_usuario
	and dta.dt_array = a.dt_ref

where
    u.nr_linha = 1
	and c.nr_linha = 1

order by 1,2;

commit;
