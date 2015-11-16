s = Server.internal
Server.default = s
s.boot


~decoder = FoaDecoder()

~decoder.start

~decoder.synth.set('amp', 0.4)

s.scope

~bfbufs = "/Users/matadmin/Documents/b_format_recordings/MCM_1/*".pathMatch.collect({|path|
	Buffer.cueSoundFile(Server.default, path, 44 * 60 * s.sampleRate, 1);
});


// ~bfbufs = "/Users/matadmin/Documents/b_format_recordings/MCM_2/*".pathMatch.collect({|path|
// 	Buffer.cueSoundFile(Server.default, path, 44 * 60 * s.sampleRate, 1);
// });

Server.default.sampleRate


SynthDef('bformat-diskin', {|out, bw, bx, by, bz, amp|
	var sig;
	sig = Array.with(DiskIn.ar(1, bw), DiskIn.ar(1, bx), DiskIn.ar(1, by), DiskIn.ar(1, bz));
	Out.ar(out, sig * amp)
}).add;

~synth = Synth.before(~decoder.synth, 'bformat-diskin', [\out, ~decoder.bus, \bw, ~bfbufs[0], \bx, ~bfbufs[1], \by, ~bfbufs[2], \bz, ~bfbufs[3], \amp, 1.0])

~synth.free

~bfbufs.collect({|buf| buf.free }) 