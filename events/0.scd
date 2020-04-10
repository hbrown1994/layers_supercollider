e.add(\0 -> {

	c[1].children[0].value_(1);//On

	Routine({

		{~attack_1 = Synth(\playbuf_stereo, [\bufnum, b[\samples_0][0], \gate, 1, \amp, ~attack_1_numBox.value, \rate, 1, \loop, 0, \out, ~front], ~samples).register}.defer;

		(b[\samples_0][0].numFrames/s.sampleRate-1.9).wait;

		{~noise_1 = Synth(\playbuf_stereo, [\atk, 20, \c1, 4, \c2, -4, \bufnum, b[\samples_0][4], \gate, 1, \amp, ~noise_1_numBox.value, \rate, 1, \loop, 0, \out, ~back], ~samples).register}.defer;

	}).play(SystemClock);

});