~sampler_tests.add(\2 -> {

	~master_sample_test_3 = Routine({

		loop{

			if(~drum_samples_3.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_3.scd");});

			(4+2.0.rand).wait;

			~drum_samples_3.set(\gate, 0);
			~drum_buffer_3.free;

			0.1.wait;

		}

	}).play(SystemClock);
});

