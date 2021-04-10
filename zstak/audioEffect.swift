import Foundation
import AVFoundation
var player: AVAudioPlayer!
func play(_ name: String){
    let url = Bundle.main.url(forResource:name,  withExtension: "mp3")
    guard url != nil else{
        return
    }
    do{
        player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    }catch{
        print("error")
    }
    
}
func stop(){
    player.stop()
    
}
