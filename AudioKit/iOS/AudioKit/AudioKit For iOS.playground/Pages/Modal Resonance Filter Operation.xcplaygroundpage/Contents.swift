//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Modal Resonance Filter Operation
//:
import PlaygroundSupport
import AudioKit

let bundle = Bundle.main()
let file = bundle.pathForResource("drumloop", ofType: "wav")
var player = AKAudioPlayer(file!)
player.looping = true

let frequency = AKOperation.sineWave(frequency: 0.3).scale(minimum: 200, maximum: 1200)

let filter  = AKOperation.input.modalResonanceFilter(frequency: frequency, qualityFactor: 50) * 0.2

let effect = AKOperationEffect(player, operation: filter)

AudioKit.output = effect
AudioKit.start()
player.play()

PlaygroundPage.current.needsIndefiniteExecution = true
//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
