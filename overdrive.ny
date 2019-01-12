;nyquist plug-in
;version 3
;type process
;preview linear
;name "Overdrive..."
;action "Applying Overdrive..."
;author "utz/irrlicht project"
;copyright "Released under terms of the MIT License"

;control preamp "Pre-Amp level (%)" real "" 100 0 1000
;control postamp "Post-Amp level (db)" real "" -3 -10 0
; Convert % to linear

(clip (mult s (/ preamp 100.0)) (db-to-linear postamp))
