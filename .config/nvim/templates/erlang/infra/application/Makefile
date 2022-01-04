build:
	@erlc -o ebin src/*.erl

edoc:
	erl -noshell -eval 'edoc:application(tcp_rpc, ".", []),erlang:halt().'

.PHONY: clean shell dirs

shell:
	erl -pa ebin

clean:
	rm ebin/*.beam erl_crash.dump

dirs:
	mkdir -p {src,doc,ebin,priv,include}
