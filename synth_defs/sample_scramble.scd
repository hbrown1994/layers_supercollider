SynthDef(\sample_scramble, {
	arg  rate=1, startPos=0, loop=1, amp=(-20), atk=0.05, dec=0.1, sus=1, rel=0.05, gate=1, out, buf, bufnum, prelevel=0, interp=2, c1, c2, rate_low, rate_high, end_high, end_low, loop_gate, startLoop=0, startPos_loop=0, lag_time, lag_weight_low, lag_weight_high, timer_max, dust_density, mix, first_rate_low=1, first_rate_high=1;
	var sig, env, in, fft_onset, trig, lag_choose, rec, timer, sample_choose;

	env = EnvGen.kr(Env.adsr(atk, dec, sus, rel, curve: [c1, c2]), gate, doneAction: 2);

	trig = Dust.kr(dust_density);

	in = PlayBuf.ar(2, bufnum, TRand.kr(first_rate_low, first_rate_high, trig), 1, startPos, loop, doneAction: 2);

	fft_onset = FFT(LocalBuf(512), in, 0.75, 1);
	lag_choose = TWChoose.kr(trig, [0, lag_time], [lag_weight_low, lag_weight_high].normalizeSum).lag(0.05);
	timer = Sweep.kr(trig, timer_max);

	rec  = RecordBuf.ar(in, bufnum: buf, offset: 0, recLevel: 1, preLevel: prelevel, run: 1, loop: 0, trigger: trig, doneAction: 0);

	sig = LoopBuf.ar(2, bufnum: buf, rate: TRand.kr(rate_low, rate_high, trig).lag(lag_choose), gate: loop_gate, startPos: startPos_loop, startLoop: startLoop, endLoop: TExpRand.kr(s.sampleRate*end_high, s.sampleRate*end_low, trig), interpolation: interp);

	sig = XFade2.ar(in, inB: sig, pan: mix);

	sig = sig * env * amp.dbamp.lag(0.1);
	Out.ar(out, Mix.ar([sig]));
}).add;