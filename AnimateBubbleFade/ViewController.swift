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
    var red = CGFloat(Float.random(in: 0...1))
    var blue = CGFloat(Float.random(in: 0...1))
    var green = CGFloat(Float.random(in: 0...1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubble.layer.cornerRadius = bubble.frame.width/2
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.bubble.addGestureRecognizer(gesture)
        
    }
    
    func fadeOut(view: UIView){
        view.transform = CGAffineTransform(scaleX: 5, y: 5)
        view.alpha = 0
    }
    
    func fadeIn(view: UIView){
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
        view.alpha = 1
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
        self.red = CGFloat(Float.random(in: 0...1))
        self.blue = CGFloat(Float.random(in: 0...1))
        self.green = CGFloat(Float.random(in: 0...1))
        
        UIView.animate(withDuration: 0.5, animations: {
            self.fadeOut(view: self.bubble)
        }) { (finished) in
            if finished {
                self.move(view: self.bubble)
                self.bubble.backgroundColor = UIColor(displayP3Red: self.red, green: self.green, blue:
                    self.blue, alpha: 1)
                UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: [.allowUserInteraction], animations: {
                    self.fadeIn(view: self.bubble)
                })
            }
        }
    }

}

