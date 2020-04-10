e.add(\concat_1_test -> {
	~concat_1 = Synth(\concat_1, [
		\input, ~saxBus, \bufnum, m[\concat][7], \amp, ~concat_1_numBox.value,
		\threshold, 0.02,  \matchlength, 0.02,
		\rand, 0, \freeze, 0,
		\file_size, m[\concat][7].numFrames/s.sampleRate,
		\seektime, m[\concat][7].numFrames/s.sampleRate,
		\seekdur, m[\concat][7].numFrames/s.sampleRate,
		\zcr, 1.0, \lms, 1.0, \sc, 1.0, \st, 1.0,
		\out, ~out,
	], target: ~fx).register;

});

e.add(\concat_3_test -> {
	~concat_3 = Synth(\concat_3,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\lag_high, 0.0, \lag_weight_low, 0.0, \lag_weight_high, 0.0,
			\prelevel, 0, \startPos, 0, \startLoop, 0,
			\rate_low, 0.7, \rate_high, 2.0,
			\end_high, 1.0, \end_low, 0.3,
			\silence_weight_low, 0.1, \silence_weight_high, 0.9,

			\seg_min, 0.01, \seg_max, 0.2, \lag, 0.0,

			\bufnum, m[\concat][8],
			\threshold, 0.1,  \matchlength, 0.02,
			\rand, 0, \freeze, 0,
			\file_size, m[\concat][8].numFrames/s.sampleRate,
			\seektime, m[\concat][8].numFrames/s.sampleRate,
			\seekdur, m[\concat][8].numFrames/s.sampleRate,
			\zcr, 1.0, \lms, 1.0, \sc, 1.0, \st, 1.0,


			\amp, ~concat_3_numBox.value, \out, ~out

		],
		~fx).register;

});


e.add(\dist_1_test -> {
	~dist_res_1 = Synth(\dist_res_1, [
		\mod_mix, -6, \in_mix, -3, \ring_mix, -18, \phase, 180, \bend, 0.1,
		\strech, 0.9, \shift, 0.1,  \numBins, 12,
		\ring_delay, 0.0, \mod_delay, 0.0,
		\ring_factor, 0.0, \mod_factor, 0.0,
		\out, ~out, \amp, ~dist_res_1_numBox.value,
		\atk, 1.0, \sus, 1, \rel, 0.005, \gate, 1,
		\loop, 1, \bufnum, b[\multi][0]],
	~fx).register;
});


e.add(\dist_2_test -> {

	~dist_res_2 = Synth(\dist_res_2, [
		\mod_mix, -3, \in_mix, -12, \ring_mix, -3, \phase, 180, \bend, 0.2,
		\strech, 0.8, \shift, 0.0,  \numBins, 8,
		\ring_delay, 0.0, \mod_delay, 0.0,
		\ring_factor, 0.0, \mod_factor, 0.0,
		\out, ~out, \amp, ~dist_res_2_numBox.value,
		\atk, 0.5, \sus, 1, \rel, 0.005, \gate, 1,
		\loop, 1, \bufnum, b[\multi][7]],
	~fx).register;
});

e.add(\dist_3_test -> {

	~dist_res_3 = Synth(\dist_res_3, [
		\mod_mix, -3, \in_mix, -12, \ring_mix, -3, \phase, 180, \bend, 0.1,
		\strech, 0.8, \shift, 0.0,  \numBins, 8,
		\ring_delay, 5.0, \mod_delay, 5.0,
		\ring_factor, 0.5, \mod_factor, 0.5,
		\dry_level, 1.0, \wet_level, 0.0,
		\lag_time, 5.0 ,
		\out, ~out, \amp, ~dist_res_3_numBox.value,
		\atk, 0.005, \sus, 1, \rel, 15, \gate, 1,
		\loop, 0, \bufnum, b[\sax][0], \rms_max, 0.5,
		\startPos, 30 ,

	],
	~fx).register;

});

e.add(\dist_4_test -> {

	~dist_res_4= Synth(\dist_res_2, [
		\mod_mix, -3, \in_mix, -12, \ring_mix, -3, \phase, 180, \bend, 0.2,
		\strech, 0.8, \shift, 0.0,  \numBins, 8,
		\ring_delay, 0.0, \mod_delay, 0.0,
		\ring_factor, 0.0, \mod_factor, 0.0,
		\out, ~out, \amp, ~dist_res_4_numBox.value,
		\atk, 0.5, \sus, 1, \rel, 0.005, \gate, 1,
		\loop, 1, \bufnum, b[\multi][7]],
	~fx).register;

});

e.add(\dist_5_test -> {

	~dist_res_5 = Synth(\dist_res_4, [
		\mod_mix, -6, \in_mix, -3, \ring_mix, -3, \phase, 180, \bend, 1.3,
		\strech, 1.03, \shift, 0.0,  \numBins, 5,
		\ring_delay, 6.0, \mod_delay, 6.4,
		\ring_factor, 0.3, \mod_factor, 0.3,
		\out, ~out, \amp, ~dist_res_5_numBox.value,
		\atk, 1.0, \sus, 1, \rel, 0.005, \gate, 1,
	], ~fx).register;

});

e.add(\break_1_test -> {
	~break_1 = Synth(\break_1,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\lag_high, 0.0, \lag_weight_low, 0.0, \lag_weight_high, 0.0,
			\prelevel, 0, \startPos, 0, \startLoop, 0,
			\rate_low, 0.7, \rate_high, 4.0,
			\end_high, 0.8, \end_low, 0.4,
			\silence_weight_low, 0.1, \silence_weight_high, 0.9,

			\seg_min, 0.1, \seg_max, 0.3, \lag, 0.0,

			\timer_gate, 2,

			\amp, ~break_1_numBox.value, \out, ~out

		],
		~fx).register;
});

e.add(\break_4_test -> {
	~break_4 = Synth(\break_4,
		[\gate, 1,

			\atk, 6.0, \dec, 0.005, \sus, 1, \rel, 0.005,

			\lag_high, 0.0, \lag_weight_low, 0.0, \lag_weight_high, 0.0,
			\prelevel, 0, \startPos, 0, \startLoop, 0,
			\rate_low, 0.7, \rate_high, 1.7,
			\end_high, 0.6, \end_low, 0.2,
			\silence_weight_low, 0.1, \silence_weight_high, 0.9,
			\amp, ~break_4_numBox.value, \out, ~out

		],
		~fx).register;
});

e.add(\break_5_test -> {
	~break_5 = Synth(\break_5,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\lag_high, 0.0, \lag_weight_low, 0.0, \lag_weight_high, 0.0,
			\prelevel, 0, \startPos, 0, \startLoop, 0,
			\rate_low, 2.0, \rate_high, 7.0,
			\end_high, 0.6, \end_low, 0.05,
			\silence_weight_low, 0.1, \silence_weight_high, 0.9,
			\amp, ~break_5_numBox.value, \out, ~out,

			\trig_speed, 0.8, \gate_trig, 1,

		],
		~fx).register;
});


e.add(\hold_1_test -> {

	~hold_1 = Synth(\loop_1,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\rate, 1.14657, \endloop, 2750.37,

			\lag_high, 0.0, \lag_weight_low, 0.0, \lag_weight_high, 0.0,
			\prelevel, 0, \startPos, 0, \startLoop, 0,
			\rate_low, 1.0, \rate_high, 1.7,
			\end_high, 0.4, \end_low, 0.1,
			\silence_weight_low, 0.1, \silence_weight_high, 0.9,
			\amp, ~hold_1_numBox.value, \out, ~out

		],
		~fx).register;

});

e.add(\hold_2_test -> {

	~hold_2 = Synth(\loop_2,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\atk_1, 2.0, \sus_1, 1.0, \rel_1, 0.005,

			\rate_low, 2.14332, \rate_high, 0.2,
			\endLoop_env_low, 1634.24, \endLoop_env_high, 4000.0,
			\hold_time, 0.5, \env_time, 2.0,

			\env_gate, 1,


			\prelevel, 0, \startPos, 0, \startLoop, 0,

			\pos_1, 1.0, \pos_2, 0.0, \time_1, 0.5, \time_2, 2.0,

			\silence_weight_low, 0.1, \silence_weight_high, 0.9,
			\amp, ~hold_2_numBox.value, \out, ~out

		],
		~fx).register;

});

e.add(\hold_3_test -> {

	~hold_3 = Synth(\loop_2,
		[\gate, 1,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\atk_1, 0.005, \sus_1, 1.0, \rel_1, 0.005,

			\rate_low, 0.5, \rate_high, 3.14332,
			\endLoop_env_low, 4000.0, \endLoop_env_high, 1634.24,
			\hold_time, 1.0, \env_time, 10.0,

			\env_gate, 1,


			\prelevel, 0, \startPos, 0, \startLoop, 0,

			\pos_1, 1.0, \pos_2, -1.0, \time_1, 1.0, \time_2, 10.0,

			\silence_weight_low, 0.0, \silence_weight_high, 1.0,
			\amp, ~hold_3_numBox.value, \out, ~out

		],
		~fx).register;

});

e.add(\hold_4_test -> {

	~hold_4 = Synth(\loop_2,
		[\env_gate, 1,

			\trig_bus, ~slap_onset_bus,

			\atk, 0.005, \dec, 0.005, \sus, 1, \rel, 0.005,

			\atk_1, 0.005, \dec_1, 0.005, \sus_1, 1, \rel_1, 7,

			\rate_low, 0.9, \rate_high, 4.0,
			\endLoop_env_low, 6000, \endLoop_env_high, 500,
			\hold_time, 0.2, \env_time, 1.0,


			\prelevel, 0, \startPos, 0, \startLoop, 0,

			\pos_1, -1.0, \pos_2, 0.7, \time_1, 0.2, \time_2, 1.0,

			\amp, ~hold_4_numBox.value, \out, ~out

		],
		~fx).register;

});

e.add(\freeze_test -> {
	~freeze = Synth(\freeze, [\silence_thresh, ~silence_numBox.value, \dist_wet, 0.5, \amp, ~freeze_numBox.value, \gate, 1, \out, 0, \spread, 0.7, \count_test, 0], ~fx).register;

});

e.add(\freeze_swell_test -> {

	~freeze_swell = Synth(\freeze_swell, [\silence_thresh, ~silence_numBox.value, \amp, ~freeze_swell_numBox.value, \gate, 1, \out, 0, \dist_wet, 0.5, \spread, 0.7], ~fx).register;


});

e.add(\freeze_hold_test -> {

	~freeze_hold = Synth(\freeze_hold, [\silence_thresh, ~silence_numBox.value, \dist_wet, 0.5, \amp, ~freeze_hold_numBox.value, \gate, 1, \out, 0, \spread, 0.7, \count_test, 0], ~fx).register;


});




