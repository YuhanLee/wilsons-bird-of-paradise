//
//  ViewController.swift
//  wilson-bird-of-paradise
//
//  Created by Yuhan Lee on 2018-01-26.
//  Copyright © 2018 Yuhan Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var count = 0
    @IBOutlet weak var clickLabel: UILabel!
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var featherBtn: UIButton!
    @IBOutlet weak var wilsonBird: UIImageView!
    @IBOutlet weak var seeFeathersLabel: UILabel!
    @IBOutlet weak var birdFeather: UIImageView!
    
    var player: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundPath = Bundle.main.path(forResource: "bird-chirp", ofType:"wav")!
        let url = URL(fileURLWithPath: soundPath)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func powerBtnPressed(_ sender: Any) {
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        cloudHolder.isHidden = false
        clickLabel.isHidden = true
        
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.wilsonBird.frame = CGRect(x:0, y:10, width:375, height: 402)
        }) { (finished) in
            self.seeFeathersLabel.isHidden = false
            self.featherBtn.isHidden = false
        }
    }
    
    
    @IBAction func showFeathers(_ sender: Any) {
        if count % 2 == 0 {
            wilsonBird.isHidden = true
            birdFeather.isHidden = false
            
            UIView.animate(withDuration: 2.3, animations: {
                self.birdFeather.frame = CGRect(x:0, y:10, width:375, height: 402)
            }) {(finished) in
            }
        }
        else {
            birdFeather.isHidden = true
            wilsonBird.isHidden = false
            player.play()
        }
        count  = count + 1
    }
}
    


