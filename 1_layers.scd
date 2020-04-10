(
/*
Layers (for Percussion Trio and Electronics)
Hunter Brown
©2020


Last Updated: 04/09/2020
1. Go to the Supercollider Menu and select Language->Evaluate File.
2. Wait for Script to Run
3. Once the program is finished booting -> Indicated by a "done" message in SuperCollider's Post Window -> Press the button labeled "Initialization." The string microphones and the "Dry String Sound" modules are activated. You can now test the dry string sounds.
4. Once you are ready to start the piece, press the "Cue" button to actuate the first rehearsal cue.
5. To Stop and Restart from any rehearsal cue -> Press "Stop & Reset" -> Press "Initialization" -> Select the rehearsal cue from which you wish to begin from the "Rehearsal Cues" Module -> Press "Cue" to actuate this rehearsal cue. -> Repeat as needed for rehearsal.
6. If for any reason the comptuer part crashes or glitches -> Go to the Supercollider Menu and select Server -> Kill All Servers -> Then Repeat Steps 1 through 4.

For more information, feel free to contact Hunter at hunterbrownmusic1@gmail.com
*/

/*______________________________________________ DO NOT ALTER ANY CODE BELOW THIS LINE ______________________________________________*/
/*_______________________________________________________________________________________________________________________________________________________________________________*/


/*______________________________________________ 1. Server Configuration ______________________________________________*/
s = Server.local;
s.newBusAllocators;
s.latency = 0.05;
ServerBoot.removeAll;
ServerTree.removeAll;
ServerQuit.removeAll;
Server.local.options.numOutputBusChannels = 6;
Server.local.options.numInputBusChannels = 1;
o=s.options;
o.memSize = 2.pow(20);
MIDIClient.init;
MIDIIn.connectAll;

/*______________________________________________ 2. Global Variables ______________________________________________*/

~init_count = 0;
~stop_reset_count = 0;

//Init Cue Number, Sub Output, and number of channels
~back = 0;
~front = 2;
~amp_1_noise = 0;
~amp_1_pedal_stereo = -5;
~amp_1_field = 0;
~amp_1_drums_1 = -4;
~amp_2_noise = 0;
~amp_2_pedal_stereo = -5;
~amp_2_field = 0;
~amp_2_drums_2 = -4;
~amp_3_noise = 0;
~amp_3_pedal_stereo = -5;
~amp_3_field = 0;
~amp_3_drums_3 = -4;

~amp_1_alt = 0;
~amp_2_alt = 0;
~amp_3_alt = 0;

~foot_pedal_midi_num = "0";
~assign_pad_1_on_midi_num = "0";
~assign_pad_1_off_midi_num = "0";
~assign_pad_2_on_midi_num = "0";
~assign_pad_2_off_midi_num = "0";
~assign_pad_3_on_midi_num = "0";
~assign_pad_3_off_midi_num = "0";

~cue=0;

~sample_tests = Dictionary.new;
~sampler_tests = Dictionary.new;
~slider_preset_array = Array.new;
~pad_name_array = ["Pad_1", "Pad_2", "Pad_3"];

//Init File Paths
~buffers_path = PathName(thisProcess.nowExecutingPath).parentPath++"buffers/";
~synth_def_path = PathName(thisProcess.nowExecutingPath).parentPath++"synth_defs/";
~init_path = PathName(thisProcess.nowExecutingPath).parentPath++"init/";
~events_path = PathName(thisProcess.nowExecutingPath).parentPath++"events/";
~presetFile = (PathName(thisProcess.nowExecutingPath).pathOnly++"presets/"++ "asoundPresetExample.sctxar").standardizePath;
~sampler_path = PathName(thisProcess.nowExecutingPath).parentPath++"samplers/";
~numEvents = (PathName(PathName(thisProcess.nowExecutingPath).parentPath++"events/";).entries.size-4);


/*______________________________________________ 3. Buffers ______________________________________________*/
~makeBuffers = {
	thisProcess.interpreter.executeFile(~init_path++"make_buffers.scd");
};

/*______________________________________________ 4. Nodes ______________________________________________*/
~makeNodes = {
	thisProcess.interpreter.executeFile(~init_path++"make_nodes.scd");
};

/*______________________________________________ 6. Events/Arrays ______________________________________________*/
~makeEvents = {

	e = Dictionary.new;

	//The below function adds all cues (or events) in the "events" folder to a dictionary array.

	PathName(~events_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~events_path++PathName(~events_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

};

/*______________________________________________ 7. GUI ______________________________________________*/

~makeGui = {
	thisProcess.interpreter.executeFile(~init_path++"make_gui.scd");
};

/*______________________________________________ 8. Cleanup ______________________________________________*/
// Remove all processes on server on quit.
~cleanup = {
	s.newBusAllocators;
	ServerBoot.removeAll;
	ServerTree.removeAll;
	ServerQuit.removeAll;
};

ServerBoot.add(~makeGui);
ServerBoot.add(~makeBuffers); // "ServerBoot" happens when server boots.
ServerQuit.add(~cleanup); // "ServerQuit" happens when server is Quit.

/*______________________________________________ 9. Busses & SynthDefs ______________________________________________*/

s.waitForBoot({ //Wait to boot server once contained functions have been evaluated.

	//Make Busses
	thisProcess.interpreter.executeFile(~init_path++"make_busses.scd");

	s.sync;

	//The below function adds all SynthDefs in the "synth_defs" folder to the server.
	PathName(~synth_def_path).entries.size.do{

		arg count=0;

		thisProcess.interpreter.executeFile(~synth_def_path++PathName(~synth_def_path).entries.at(count).fileName.asString);

		count = count + 1;
	};

	s.sync;

	ServerTree.add(~makeNodes);
	ServerTree.add(~makeEvents);
	s.freeAll;
	s.sync;
	s.meter;
	"done".postln;
});
)


