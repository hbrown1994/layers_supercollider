~drum_sample_routine_1 = Routine({

	~drum_buffer_1 = Buffer.alloc(s, s.sampleRate * 4.0, 2);

	~sample_bank_1 = ~sample_choose_1.next(\0);

	~sample_bank_size_1 = b[~sample_bank_1].size;

	~sample_select_1 = b[~sample_bank_1][~sample_bank_size_1.rand];

	~fade_1 = ~sample_fade_1.next(~sample_bank_1);

	~sample_select_1.postln;
	~fade_1.postln;

	switch (~sample_bank_1,
		\drums_1, {~first_rate_low_1 = 0.2+2.0.rand; ~first_rate_high_1 = 0.2+2.0.rand;},
		\field, {~first_rate_low_1 = 0.5+1.0.rand; ~first_rate_high_1 = 0.2+2.0.rand;},
		\pedal_stereo, {~first_rate_low_1 = 0.8+0.3.rand; ~first_rate_high_1 = 0.8+0.3.rand;},
		\noise, {~first_rate_low_1 = 0.2+1.8.rand; ~first_rate_high_1 = 0.2+1.8.rand;},
	);

	switch (~sample_bank_1,
		\drums_1, {~drum_sample_out_1 = ~front},
		\field, {~drum_sample_out_1 = ~back},
		\pedal_stereo, {~drum_sample_out_1 = ~front},
		\noise, {~drum_sample_out_1 = ~back},
	);

	switch (~sample_bank_1,
		\drums_1, {~amp_1_alt = ~amp_1_drums_1},
		\field, {~amp_1_alt = ~amp_1_field},
		\pedal_stereo, {~amp_1_alt = ~amp_1_pedal_stereo},
		\noise, {~amp_1_alt = ~amp_1_noise},
	);

	{~drum_samples_1 = Synth(\sample_scramble,
		[
			\rate, 1, \startPos, 0, \loop, 1,
			\amp, (~drum_samples_1_numBox.value+~amp_1_alt), \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \c1, -4, \c2, 4,
			\out, ~drum_sample_out_1,
			\bufnum, ~sample_select_1, \prelevel, 0, \interp, 2,
			\rate_low,  0.5 ,\rate_high, 3.5, \end_high, 0.01, \end_low, 1.0,
			\loop_gate, 1, \startLoop, 0, \startPos_loop, 0,
			\lag_time, 2.5.rand, \lag_weight_low, 5+3.rand, \lag_weight_high, 1+3.rand,
			\dust_density, 0.2+0.8.rand,  \buf, ~drum_buffer_1, \mix, ~fade_1,
			\first_rate_low, ~first_rate_low_1, \first_rate_high, ~first_rate_high_1

		],
		~samples).register;}.defer;

}).play(SystemClock);