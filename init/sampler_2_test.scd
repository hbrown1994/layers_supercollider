~sampler_tests.add(\1 -> {

	~master_sample_test_2 = Routine({

		loop{

			if(~drum_samples_2.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_2.scd");});

			(4+2.0.rand).wait;

			~drum_samples_2.set(\gate, 0);
			~drum_buffer_2.free;

			0.1.wait;

		}

	}).play(SystemClock);
});