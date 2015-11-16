s.boot

s.quit

~amps = Array.fill(16, 0)
~amps[0] = 0.2

~amps = Array.rand(16, 0.05, 0.1)

SynthDef('dust', {
	var amps;
	amps = Control.names([\amps]).kr(Array.fill(16, 0));
	Out.ar(12, Dust2.ar(Array.rand(16, 20.0, 30.0)) * amps)
}).add

z = Synth('dust').setn(\amps, ~amps)

z.free

z.setn(\amps, ~amps)

Tdef('switch', {
	var index = 0;
	loop({
		~amps = Array.fill(16, 0);
		~amps[index] = 0.2;
		z.setn(\amps, ~amps);
		4.wait;
		index = (index + 1).wrap(0, 15)
	})
}).play

Tdef('switch').clear
