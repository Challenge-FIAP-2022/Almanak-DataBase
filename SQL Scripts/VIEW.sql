-- Usuario KPI

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
u.dt_registro,
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

group by 1,2,3,4,5,6,7,8,9,10
order by 1,2;

-- Jogo KPI
-- fn_one_hot_tp_item()
-- fn_one_hot_categoria()

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