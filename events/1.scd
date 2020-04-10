e.add(\1 -> {

	c[1].children[0].value_(0);//Off
	c[1].children[1].value_(1);//On


		{~field_1 = Synth(\playbuf_stereo, [\atk, 120, \c1, 4, \c2, -4, \bufnum, b[\samples_0][1], \gate, 1, \amp, ~noise_1_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;

});



