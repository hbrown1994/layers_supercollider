~sampler_tests.add(\0 -> {
	~master_sample_test_1 = Routine({

		loop{

			if(~drum_samples_1.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_1.scd");});

			(4+2.0.rand).wait;

			~drum_samples_1.set(\gate, 0);
			~drum_buffer_1.free;

			0.1.wait;

		}

	}).play(SystemClock);

});
