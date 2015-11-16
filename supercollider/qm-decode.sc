FoaDecoder{

	classvar <gain;

	var <localInput, <bus, <>offset = 12, <synth;

	*initClass{
		gain = [
			0.43, 0.988, 1.0, 0.8, 1.0, 0.941, 0.84, 1.0,
			0.78, 0.861, 0.785, 0.754, 1.0, 1.0, 0.78, 0.81
		];
	}

	*new{arg localInput=true;
		^super.newCopyArgs(localInput).init
	}

	init{
		if (Server.default.serverRunning.not)
		{
			^"Server not running".warn;
		}
		{
			bus = Bus.audio(Server.default, 4);
			SynthDef('qm-decoder', {arg out = 0, in, amp;
				var bf;
				if (localInput)
				{ bf = In.ar(in, 4); }
				{ bf = SoundIn.ar((0..3)); };
				Out.ar(out, FoaQMDecode.ar(bf, FoaDecoder.gain) * amp);
			}).add;
		}
	}

	start{
		synth = Synth('qm-decoder', ['out', offset, 'in', bus, 'amp', 1.0]);
	}

	free{
		synth.free;
		synth = nil;
	}

}

FoaQMDecode : FoaUGen{

	classvar <matrix;

	*ar {arg in, mul=1, add=0;
		var out = AtkMatrixMix.ar(in, FoaQMDecode.matrix, mul, add);
		^this.checkChans(out);
	}

	*initClass {

		matrix = Matrix.with( [
			[0.166724,	-0.003351,	-0.000496,	 0.571805],
			[0.236566,	 0.234451,	 0.001434,	-0.031864],
			[0.241276,	 0.173540,	 0.168745,	-0.033261],
			[0.257123,	-0.025765,	 0.250050,	-0.037131],
			[0.272623,	-0.218273,	 0.121756,	-0.040558],
			[0.273259,	-0.223416,	-0.117899,	-0.040293],
			[0.257810,	-0.028498,	-0.250631,	-0.036428],
			[0.242252,	 0.165332,	-0.173462,	-0.032900],
			[0.196589,	 0.207643,	 0.001080,	 0.255944],
			[0.214833,	-0.004416,	 0.223055,	 0.241289],
			[0.233148,	-0.222373,	-0.001718,	 0.232799],
			[0.215060,	-0.007206,	-0.223067,	 0.244737],
			[0.287426,	 0.138793,	-0.154314,	-0.328258],
			[0.288454,	 0.139198,	 0.154783,	-0.337954],
			[0.306983,	-0.163047,	 0.158740,	-0.305210],
			[0.309874,	-0.162612,	-0.158057,	-0.322717]
		]);
	}
}

