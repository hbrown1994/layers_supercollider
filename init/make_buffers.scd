//Adds all buffers in the "buffers" folder to a dictionary array.

//Stereo Buffers
b = Dictionary.new;
PathName(~buffers_path).entries.do{
	arg subfolder;
	b.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
					Buffer.read(s, subfolder.entries[i].fullPath);
				}
			)
		);
	};

~buffer_names = Dictionary.new;
PathName(~buffers_path).entries.do{
	arg subfolder;
	~buffer_names.add(
		subfolder.folderName.asSymbol ->
		Array.fill(
			subfolder.entries.size,
			{
				arg i;
				subfolder.entries[i].fileName.asString.replace(".wav", "");
			}
		)
	);
};
