//
//  ViewController.swift
//  QuickAbdest
//
//  Created by Mustafa Eftekin on 20.08.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var feelsLabel: UILabel!
    @IBOutlet weak var feelsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
    }
    let feels = UIImage(named: "feels.png")
    
    var soundeffect: AVAudioPlayer?
    
    @IBAction func feelsButton(_ sender: UIButton) {
        
        
        feelsButton.setImage(feels, for: .normal)
        feelsLabel.text = ("A B D E S T L E N D I N")

        let path = Bundle.main.path(forResource: "soundeffect.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            soundeffect = try! AVAudioPlayer(contentsOf: url)
            soundeffect?.play()
        } catch {
            print("opps...")
        }
        
        }
    




}

