		fetch varCursorUpdate into varIdUpdate;
		if not found then
			insert into tb_erro values(nextval('sq_erro'), 'sp_grupo_jogo', 'Nenhum valor a ser inserido.', current_timestamp);
			raise notice 'Nenhum valor a ser inserido.';
		else
			loop
				insert into tb_grupo_jogo values(nextval('sq_grupo_jogo'), 1, varIdUpdate, 'sim', null, current_timestamp);
				fetch varCursorUpdate into varIdUpdate;
				exit when not found;
				varQtdUpdate:= varQtdUpdate + 1;
			end loop;
			raise notice '% valores atualizados com sucesso.', TO_CHAR(varQtdUpdate, 'fm999G999');
		end if;

        close varCursorUpdate;