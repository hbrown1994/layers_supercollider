e.add(\6 -> {

	c[1].children[5].value_(0);//Off
	c[1].children[6].value_(1);//On

	Routine({

		{~attack_2 = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][0], \gate, 1, \amp, ~attack_2_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;


	}).play(SystemClock);


});