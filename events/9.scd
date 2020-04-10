e.add(\9 -> {

	c[1].children[8].value_(0);//Off
	c[1].children[9].value_(1);//On


	~hats.set(\gate, 0);
	~bursts.set(\gate, 0);

	{~field_2 = Synth(\playbuf_stereo, [\atk, 10, \bufnum, b[\samples_1][4], \gate, 1, \amp, ~field_2_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;



});