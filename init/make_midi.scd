MIDIdef.noteOn(\pedal_on, {
	arg val;

	{if(val > 0, {e[~cue.asSymbol].value} ,{nil})}.defer;

}, ~foot_pedal_midi_num.asInt, ~foot_pedal_midi_chan.asInt);

MIDIdef.noteOff(\pedal_off, {
	arg val;

	{if(val < 127, {~cue = ~cue + 1} ,{nil})}.defer;

}, ~foot_pedal_midi_num.asInt, ~foot_pedal_midi_chan.asInt);


MIDIdef.noteOn(\pad_1_on, {
	arg val;

	{if(val > 0, {

		if(~drum_samples_1.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_1.scd");});

	}, {nil})}.defer;

}, ~assign_pad_1_on_midi_num.asInt,~assign_pad_1_on_midi_chan.asInt);

MIDIdef.noteOn(\pad_1_off, {
	arg val;

	{if(val > 0, {
		if(~drum_samples_1.isPlaying, {
			~drum_samples_1.set(\gate, 0);
			~drum_buffer_1.free;
		}, {nil});

	}, {nil})}.defer;

}, ~assign_pad_1_off_midi_num.asInt, ~assign_pad_1_off_midi_chan.asInt);

MIDIdef.noteOn(\pad_2_on, {
	arg val;

	{if(val > 0, {

		if(~drum_samples_2.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_2.scd");});

	}, {nil})}.defer;

}, ~assign_pad_2_on_midi_num.asInt, ~assign_pad_2_on_midi_chan.asInt);

MIDIdef.noteOn(\pad_2_off, {
	arg val;

	{if(val > 0, {

		if(~drum_samples_2.isPlaying, {
			~drum_samples_2.set(\gate, 0);
			~drum_buffer_2.free;
		}, {nil});

	}, {nil})}.defer;

}, ~assign_pad_2_off_midi_num.asInt, ~assign_pad_2_off_midi_chan.asInt);

MIDIdef.noteOn(\pad_3_on, {
	arg val;

	{if(val > 0, {

		if(~drum_samples_3.isPlaying, {nil}, {thisProcess.interpreter.executeFile(~sampler_path++"drum_sampler_3.scd");});

	}, {nil})}.defer;

}, ~assign_pad_3_on_midi_num.asInt, ~assign_pad_3_on_midi_chan.asInt);

MIDIdef.noteOn(\pad_3_off, {
	arg val;

	{if(val > 0, {

		if(~drum_samples_3.isPlaying, {
			~drum_samples_3.set(\gate, 0);
			~drum_buffer_3.free;
		}, {nil});

	}, {nil})}.defer;

}, ~assign_pad_3_off_midi_num.asInt, ~assign_pad_3_off_midi_chan.asInt);



8.do{
	arg i;

	MIDIdef.cc(("\knob_"++i).asSymbol, {
		arg val;

		val = val.linlin(0, 127, -60.0, 0.0);

		{c[2].children[(i+8)].valueAction_(val)}.defer;


	}, (i+16), 2);

};

7.do{
	arg i;

	MIDIdef.cc(("\slider_"++i).asSymbol, {
		arg val;

		val = val.linlin(0, 127, -60.0, 0.0);

		{c[4].children[(i+7)].valueAction_(val)}.defer;


	}, i, 2);

};


MIDIdef.cc(\slider_8, {
	arg val;

	val = val.linlin(0, 127, -60.0, 0.0);

	{c[5].children[3].valueAction_(val)}.defer;
	{c[5].children[4].valueAction_(val)}.defer;
	{c[5].children[5].valueAction_(val)}.defer;


}, 7, 2);







