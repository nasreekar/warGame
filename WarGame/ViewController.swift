//
//  ViewController.swift
//  WarGame
//
//  Created by Abhijith Sreekar Nalla on 19/6/17.
//  Copyright © 2017 asn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    @IBOutlet weak var dealButton: UIButton!
    var leftScore = 0;
    var rightScore = 0;
    
    
    let cardNames=["card2","card3","card4","card5","card6","card7","card8","card9","card10","jack","queen","king","ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func dealButton(_ sender: UIButton) {
        let leftNumber = Int(arc4random_uniform(13)) //between 0-12
        let rightNumber = Int(arc4random_uniform(13))
        
        leftImageView.image = UIImage(named: cardNames[leftNumber])
        rightImageView.image = UIImage(named: cardNames[rightNumber])
        
        if (leftNumber > rightNumber){
            //leftcard wins
            
            //increment the score
            leftScore+=1
            
            //update the label
            leftScoreLabel.text = String(leftScore)
            
            
        }else if (leftNumber == rightNumber){
            //tie
            
        }else{
            //rightcard wins
            
            //increment the score
            rightScore+=1
            
            //update the label
            rightScoreLabel.text = String(rightScore)
        }
        
        if(leftScore == 10){
            alert(player: "Player")
            dealButton.isEnabled = false;
        }else if(rightScore==10){
            alert(player: "CPU")
            dealButton.isEnabled = false;
        }else{
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(player:String){
        let alert = UIAlertController(title: "Game Over", message: "\(player) Wins", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: { (action) -> Void in
            self.resetInfo()
        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetInfo(){
        leftScore = 0;
        rightScore = 0;
        leftScoreLabel.text = "0"
        rightScoreLabel.text = "0"
        dealButton.isEnabled = true;
        leftImageView.image = UIImage(named: "back")
        rightImageView.image = UIImage(named: "back")
    }


}

