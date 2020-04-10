e.add(\7 -> {

	c[1].children[6].value_(0);//Off
	c[1].children[7].value_(1);//On

	//delay
	//trigger the below sample with slap tounge

	{~hats = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][5], \gate, 1, \amp, ~hats_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;

	{~bursts = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][2], \gate, 1, \amp, ~bursts_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;

	{~clap = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][3], \gate, 1, \amp, ~clap_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;

	~attack_2.set(\gate, 0, \rel, 0.005);

	{~noise_4 = Synth(\playbuf_stereo,
			[\bufnum, b[\samples_0][7],
				\gate, 1, \amp, ~noise_4_numBox.value,
				\atk, 0.005, \dec, 70, \sus, 0.5, \rel, 0.005,
				\rate, 1, \loop, 0, \out, ~back,

			],
			~samples).register}.defer;



});