~drum_sample_routine_2 = Routine({

	~drum_buffer_2 = Buffer.alloc(s, s.sampleRate * 4.0, 2);

	~sample_bank_2 = ~sample_choose_2.next(\0);

	~sample_bank_size_2 = b[~sample_bank_2].size;

	~sample_select_2 = b[~sample_bank_2][~sample_bank_size_2.rand];

	~fade_2 = ~sample_fade_2.next(~sample_bank_2);

	~sample_select_2.postln;
	~fade_2.postln;

	switch (~sample_bank_2,
		\drums_2, {~first_rate_low_2 = 0.2+2.0.rand; ~first_rate_high_2 = 0.2+2.0.rand;},
		\field, {~first_rate_low_2 = 0.5+1.0.rand; ~first_rate_high_2 = 0.2+2.0.rand;},
		\pedal_stereo, {~first_rate_low_2 = 0.8+0.3.rand; ~first_rate_high_2 = 0.8+0.3.rand;},
		\noise, {~first_rate_low_2 = 0.2+1.8.rand; ~first_rate_high_2 = 0.2+1.8.rand;},
	);

	switch (~sample_bank_2,
		\drums_2, {~drum_sample_out_2 = ~front},
		\field, {~drum_sample_out_2 = ~back},
		\pedal_stereo, {~drum_sample_out_2 = ~front},
		\noise, {~drum_sample_out_2 = ~back},
	);

	switch (~sample_bank_2,
		\drums_2, {~amp_2_alt = ~amp_2_drums_2},
		\field, {~amp_2_alt = ~amp_2_field},
		\pedal_stereo, {~amp_2_alt = ~amp_2_pedal_stereo},
		\noise, {~amp_2_alt = ~amp_2_noise},
	);

	{~drum_samples_2 = Synth(\sample_scramble,
		[
			\rate, 1, \startPos, 0, \loop, 1,
			\amp, (~drum_samples_2_numBox.value+~amp_2_alt), \atk, 0.05, \dec, 0.1, \sus, 1, \rel, 0.05, \gate, 1, \c1, -4, \c2, 4,
			\out, ~drum_sample_out_2,
			\bufnum, ~sample_select_2, \prelevel, 0, \interp, 2,
			\rate_low,  0.5 ,\rate_high, 3.5, \end_high, 0.01, \end_low, 1.0,
			\loop_gate, 1, \startLoop, 0, \startPos_loop, 0,
			\lag_time, 2.5.rand, \lag_weight_low, 5+3.rand, \lag_weight_high, 1+3.rand,
			\dust_density, 0.2+0.8.rand,  \buf, ~drum_buffer_2, \mix, ~fade_2,
			\first_rate_low, ~first_rate_low_2, \first_rate_high, ~first_rate_high_2

		],
		~samples).register;}.defer;

}).play(SystemClock);