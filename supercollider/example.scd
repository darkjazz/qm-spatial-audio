Server.default.boot

~decoder = FoaDecoder();

~decoder.start

~paths = [
	"/Users/matadmin/Library/Application Support/ATK/sounds/b-format/Anderson-Pacific_Slope.wav",
	"/Users/matadmin/Library/Application Support/ATK/sounds/b-format/Pampin-On_Space.wav",
	"/Users/matadmin/Library/Application Support/ATK/sounds/b-format/Leonard-Chinook.wav",
	"/Users/matadmin/Library/Application Support/ATK/sounds/b-format/Howle-Calling_Tunes.wav"
];

~buffers = ~paths.collect({arg path; Buffer.read(Server.default, path) });

SynthDef('play-bf', {arg out, buf, amp;
	var sig;
	sig = PlayBuf.ar(4, buf, doneAction: 2) * amp;
	Out.ar(out, sig)
}).add

~synth = Synth.before(~decoder.synth, 'play-bf', ['out', ~decoder.bus, 'buf', ~buffers[1], 'amp', 0.2])

~synth.free

~decoder.free
