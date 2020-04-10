e.add(\11 -> {

	c[1].children[10].value_(0);//Off
	c[1].children[11].value_(1);//On

	~field_2.set(\gate, 0);

	{~loop_1 = Synth(\playbuf_stereo, [\atk, 30, \bufnum, b[\samples_0][2], \c1, 4, \c2, -4, \gate, 1, \amp, ~loop_1_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;


});