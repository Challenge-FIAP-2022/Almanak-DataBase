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
    min(date(dt_registro)) over() as min_data
    from tb_usuario
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
	end as nr_dias_upgrade_plano
    from tb_contrato tpu
    left join tb_plano tp on tpu.id_plano = tp.id_plano
    window
    	w1 as (partition by tpu.id_usuario order by tpu.dt_registro rows between unbounded preceding and current row)
),

avaliacaoTemp as (
    select
    id_avaliacao,
	id_usuario,
	date(dt_registro) as dt_registro,
	vl_avaliacao,
	min(date(ta.dt_registro)) over w1 as min_date,
	max(date(ta.dt_registro)) over w1 as max_date
	from tb_avaliacao ta
	window
		w1 as (partition by ta.id_usuario order by ta.dt_registro rows between unbounded preceding and current row)
),

avaliacao as (
	select
	dta.dt_array as dt_ref,
	ta.id_usuario,
	ta.dt_registro,
	sum(case when ta.dt_registro = dta.dt_array then 1 else 0 end) over w1 as qtd,
	sum(ta.vl_avaliacao * (date(ta.dt_registro) - min_date +1) / (date(ta.dt_registro) - max_date +1)) as vl_avaliacao_media
	from avaliacaoTemp ta
	left join DatasArray dta
		on ta.dt_registro <= dta.dt_array
	group by 1,2,3
	window
		w1 as (partition by ta.id_usuario order by ta.dt_registro rows between unbounded preceding and current row)
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

order by 1,2;