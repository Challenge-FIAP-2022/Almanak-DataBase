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

-- FN_Random_Between

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

-- FN_Nota_Jogo

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

-- FN_Nota_Usuario

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

-- FN_Jogos_Recomendados;

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
				and ug.id_usuario = id
			order by 1 desc,2;
	END;
$$language plpgsql;
