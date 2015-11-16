s = Server.internal;
Server.default = s;


s.boot


~decoder = FoaDecoder(false)


~decoder.start

s.queryAllNodes

~decoder.synth.set('amp', 0.1)

s.scope

~decoder.free
