~drum_sample_routine_3 = Routine({

	~drum_buffer_3 = Buffer.alloc(s, s.sampleRate * 4.0, 2);

	~sample_bank_3 = ~sample_choose_3.next(\0);

	~sample_bank_size_3 = b[~sample_bank_3].size;

	~sample_select_3 = b[~sample_bank_3][~sample_bank_size_3.rand];

	~fade_3 = ~sample_fade_3.next(~sample_bank_3);

	~sample_select_3.postln;
	~fade_3.postln;

	switch (~sample_bank_3,
		\drums_3, {~first_rate_low_3 = 0.2+2.0.rand; ~first_rate_high_3 = 0.2+2.0.rand;},
		\field, {~first_rate_low_3 = 0.5+1.0.rand; ~first_rate_high_3 = 0.2+2.0.rand;},
		\pedal_stereo, {~first_rate_low_3 = 0.8+0.3.rand; ~first_rate_high_3 = 0.8+0.3.rand;},
		\noise, {~first_rate_low_3 = 0.2+1.8.rand; ~first_rate_high_3 = 0.2+1.8.rand;},
	);

	switch (~sample_bank_3,
		\drums_3, {~drum_sample_out_3 = ~front},
		\field, {~drum_sample_out_3 = ~back},
		\pedal_stereo, {~drum_sample_out_3 = ~front},
		\noise, {~drum_sample_out_3 = ~back},
	);

	switch (~sample_bank_3,
		\drums_3, {~amp_3_alt = ~amp_3_drums_3},
		\field, {~amp_3_alt = ~amp_3_field},
		\pedal_stereo, {~amp_3_alt = ~amp_3_pedal_stereo},
		\noise, {~amp_3_alt = ~amp_3_noise},
	);

	{~drum_samples_3 = Synth(\sample_scramble,
		[
			\rate, 1, \startPos, 0, \loop, 1,
			\amp, (~drum_samples_3_numBox.value+~amp_3_alt), \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \c1, -4, \c2, 4,
			\out, ~drum_sample_out_3,
			\bufnum, ~sample_select_3, \prelevel, 0, \interp, 2,
			\rate_low,  0.5 ,\rate_high, 3.5, \end_high, 0.01, \end_low, 1.0,
			\loop_gate, 1, \startLoop, 0, \startPos_loop, 0,
			\lag_time, 2.5.rand, \lag_weight_low, 5+3.rand, \lag_weight_high, 1+3.rand,
			\dust_density, 0.2+0.8.rand,  \buf, ~drum_buffer_3, \mix, ~fade_3,
			\first_rate_low, ~first_rate_low_3, \first_rate_high, ~first_rate_high_3

		],
		~samples).register;}.defer;

}).play(SystemClock);