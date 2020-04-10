e.add(\init -> {


	if(~init_count != 0, {thisProcess.interpreter.executeFile(~init_path++"make_midi.scd");}, {

		~init_count =  ~init_count + 1;
		~midi_test_button = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Test_MIDI", Color.black, Color.gray(0.8)],["Off", Color.black, Color(1,0,0)]]).action_({
			arg obj;
			if(obj.value == 1,
				{
					~midi_test = MIDIFunc.noteOn({ |vel, num, chan|
						~current_midi_num = num;
						~current_midi_chan = chan;
						chan.postln;



						~midi_look = Routine({
							~midi_num_display.string = ~current_midi_num.asString;
						}).play(AppClock);
					});
				},
				{
					~midi_test.free;
					~midi_look.stop;

			});
		});


		~midi_num_display = TextField(~midi_window, Rect(10, 10, 100, 100)).font_(Font(size: 20));
		~midi_num_display.string = ~current_midi_num.asString;


		~assign_foot_pedal = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Assign_Pedal", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~foot_pedal_midi_num = ~current_midi_num.asInt;
			~foot_pedal_midi_chan = ~current_midi_chan.asInt;

		});

		~assign_pad_1_on = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_1_On", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_1_on_midi_num = ~current_midi_num.asInt;
			~assign_pad_1_on_midi_chan = ~current_midi_chan.asInt;


		});

		~assign_pad_1_off = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_1_Off", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_1_off_midi_num = ~current_midi_num.asInt;
			~assign_pad_1_off_midi_chan = ~current_midi_chan.asInt;

		});

		~assign_pad_2_on = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_2_On", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_2_on_midi_num = ~current_midi_num.asInt;
			~assign_pad_2_on_midi_chan = ~current_midi_chan.asInt;

		});

		~assign_pad_2_off = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_2_Off", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_2_off_midi_num = ~current_midi_num.asInt;
			~assign_pad_2_off_midi_chan = ~current_midi_chan.asInt;

		});

		~assign_pad_3_on = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_3_On", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_3_on_midi_num = ~current_midi_num.asInt;
			~assign_pad_3_on_midi_chan = ~current_midi_chan.asInt;

		});

		~assign_pad_3_off = Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["Pad_3_Off", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			~assign_pad_3_off_midi_num = ~current_midi_num.asInt;
			~assign_pad_3_off_midi_chan = ~current_midi_chan.asInt;

		});

		~make_midi_trig= Button(~midi_window, 100@40).font_(Font(size: 15)).states_([["make_midi_trig", Color.black, Color.gray(0.8)]])
		.mouseDownAction_({

			thisProcess.interpreter.executeFile(~init_path++"make_midi.scd");


		});

	});


		~sample_choose_1 = MarkovSetN([[\0, [\drums_1, \field, \noise, \pedal_stereo], [1, 2, 3, 5].normalizeSum]], 1);
		~sample_fade_1 = MarkovSetN([
			[\drums_1, [-1, -0.5, 0, 0.5, 1], [5, 2, 1, 2, 4].normalizeSum],
			[\field, [-1, -0.5, 0, 0.5, 1], [3, 2, 5, 2, 6].normalizeSum],
			[\noise, [-1, -0.5, 0, 0.5, 1], [4, 2, 6, 2, 5].normalizeSum],
			[\pedal_stereo, [-1, -0.5, 0, 0.5, 1], [2, 0, 5, 0, 4].normalizeSum],
		], 1);

		~sample_choose_2 = MarkovSetN([[\0, [\drums_2, \field, \noise, \pedal_stereo], [5, 3, 2, 2].normalizeSum]], 1);
		~sample_fade_2 = MarkovSetN([
			[\drums_2, [-1, -0.5, 0, 0.5, 1], [5, 2, 1, 2, 4].normalizeSum],
			[\field, [-1, -0.5, 0, 0.5, 1], [3, 2, 5, 2, 6].normalizeSum],
			[\noise, [-1, -0.5, 0, 0.5, 1], [4, 2, 6, 2, 5].normalizeSum],
			[\pedal_stereo, [-1, -0.5, 0, 0.5, 1], [2, 0, 5, 0, 4].normalizeSum],
		], 1);

		~sample_choose_3 = MarkovSetN([[\0, [\drums_3, \field, \noise, \pedal_stereo], [2, 5, 5, 3].normalizeSum]], 1);
		~sample_fade_3 = MarkovSetN([
			[\drums_3, [-1, -0.5, 0, 0.5, 1], [5, 2, 1, 2, 4].normalizeSum],
			[\field, [-1, -0.5, 0, 0.5, 1], [3, 2, 5, 2, 6].normalizeSum],
			[\noise, [-1, -0.5, 0, 0.5, 1], [4, 2, 6, 2, 5].normalizeSum],
			[\pedal_stereo, [-1, -0.5, 0, 0.5, 1], [2, 0, 5, 0, 4].normalizeSum],
		], 1);

		~init_count = ~init_count + 1;


	thisProcess.interpreter.executeFile(~init_path++"sampler_1_test.scd");
	thisProcess.interpreter.executeFile(~init_path++"sampler_2_test.scd");
	thisProcess.interpreter.executeFile(~init_path++"sampler_3_test.scd");



});