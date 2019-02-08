//
//  ViewController.swift
//  tictac
//
//  Created by Momen on 9/17/17.
//  Copyright © 2017 Momen. All rights reserved.
//Tic Tac Tic

import UIKit
class ViewController: UIViewController {

    @IBOutlet var butt1: UIButton!
    
    @IBOutlet var butt2: UIButton!
    
    @IBOutlet var butt3: UIButton!
    
    @IBOutlet var butt4: UIButton!
    
    @IBOutlet var butt5: UIButton!
    
    @IBOutlet var butt6: UIButton!
    
    @IBOutlet var butt7: UIButton!
    
    @IBOutlet var butt8: UIButton!
    
    @IBOutlet var butt9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnselectaction(_ sender: Any) {
        let btnselsctoer = sender as! UIButton
        playGame(buselect: btnselsctoer)
    }
      var activeplayer = 1
      var player1 = [Int]()
      var player2 = [Int]()
    func playGame(buselect:UIButton){
        if (activeplayer == 1) {
             buselect.setTitle("X", for: UIControlState.normal)
            buselect.backgroundColor = UIColor(red: 43/255, green: 106/255, blue: 9/255, alpha: 1)
            player1.append(buselect.tag)
            activeplayer = 2
            AutoPlay()
        }else{
            buselect.setTitle("O", for: UIControlState.normal)
            buselect.backgroundColor = UIColor(red: 32/255, green: 192/255, blue: 243/255, alpha: 1)
            player2.append(buselect.tag)
            activeplayer = 1
        }
        buselect.isEnabled = false
        findwiner()
    }
    func findwiner(){
      var winer = -1
        //row1
        if(player1.contains(1) && player1.contains(2) && player1.contains(3)){
            winer = 1
        }
        if(player2.contains(1) && player2.contains(2) && player2.contains(3)){
            winer = 2
        }
        //row2
        if(player1.contains(4) && player1.contains(5) && player1.contains(6)){
            winer = 1
        }
        if(player2.contains(4) && player2.contains(5) && player2.contains(6)){
            winer = 2
        }
        //row3
        if(player1.contains(7) && player1.contains(8) && player1.contains(9)){
            winer = 1
        }
        if(player2.contains(7) && player2.contains(8) && player2.contains(9)){
            winer = 2
        }
        //colam1
        if(player1.contains(1) && player1.contains(4) && player1.contains(7)){
            winer = 1
        }
        if(player2.contains(1) && player2.contains(4) && player2.contains(7)){
            winer = 2
        }
        //colam2
        if(player1.contains(2) && player1.contains(5) && player1.contains(8)){
            winer = 1
        }
        if(player2.contains(2) && player2.contains(5) && player2.contains(8)){
            winer = 2
        }
        //colam3
        if(player1.contains(3) && player1.contains(6) && player1.contains(9)){
            winer = 1
        }
        if(player2.contains(3) && player2.contains(6) && player2.contains(9)){
            winer = 2
        }
        if (winer != -1){
        var msg = ""
            if(winer == 1){
              msg = "Player one is win"
            }else{
                msg = "Player tow is win"
            } // show alert
            
             let alert = UIAlertController(title:"WinerPlayer", message: msg, preferredStyle:UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default
                , handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default
                , handler: nil))

            self.present(alert, animated: true, completion: nil)
        }

    }
    func AutoPlay(){
     var emptycells = [Int]()
        for index in 1...9{
            if !(player1.contains(index)||player2.contains(index)){
              emptycells.append(index)
            }
        }
        let ranom = arc4random_uniform(UInt32(emptycells.count))
        let cellId = emptycells[Int(ranom)]
        var buttselect :UIButton?
        switch cellId {
        case 1:
            buttselect = butt1
        case 2:
            buttselect = butt2
        case 3:
            buttselect = butt3
        case 4:
            buttselect = butt4
        case 5:
            buttselect = butt5
        case 6:
            buttselect = butt6
        case 7:
            buttselect = butt7
        case 8:
            buttselect = butt8
        case 9:
            buttselect = butt9
        default:
            buttselect = butt1
        }
        playGame(buselect: buttselect!)
    }
}

