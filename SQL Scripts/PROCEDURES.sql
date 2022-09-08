-- SP_Preencher_Avaliacoes

create or replace procedure sp_preencher_avaliacao(nr_loops integer)
language plpgsql
as
$$
    DECLARE
        varIdUsuario integer;
        varQtdUsuario integer;
        varArrUsuario integer array;
        varDtRegistro timestamp;

        varIdJogo integer;
        varQtdjogo integer;
        varArrjogo integer array;

        vl_nota numeric;

    BEGIN

        select count(*),array_agg(id_usuario) into varQtdUsuario, varArrUsuario from tb_usuario;
        select count(*),array_agg(id_jogo) into varQtdjogo, varArrjogo from tb_jogo;

        for i in 1..nr_loops loop

            vl_nota:= random();
			if vl_nota >= 0.5 then
				vl_nota:= 0;
			else
				vl_nota:= 0.5;
			end if;
            vl_nota:= fn_random_between(2,5) + vl_nota;

            if vl_nota > 5 then vl_nota:= 5; end if;

            varIdUsuario = varArrUsuario[fn_random_between(1,varQtdUsuario)];
            varIdJogo = varArrjogo[fn_random_between(1,varQtdjogo)];

            select dt_registro into varDtRegistro from tb_usuario where id_usuario = varIdUsuario;
            varDtRegistro:= varDtRegistro + random() * (current_timestamp - varDtRegistro);

            insert into tb_avaliacao values (nextval('sq_avaliacao'), varIdUsuario, varIdJogo, vl_nota, null, varDtRegistro);

		end loop;

    END;
$$;

-- SP_Recomendar_Jogo

create or replace procedure sp_recomendar_jogo()
language plpgsql
as
$$
    DECLARE
        varCursor refcursor;
        varRecord record;
        varQtd integer:= 0;
    BEGIN
        open varCursor for
			select
			id_jogo,
			fn_nota_jogo(id_jogo,current_date)
			from tb_jogo
			order by 2 desc,1
			limit 5
        ;
		loop
			fetch varCursor into varRecord;
			exit when not found;
			insert into tb_jogo_grupo values(nextval('sq_jogo_grupo'), 1, varRecord.id_jogo , 'sim', null, current_timestamp);
			varQtd := varQtd + 1;
		end loop;
		raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
        close varCursor;
    END;
$$;

-- SP_Usuario_Sem_Grupo

create or replace procedure sp_usuario_sem_grupo()
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
            left join (select distinct id_usuario from tb_usuario_grupo where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_usuario_sem_grupo', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_usuario_grupo values(nextval('sq_usuario_grupo'), varId, 1, 'sim', null, current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;

-- SP_Usuario_Sem_Plano

create or replace procedure sp_usuario_sem_plano()
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
            left join (select distinct id_usuario from tb_contrato where fl_valido = 'sim') gu
                on u.id_usuario = gu.id_usuario
            where
                gu.id_usuario is null
        ;
		fetch varCursor into varId;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_usuario_sem_plano', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_contrato values(nextval('sq_contrato'), varId, 1, 'sim', null, current_timestamp);
				fetch varCursor into varId;
				exit when not found;
				varQtd:= varQtd + 1;
			end loop;
			raise notice '% valores inseridos com sucesso.', TO_CHAR(varQtd, 'fm999G999');
		end if;
        close varCursor;
    END;
$$;