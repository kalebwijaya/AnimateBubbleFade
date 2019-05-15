//
//  ViewController.swift
//  AnimateBubbleFade
//
//  Created by Kaleb Wijaya on 15/05/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bubble: UIView!
    var flag:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubble.layer.cornerRadius = bubble.frame.width/2
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.bubble.addGestureRecognizer(gesture)
        
    }
    
    func fadeOut(view: UIView){
        view.transform = CGAffineTransform(scaleX: 5, y: 5)
        view.backgroundColor = UIColor(displayP3Red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue:
            CGFloat(Float.random(in: 0...1)), alpha: 0)
    }
    
    func fadeIn(view: UIView){
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
        view.backgroundColor = UIColor(displayP3Red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue:
            CGFloat(Float.random(in: 0...1)), alpha: 1)
    }
    
    func move(view: UIView) {
        let x = Int.random(in: 80 ... 150)
        let y = Int.random(in: 100 ... 300)
        if(flag){
            view.center.x += CGFloat(x)
            view.center.y += CGFloat(y)
            flag = false
        }else{
            view.center.x -= CGFloat(x)
            view.center.y -= CGFloat(y)
            flag = true
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, animations: {
            self.fadeOut(view: self.bubble)
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveLinear, animations: {
                    self.move(view: self.bubble)
                    self.fadeIn(view: self.bubble)
                })
            }
        }
    }

}

