SynthDef(\playbuf_stereo, {
	arg bufnum, rate=1, trig, startPos=0, loop=1, amp=(-20), atk=0.05, dec=0.1, sus=1, rel=0.05, c1, c2, gate=1, out;
	var sig, env;
	sig = PlayBuf.ar(2, bufnum, rate, trig, startPos, loop, doneAction: 2);
	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: [c1, c2]), gate, doneAction: 2);
	sig = sig * env * amp.dbamp.lag(0.1);
	Out.ar(out, sig);
}).add;
