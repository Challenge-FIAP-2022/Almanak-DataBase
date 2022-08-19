-- Relatorio para acompanhamento das avaliacoes dos jogos

select

nm_jogo,
tp_avaliacao,
count(*) as nr_avaliacoes

from "TB_Usuario"

inner join "TB_Avaliacao"
    using (id_usuario)

left join "TB_Jogo"
    using (id_jogo)

group by 1,2
order by 1,2