//
//  ViewController.swift
//  STFU
//
//  Created by Hadar Goldstein on 11/6/18.
//  Copyright © 2018 Hadar Goldstein. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class ViewController: UIViewController {
    //creat instance of AVAudioPlayer
    var audioPlayer: AVAudioPlayer!
    
    //creat sound function
    func playSoundWith(fileName: String, fileExtension: String)->Void{
        let audioSourceURL:  URL!
        audioSourceURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension)
        do{
            audioPlayer = try AVAudioPlayer.init(contentsOf: audioSourceURL!)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch{
            print(error)
        }
    }
 
    
  
    @IBOutlet var optButtons: [UIButton]!
    
    
    @IBAction func handleSelection(_ sender : UIButton){
        optButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                 button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
                })
           
        }
    }
    
    enum Options: String{
        case stfu1 = "STFU 1"
        case stfu2 = "STFU 2"
        case stfu3 = "STFU 3"
    }
    
    @IBOutlet weak var Label: UILabel!
    var file:String = "STFU_1.1m"
    @IBAction func optChosen(_ sender: UIButton) {
        guard let title = sender.currentTitle, let opt = Options(rawValue: title) else{
            return
        }
        switch opt{
        case .stfu1:
            Label.text = "STFU 1"
           file = "STFU_1.1m"
        case .stfu2:
            Label.text = "STFU 2"
            file = "STFU_3.0"
        case .stfu3:
            Label.text = "STFU 3"
            file = "STFUtest"
        }
    
    }
    //IBActions
    @IBAction func Button1(_ sender: Any){
        playSoundWith(fileName: file, fileExtension: "mp3")
        print("playing")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

/*override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
*/
