-- TG_Grupo_Inicial

create or replace function fn_grupo_inical() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), new.id_usuario, 1, 'sim',current_timestamp);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_grupo_inicial
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_grupo_inical();