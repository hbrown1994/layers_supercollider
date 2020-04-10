e.add(\12 -> {

	c[1].children[11].value_(0);//Off
	c[1].children[12].value_(1);//On


		{~noise_5 = Synth(\playbuf_stereo, [\atk, 25, \bufnum, b[\samples_1][6], \gate, 1, \amp, ~noise_5_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;

	{~attack_1 = Synth(\playbuf_stereo, [\bufnum, b[\samples_0][0], \gate, 1, \amp, ~attack_1_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;


});