e.add(\15 -> {

	c[1].children[14].value_(0);//Off
	c[1].children[15].value_(1);//On


	{~loop_2 = Synth(\playbuf_stereo, [\atk, 0.005, \bufnum, b[\samples_0][3], \gate, 1, \amp, ~loop_2_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;

	{~clap = Synth(\playbuf_stereo, [\bufnum, b[\samples_1][3], \gate, 1, \amp, ~clap_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;

});