-- TG_Cadastro_Usuario

create or replace function fn_cadastro_usuario() returns trigger as
$tb_usuario$
    BEGIN
        insert into tb_grupo_usuario values(nextval('sq_grupo_usuario'), new.id_usuario, 1, 'sim',current_timestamp);
        insert into tb_plano_usuario values(nextval('sq_plano_usuario'), new.id_usuario, 1, 'sim', null ,current_timestamp);
        return null;
    END;
$tb_usuario$ language plpgsql;

create or replace trigger tg_cadastro_usuario
    after insert on tb_usuario
    FOR EACH ROW EXECUTE FUNCTION fn_cadastro_usuario();

-- TG_Grupo_Jogo

