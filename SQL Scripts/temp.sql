with
    cr_adj as (
        select
		id_regra, js_categoria,
		row_number() over (partition by id_regra order by dt_registro desc) as row
		from tb_categoria_regra
	),

	intents as (
	select
	id_regra,
	'intents' as tp_categoria,
    'intents' as tp_subcategoria,
	json_array_elements_text(js_categoria::json ->'intents') as ds_categoria
	from cr_adj
	where
		row = 1
		and js_categoria not like '%intents":{}%'
	)


select * from intents order by 1;