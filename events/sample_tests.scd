Routine({

	~buffer_names[\samples_0].size.do{
		arg i;

		~sample_tests.add((i).asSymbol -> {
			currentEnvironment.put(~buffer_names[\samples_0][i].asSymbol,
				Synth(\playbuf_stereo, [\bufnum, b[\samples_0][i], \gate, 1, \amp, c[2].children[(i+~buffer_names[\samples_0].size)].value, \rate, 1, \loop, 0, \out, ~out], ~samples).register;
			);
		});
	};

	s.sync;


	~buffer_names[\samples_1].size.do{
		arg i;

		~sample_tests.add(((i+~buffer_names[\samples_0].size)).asSymbol -> {
			currentEnvironment.put(~buffer_names[\samples_1][i].asSymbol,
				Synth(\playbuf_stereo, [\bufnum, b[\samples_1][i], \gate, 1, \amp, c[4].children[(i+~buffer_names[\samples_1].size)].value, \rate, 1, \loop, 0, \out, ~out], ~samples).register;
			);
		});
	};

}).play(AppClock);

