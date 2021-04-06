all:
#	Common service
	erlc -o ebin ../../services/common_src/src/*.erl;
#	service
	erlc -o ebin src/*.erl;
#	test application
	cp test_src/*.app test_ebin;
	erlc -o test_ebin test_src/*.erl;
	rm -rf db*/* ebin/* src/*.beam *.beam  test_src/*.beam test_ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
	echo Done
unit_test:
	rm -rf balcony_ctrl balcony_front_end gen_mnesia;
	rm -rf  *~ */*~  erl_cra*;
	mkdir balcony_ctrl;
	cp -R /home/joq62/erlang/simple_erlang/business_logic/balcony_ctrl/* balcony_ctrl;
	mkdir balcony_front_end;
	cp -R /home/joq62/erlang/simple_erlang/front_end/balcony_front_end/* balcony_front_end;
	mkdir gen_mnesia;
	cp -R /home/joq62/erlang/simple_erlang/server_nodes/gen_mnesia/* gen_mnesia;
	erlc -o ebin src/*.erl;
#	test application
#	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin\
	    -pa balcony_ctrl/ebin\
	    -pa gen_mnesia/ebin\
	    -pa balcony_front_end/ebin\
	    -pa balcony_front_end/deps/*/ebin\
	    -setcookie abc\
	    -sname balcony\
	    -mnesia dir mneisa_dir\
	    -s balcony_boot start
test:
	rm -rf db*/* ebin/* src/*.beam *.beam test_src/*.beam test_ebin/*;
	rm -rf  *~ */*~  erl_cra*;
	rm -rf *_specs *_config *.log;
#	Common service
	erlc -o ebin ../../services/common_src/src/*.erl;
	erlc -o db0 ../../services/common_src/src/*.erl;
	erlc -o db1 ../../services/common_src/src/*.erl;
	erlc -o db2 ../../services/common_src/src/*.erl;
#	Common log
	erlc -o ebin ../../services/log_src/src/*.erl;
#	service
	cp test_src/dbase.app db0;
	cp test_src/dbase.app db1;
	cp test_src/dbase.app db2;
	erlc -o db0 src/*.erl;
	erlc -o db1 src/*.erl;
	erlc -o db2 src/*.erl;
	erlc -o db0 test_src/*.erl;
	erlc -o db1 test_src/*.erl;
	erlc -o db2 test_src/*.erl;
	erlc -o ebin src/*.erl;
#	test application
	cp test_src/*.app test_ebin;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa test_ebin\
	    -setcookie abc\
	    -sname test_dbase\
	    -run  dbase_unit_test start_test test_src/test.config
stop:
	erl_call -a 'rpc call [master@c0 init stop []]' -sname master -c abc;
	erl_call -a 'rpc call [master@c1 init stop []]' -sname master -c abc;
	erl_call -a 'rpc call [master@c2 init stop []]' -sname master -c abc
