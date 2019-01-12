;nyquist plug-in
;version 3
;type process
;preview linear
;name "Bitcrusher..."
;action "crushing"
;author "utz/irrlicht project"
;copyright "Released under terms of the MIT License"


;control bitrate "bitrate" int "" 8 1 16

(quantize S (round (/ (power 2 bitrate) 2)))
