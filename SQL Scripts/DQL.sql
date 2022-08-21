-- UPDATE

update tb_usuario set ds_senha = '123456' where id_usuario = 2;


-- Relatorio para acompanhamento das avaliacoes dos jogos

select

nm_jogo,
tp_avaliacao,
count(*) as nr_avaliacoes

from tb_usuario

inner join tb_avaliacao
    using (id_usuario)

left join tb_jogo
    using (id_jogo)

group by 1,2
order by 1,2;

-- Jogos mais populares

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