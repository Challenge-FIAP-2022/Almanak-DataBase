-- FN_Safe_Cast_Integer

create or replace function fn_safe_cast_integer(texto text)
returns integer language plpgsql
as $$
    begin
        return texto::integer;
    exception when others then
        return null;
    end;
$$;

-- FN_Nota_Jogo

create or replace function fn_nota_jogo(nomeJogo text, dataref date)
returns numeric language plpgsql
as $$
    declare
        varResult numeric;

    begin

		with avaliacao as (
			select
				ta.vl_avaliacao as valor,
				ta.dt_registro,
				min(ta.dt_registro) over w1 as min_date,
				max(ta.dt_registro) over w1 as max_date,
				count(*) over w1 as qtd
				from tb_avaliacao ta
				left join tb_jogo tj on ta.id_jogo = tj.id_jogo
				where
					lower(tj.nm_jogo) = lower(nomeJogo)
					and ta.dt_registro <= dataref
				window
					w1 as (partition by tj.id_jogo)
		)

		select
		sum(
			valor *
			(date(dt_registro) - date(min_date) + 1)/
			(date(dt_registro) - date(max_date) + 1)
		) into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_jogo(id integer, dataref date)
returns numeric language plpgsql
as $$
    declare
        varResult numeric;

    begin

		with avaliacao as (
			select
				ta.vl_avaliacao as valor,
				ta.dt_registro,
				min(ta.dt_registro) over w1 as min_date,
				max(ta.dt_registro) over w1 as max_date,
				count(*) over w1 as qtd
				from tb_avaliacao ta
				left join tb_jogo tj on ta.id_jogo = tj.id_jogo
				where
					tj.id_jogo = id
					and ta.dt_registro <= dataref
				window
					w1 as (partition by tj.id_jogo)
		)

		select
		sum(
			valor *
			(date(dt_registro) - date(min_date) + 1)/
			(date(dt_registro) - date(max_date) + 1)
		) into varResult
		from avaliacao;

		return varResult;

    end;
$$;

-- FN_Avalicao_Por_Usuario

create or replace function fn_nota_usuario(id integer, dataref date)
returns numeric language plpgsql
as $$
    declare
        varResult numeric;

    begin

		with avaliacao as (
			select
				ta.vl_avaliacao as valor,
				ta.dt_registro,
				min(ta.dt_registro) over w1 as min_date,
				max(ta.dt_registro) over w1 as max_date,
				count(*) over w1 as qtd
				from tb_avaliacao ta
				left join tb_usuario tu on ta.id_usuario = tu.id_usuario
				where
					tu.id_usuario = id
					and ta.dt_registro <= dataref
				window
					w1 as (partition by tu.id_usuario)
		)

		select
		sum(
			valor *
			(date(dt_registro) - date(min_date) + 1)/
			(date(dt_registro) - date(max_date) + 1)
		) into varResult
		from avaliacao;

		return varResult;

    end;
$$;

create or replace function fn_nota_usuario(id integer, dataref date)
returns numeric language plpgsql
as $$
    declare
        varResult numeric;

    begin

		with avaliacao as (
			select
				ta.vl_avaliacao as valor,
				ta.dt_registro,
				min(ta.dt_registro) over w1 as min_date,
				max(ta.dt_registro) over w1 as max_date,
				count(*) over w1 as qtd
				from tb_avaliacao ta
				left join tb_usuario tu on ta.id_usuario = tu.id_usuario
				where
					tu.id_usuario = id
					and ta.dt_registro <= dataref
				window
					w1 as (partition by tu.id_usuario)
		)

		select
		sum(
			valor *
			(date(dt_registro) - date(min_date) + 1)/
			(date(dt_registro) - date(max_date) + 1)
		) into varResult
		from avaliacao;

		return varResult;

    end;
$$;