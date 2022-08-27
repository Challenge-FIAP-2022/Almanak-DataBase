-- TG_Cadastro_Usuario

create or replace function fn_cadastro_usuario() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_usuario_grupo values(nextval('sq_usuario_grupo'), new.id_usuario, 1, 'sim', null, current_timestamp);
        insert into tb_contrato values(nextval('sq_contrato'), new.id_usuario, 1, 'sim', null ,current_timestamp);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_cadastro_usuario
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_usuario();

-- TG_Cadastro_Contrato

create or replace function fn_cadastro_contrato() returns trigger as
$tb_contrato$
    DECLARE
        varCursor refcursor;
        varRecord record;
        varQtd Integer;

    BEGIN
        select count(*) into varQtd from tb_contrato where id_usuario = new.id_usuario;
        if varQtd = 0 then
            return new;

        else
            select count(*) into varQtd from tb_contrato where id_usuario = new.id_usuario and fl_valido = 'sim';

            if varQtd = 0 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_contrato', concat('Usuario ', new.id_usuario, ' sem um contrato valido.'), current_timestamp);
			    raise notice 'TG_Cadastro_Contrato: Usuario % sem um contrato valido.', new.id_usuario;
                return new;

            elsif varQtd > 1 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_cadastro_contrato', concat('Usuario ', new.id_usuario, ' com mais de um contrato valido.'), current_timestamp);
			    raise notice 'TG_Cadastro_Contrato: Usuario % com mais de um contrato valido.', new.id_usuario;

            end if;

                open varCursor for
                    select * from tb_contrato where id_usuario = new.id_usuario and fl_valido = 'sim'
                ;

                loop
                    fetch varCursor into varRecord;
                    exit when not found;
                    update tb_contrato set dt_encerramento = current_timestamp, fl_valido = 'nao' where id_contrato = varRecord.id_contrato;
			    end loop;
                return new;
        end if;
    END;
$tb_contrato$ language plpgsql;

create or replace trigger tg_cadastro_contrato
    before insert on tb_contrato
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_contrato();

-- TG_Agrupar_Usuario

create or replace function fn_agrupar_usuario() returns trigger as
$tb_usuario_grupo$
    DECLARE

        varCursor refcursor;
        varRecord record;
        varQtd Integer;

    BEGIN
        select count(*) into varQtd from tb_usuario_grupo where id_usuario = new.id_usuario;
        if varQtd = 0 then
            return new;

        else
            select count(*) into varQtd from tb_usuario_grupo where id_usuario = new.id_usuario and fl_valido = 'sim';

            if varQtd = 0 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_usuario_grupo', concat('Usuario ', new.id_usuario, ' sem um grupo valido.'), current_timestamp);
			    raise notice 'TG_Classificacao_Grupo: Usuario % sem um contrato valido.', new.id_usuario;
                return new;

            elsif varQtd > 1 then
                insert into tb_erro values(nextval('sq_erro'), 'tg_usuario_grupo', concat('Usuario ', new.id_usuario, ' com mais de um grupo valido.'), current_timestamp);
			    raise notice 'TG_Classificacao_Grupo: Usuario % com mais de um contrato valido.', new.id_usuario;

            end if;

                open varCursor for
                    select * from tb_usuario_grupo where id_usuario = new.id_usuario and fl_valido = 'sim'
                ;

                loop
                    fetch varCursor into varRecord;
                    exit when not found;
                    update tb_usuario_grupo set dt_encerramento = current_timestamp, fl_valido = 'nao' where id_usuario_grupo = varRecord.id_usuario_grupo;
			    end loop;
                return new;
        end if;
    END;
$tb_usuario_grupo$ language plpgsql;

create or replace trigger tg_agrupar_usuario
    before insert on tb_usuario_grupo
    FOR EACH ROW EXECUTE FUNCTION fn_agrupar_usuario();