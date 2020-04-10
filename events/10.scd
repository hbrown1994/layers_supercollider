e.add(\10 -> {

	c[1].children[9].value_(0);//Off
	c[1].children[10].value_(1);//On

	{~attack_3 = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][1], \gate, 1, \amp, ~attack_3_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;



});


