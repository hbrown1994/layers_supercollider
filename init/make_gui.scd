Routine({
	Window.closeAll;
	w = Window("Layers", Rect(750,50,1200,600))
	.front
	.alwaysOnTop_(true);
	w.view.decorator_(FlowLayout(w.bounds, 0@0, 0@0));

	~midi_window = Window("MIDI_Config", Rect(750,50,600,400))
	.front
	.alwaysOnTop_(true);

	~midi_window.view.decorator_(FlowLayout(~midi_window.bounds, 0@0, 0@0));

	c = Array.fill( 6, {
		arg view;
		view = CompositeView(w, 600@200)
		.background_();

		view.decorator_(FlowLayout(view.bounds, 10@25, 70@0));
	});

	// Composite View 0//////////////
	StaticText(c[0], Rect(0,0,580,40))
	.string_("Layers")
	.align_(\center)
	.front
	.stringColor_(Color(1, 1, 1))
	.font_(Font(size: 30));


	// Composite View 0: Init, Stop Reset, and Cue ------------------------------------------
	c[0].background_(Color(0, 0, 0));
	c[0].decorator_(FlowLayout(c[0].bounds, 50@40, 15@15)); // Array 0
	c[0].decorator.nextLine;
	c[0].decorator.nextLine;
	c[0].decorator.nextLine;
	Array.fill(1, {Button(c[0], 200@40).font_(Font(size: 30)).states_([["Initialization", Color.black, Color.gray(0.8)],["Initialized", Color.white, Color(0,0,0)]])});
	Array.fill(1, {Button(c[0], 200@40).font_(Font(size: 30)).states_([["Stop/Reset", Color.black, Color.gray(0.8)]])});

	c[0].decorator.nextLine;
	//c[0].decorator_(FlowLayout(c[0].bounds, 190@140, 15@15)); // Array 0
	Array.fill(1, {Button(c[0], 200@40).font_(Font(size: 30)).states_([["Cue", Color.black, Color.gray(0.8)]])});
	Array.fill(1, {Button(c[0], 200@40).font_(Font(size: 30)).states_([["Midi_Window", Color.black, Color.gray(0.8)], ["Close", Color.black, Color.red]])});

	c[0].decorator_(FlowLayout(c[0].bounds, 500@110, 4@0)); // A
	Array.fill(1, {Button(c[0], 50@50).font_(Font(size: 15)).states_([["Test", Color.black, Color.gray(0.8)]])});


	c[0].decorator_(FlowLayout(c[0].bounds, 500@85, 35@0)); // Array 0
	Array.fill(1,
		{PopUpMenu(c[0],Rect(0,0,80,20))
			.items_(~buffer_names[\samples_0].asArray++~buffer_names[\samples_1].asArray)
			.background_(Color.white)
			.font_(Font(size: 15));
	});

	c[0].decorator_(FlowLayout(c[0].bounds, 550@110, 4@0)); // A
	Array.fill(1, {Button(c[0], 50@50).font_(Font(size: 15)).states_([["Off",  Color.black, Color(1,0,0)]])});



	c[2].decorator_(FlowLayout(c[0].bounds, 10@0, (c[2].bounds.extent.x/~buffer_names[\samples_0].size/8)@0)); // Array 0
	c[4].decorator_(FlowLayout(c[0].bounds, 10@0, (c[4].bounds.extent.x/~buffer_names[\samples_1].size/8)@0)); // Array 0
	c[5].decorator_(FlowLayout(c[5].bounds, 10@0, (c[5].bounds.extent.x/~buffer_names[\samples_0].size/8)@0)); // Array 0

	c[2].background_(Color(1, 1, 1));
	c[3].background_(Color(1, 1, 1));
	c[4].background_(Color(1, 1, 1));


	s.sync;

	// Composite View 1: Cues ------------------------------------------
	c[1].background_(Color(0, 0, 0));
	c[1].decorator_(FlowLayout(c[0].bounds, 15@15, 10@8)); // Array 1

	c[1].decorator.nextLine;
	c[1].decorator.nextLine;
	Array.fill(~numEvents, {
		arg i=(-1);
		{i = i + 1};
		Button(c[1], 35@35).states_([[i.asString, Color.black, Color.gray(0.8)],[i.asString, Color.white, Color(0,0,0)]])});

	s.sync;

	c[5].decorator_(FlowLayout(c[0].bounds, 0@0, 5@0)); // Array 1

	(~buffer_names[\samples_0].size).do{
		arg i=0;

		StaticText(c[2], Rect(0,0,60,20))
		.string_(~buffer_names[\samples_0][i])
		.align_(\center)
		.front
		.stringColor_(Color(0, 0, 0))
		.font_(Font(size: 15));

	};

	(~buffer_names[\samples_1].size).do{
		arg i=0;

		StaticText(c[4], Rect(0,0,60,20))
		.string_(~buffer_names[\samples_1][i])
		.align_(\center)
		.front
		.stringColor_(Color(0, 0, 0))
		.font_(Font(size: 15));

	};

	3.do{
		arg i=0;

		StaticText(c[5], Rect(0,0,60,20))
		.string_(~pad_name_array[i])
		.align_(\center)
		.front
		.stringColor_(Color(0, 0, 0))
		.font_(Font(size: 15));

	};

	c[2].decorator_(FlowLayout(c[0].bounds, 10@25, ((c[2].bounds.extent.x/~buffer_names[\samples_0].size/8)+10)@0)); // Array 0
	Array.fill(~buffer_names[\samples_0].size, {Slider(c[2], 50@155)});
	c[2].decorator.nextLine;
	Array.fill(~buffer_names[\samples_0].size, {NumberBox(c[2], 50@20)});

	c[4].decorator_(FlowLayout(c[4].bounds, 10@25, ((c[4].bounds.extent.x/~buffer_names[\samples_0].size/8)+10)@0)); // Array 0
	Array.fill(~buffer_names[\samples_1].size, {Slider(c[4], 50@155)});
	c[4].decorator.nextLine;
	Array.fill(~buffer_names[\samples_1].size, {NumberBox(c[4], 50@20)});


	c[5].decorator_(FlowLayout(c[5].bounds, 10@25, 10@0)); // Array 0
	Array.fill(PathName(~sampler_path).entries.size, {Slider(c[5], 50@155)});
	c[5].decorator.nextLine;
	Array.fill(PathName(~sampler_path).entries.size, {NumberBox(c[5], 50@20)});

	c[5].decorator_(FlowLayout(c[5].bounds, 300@100, 4@0)); // A
	Array.fill(1, {Button(c[5], 50@50).font_(Font(size: 15)).states_([["Test", Color.black, Color.gray(0.8)]])});

	c[5].decorator_(FlowLayout(c[5].bounds, 350@100, 4@0)); // A
	Array.fill(1, {Button(c[5], 50@50).font_(Font(size: 15)).states_([["Off",  Color.black, Color(1,0,0)]])});


	c[5].decorator_(FlowLayout(c[5].bounds, 300@75, 35@0)); // Array 0
	Array.fill(1,
		{PopUpMenu(c[5],Rect(0,0,100,20))
			.items_(["sampler_1", "sampler_2", "sampler_3"])
			.background_(Color.white)
			.font_(Font(size: 15));
	});

	c[5].background_(Color(1, 1, 1));

	s.sync;

	~init_button = c[0].children[0]
	.action_({
		arg obj;
		if(obj.value == 1, {e[\init].value;"init".postln},{nil});
	});

	~stop_button = c[0].children[1]
	.mouseDownAction_({e[\stop_reset].value})

	.mouseUpAction_({~init_button.valueAction = 0});

	~next_cue_button = c[0].children[2]
	.mouseDownAction_({e[~cue.asSymbol].value;
	})
	.mouseUpAction_({
		~cue = ~cue + 1;
	});


	(~buffer_names[\samples_0].size).do{
		arg i, n;

		currentEnvironment.put((~buffer_names[\samples_0][i]++"_slider").asSymbol,

			c[2].children[i].action_({
				arg obj;
				var amp;
				amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
				if(currentEnvironment.at((~buffer_names[\samples_0][i]).asSymbol).isPlaying,
					{currentEnvironment.at((~buffer_names[\samples_0][i]).asSymbol).set(\amp, amp)}
				);


				c[2].children[(i+~buffer_names[\samples_0].size)].value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
			});

		);

		currentEnvironment.put((~buffer_names[\samples_0][i]++"_numBox").asSymbol,
			c[2].children[(i+~buffer_names[\samples_0].size)].decimals_(2)
			.clipLo_(-60)
			.clipHi_(0.0)
			.action_({
				arg obj;
				c[2].children[i].valueAction_(obj.value.linlin(-60, 1, 0.0,1.0));
			});
		);
	};

	(~buffer_names[\samples_1].size).do{
		arg i, n;


		currentEnvironment.put((~buffer_names[\samples_1][i]++"_slider").asSymbol,

			c[4].children[i].action_({
				arg obj;
				var amp;
				amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
				if(currentEnvironment.at((~buffer_names[\samples_1][i]).asSymbol).isPlaying,
					{currentEnvironment.at((~buffer_names[\samples_1][i]).asSymbol).set(\amp, amp)}
				);


				c[4].children[(i+~buffer_names[\samples_1].size)].value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
			});

		);

		currentEnvironment.put((~buffer_names[\samples_1][i]++"_numBox").asSymbol,
			c[4].children[(i+~buffer_names[\samples_1].size)].decimals_(2)
			.clipLo_(-60)
			.clipHi_(0.0)
			.action_({
				arg obj;
				c[4].children[i].valueAction_(obj.value.linlin(-60, 1, 0.0,1.0));
			});
		);

	};


	(PathName(~sampler_path).entries.size).do{
		arg i, n;


		currentEnvironment.put(("drum_samples_"++(i+1).asString++"_slider").asSymbol,

			c[5].children[i].action_({
				arg obj;
				var amp;
				amp = obj.value.linlin(0.0,1.0,-60.0,0.0);
				if(currentEnvironment.at(("drum_samples_"++(i+1).asString).asSymbol).isPlaying,
					{currentEnvironment.at(("drum_samples_"++(i+1).asString).asSymbol).set(\amp, amp)}
				);


				c[5].children[(i+PathName(~sampler_path).entries.size)].value_(obj.value.linlin(0.0,1.0,-60.0,0.0));
			});

		);

		currentEnvironment.put(("drum_samples_"++(i+1).asString++"_numBox").asSymbol,
			c[5].children[(i+PathName(~sampler_path).entries.size)].decimals_(2)
			.clipLo_(-60)
			.clipHi_(0.0)
			.action_({
				arg obj;
				c[5].children[i].valueAction_(obj.value.linlin(-60, 1, 0.0,1.0));
			});
		);
	};




	(~numEvents).do{
		arg i=0;

		currentEnvironment.put(("rehearsal_cue_button_"++(i.asString)).asSymbol,
			c[1].children[i].mouseDownAction_({~cue=(i);});
		);
	};


	~sample_trig = c[0].children[4].mouseDownAction_({~sample_tests[((c[0].children[5].value).asSymbol)].value;
	});

	~sample_off = c[0].children[6].mouseDownAction_({Routine({~samples.free;  s.sync; ~samples = Group.after(~fx);}).play;});

	~midi_settings = c[0].children[3]
	.action_({
		arg obj;
		if(obj.value == 1, {~midi_window.unminimize;},{~midi_window.minimize;});
	});


	~sampler_trig = c[5].children[6].mouseDownAction_({~sampler_tests[((c[5].children[8].value).asSymbol)].value;
	});

	~sampler_off = c[5].children[7].mouseDownAction_(
		{Routine({
			~samples.free;
			s.sync;
			~samples = Group.after(~fx);
			s.sync;

			~master_sample_test_1.stop;
			~drum_sample_routine_1_test.stop;
			~master_sample_test_2.stop;
			~drum_sample_routine_2_test.stop;
			~master_sample_test_3.stop;
			~drum_sample_routine_3_test.stop;

		}).play;

	});


	(~buffer_names[\samples_0].size).do{
		arg i;

		~slider_preset_array = ~slider_preset_array.add(currentEnvironment.at((~buffer_names[\samples_0][i]++"_numBox").asSymbol));
	};

	(~buffer_names[\samples_1].size).do{
		arg i;

		~slider_preset_array = ~slider_preset_array.add(currentEnvironment.at((~buffer_names[\samples_1][i]++"_numBox").asSymbol));
	};

	(PathName(~sampler_path).entries.size).do{
		arg i;

		~slider_preset_array = ~slider_preset_array.add(currentEnvironment.at(("drum_samples_"++(i+1).asString++"_numBox").asSymbol));
	};

	s.sync;

	Array.fill(1, {

		~preset = ViewPreset(c[3], ~presetFile );

		c[3].layout_( HLayout(
			~preset.build.background_(Color(1, 1, 1));

		));

		~preset.start(
			~slider_preset_array, //interpolation objects
			[] //launching objects
		);

	});


	//set to 0 (init)
	(~buffer_names[\samples_0].size).do{
		arg i;

		c[2].children[i].valueAction_(0.0);
		c[2].children[i+~buffer_names[\samples_0].size].valueAction_(-60.0);

	};

	(~buffer_names[\samples_1].size).do{
		arg i;

		c[4].children[i].valueAction_(0.0);
		c[4].children[i+~buffer_names[\samples_1].size].valueAction_(-60.0);

	};

	(PathName(~sampler_path).entries.size).do{
		arg i;

		c[5].children[i].valueAction_(0.0);
		c[5].children[i+PathName(~sampler_path).entries.size].valueAction_(-60.0);

	};


}).play(AppClock);








