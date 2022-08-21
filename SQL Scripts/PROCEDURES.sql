-- SP_Grupo_Inicial

create or replace procedure sp_grupo_inicial()
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
            left join (select id_usuario from tb_grupo_usuario where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_inicial', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), varId, 1, 'sim',current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;

-- SP_Grupo_Jogo

create or replace procedure sp_grupo_jogo()
language plpgsql
as
$$
    DECLARE
        varCursorUpdate refcursor;
        varRecordUpdate record;
        varQtdUpdate integer:= 1;

        varCursorInsert refcursor;
        varIdInsert integer;
        varQtdInsert integer:= 1;
    BEGIN
        -- Update Jogos antigos
        -- open varCursorUpdate for
        -- 	select * from tb_grupo_jogo where id_grupo = 1 and fl_valido = 'sim';

		-- fetch varCursorUpdate into varRecordUpdate;
		-- if not found then
		-- 	insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_jogo', 'Nenhum valor a ser atualizado.', current_timestamp);
		-- 	raise notice 'Nenhum valor a ser atualizado.';
		-- else
		-- 	loop
		-- 		update tb_grupo_jogo set fl_valido = 'nao', dt_encerramento = current_timestamp where id_grupo_jogo = varRecordUpdate.id_grupo_jogo;
		-- 		fetch varCursorUpdate into varRecordUpdate;
		-- 		exit when not found;
		-- 		varQtdUpdate:= varQtdUpdate + 1;
		-- 	end loop;
		-- 	raise notice '% valores atualizados com sucesso.', TO_CHAR(varQtdUpdate, 'fm999G999');
		-- end if;

        -- close varCursorUpdate;

        -- Insert New Grupo
        open varCursorInsert for
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

		fetch varCursorInsert into varIdInsert;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_jogo', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_grupo_jogo values(nextval('sq_grupo_jogo'), 1, varIdInsert, 'sim', null, current_timestamp);
				fetch varCursorInsert into varIdInsert;
				exit when not found;
				varQtdInsert:= varQtdInsert + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtdInsert, 'fm999G999');
		end if;

        close varCursorInsert;

    END;
$$;