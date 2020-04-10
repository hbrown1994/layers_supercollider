e.add(\3 -> {

	c[1].children[2].value_(0);//Off
	c[1].children[3].value_(1);//On

	{~noise_2 = Synth(\playbuf_stereo, [\atk, 0.005, \c1, 4, \c2, -4, \bufnum, b[\samples_0][5], \gate, 1, \amp, ~noise_1_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;


});