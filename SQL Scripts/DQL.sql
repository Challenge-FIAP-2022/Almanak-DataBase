-- UPDATE

update tb_usuario set ds_senha = '123456' where id_usuario = 1;


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