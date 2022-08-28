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

-- SP_Preencher_Avaliacao

create or replace procedure sp_preencher_avaliacao()
language plpgsql
as
$$
    DECLARE
        
    BEGIN

    END;
$$;