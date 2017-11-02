//
//  ViewController.swift
//  Hustle On
//
//  Created by Neil on 02/11/2017.
//  Copyright © 2017 Neil. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var cloudHolderView: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var hustleLabel: UILabel!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var powerButton: UIButton!
    
    var player: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")
        let url = URL(fileURLWithPath: path!)
        do{
            player = try AVAudioPlayer(contentsOf: url)
        }catch{
            print(error.localizedDescription)
        }
        
    }
    

    @IBAction func userDidTappPowerButton(_ sender: Any) {
        cloudHolderView.isHidden = false
        darkBlueBG.isHidden = true
        powerButton.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 80, width: self.view.frame.width, height: self.view.frame.height - 100)
        }) { (finished) in
            self.hustleLabel.isHidden = false
            self.onLabel.isHidden = false
        }
        
    }
    
}

