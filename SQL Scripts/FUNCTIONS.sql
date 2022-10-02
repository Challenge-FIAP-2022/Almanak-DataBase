--===================================================================================================================
----------------------------------------------- FN Safe Cast Integer ------------------------------------------------
--===================================================================================================================

create or replace function fn_safe_cast_integer(texto text)
returns integer language plpgsql
as $$
    begin
        return texto::integer;
    exception when others then
        return null;
    end;
$$;

--===================================================================================================================
----------------------------------------------- FN Random Between ---------------------------------------------------
--===================================================================================================================

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

--===================================================================================================================
----------------------------------------------- FN_Nota_Jogo --------------------------------------------------------
--===================================================================================================================


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

--===================================================================================================================
----------------------------------------------- FN_Nota_Usuario -----------------------------------------------------
--===================================================================================================================

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

--===================================================================================================================
----------------------------------------------- FN_Jogos_Recomendados -----------------------------------------------
--===================================================================================================================

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

--===================================================================================================================
----------------------------------------------- FN_One_Hot_TP_Item --------------------------------------------------
--===================================================================================================================

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

--===================================================================================================================
----------------------------------------------- FN_One_Hot_Categoria ------------------------------------------------
--===================================================================================================================

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

--===================================================================================================================
----------------------------------------------- FN_Regra_Resposta ---------------------------------------------------
--===================================================================================================================

create or replace function fn_regra_resposta(varIdJogo integer, varDuvida text)
returns table (like tb_regra)
as $$
    begin
        return query

			with

			    duvida as (
			        select * from (select varDuvida as js_categoria) a
				),

			    intents as (
					select
					'intents' as tp_categoria,
					'intents' as tp_subcategoria,
					json_array_elements_text(js_categoria::json ->'intents') as ds_categoria
					from duvida
					where
						js_categoria not like '%intents":{}%'
				),

				entities as (
					select
					'entities' as tp_categoria,
					json_object_keys(js_categoria :: json -> 'entities') as tp_subcategoria,
					json_array_elements_text(
						js_categoria :: json
							-> 'entities'
								->json_object_keys(js_categoria :: json-> 'entities')
					) as ds_categoria
					from duvida
					where
						js_categoria not like '%entities":{}%'
				),

				base as (
					select * from intents
					union all
					(select * from entities where tp_subcategoria != 'sys-number')
				),

				vcr as (
					select
					*,
					count(*) over (partition by id_regra) as contador
					from vw_categoria_regra vcr
					left join base b
						on vcr.tp_categoria = b.tp_categoria
						and vcr.tp_subcategoria = b.tp_subcategoria
				),

				vcrTemp as (
					select distinct
					id_regra, contador, max(contador) over() as maximo
					from vcr
					order by 2 desc
				)

			select
			*
			from tb_regra
			where
			    id_jogo = varIdJogo
			  	and id_regra in (select id_regra from vcrTemp where contador = maximo);

    end;
$$language plpgsql;