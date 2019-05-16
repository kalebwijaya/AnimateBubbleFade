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
    var red:CGFloat!
    var blue:CGFloat!
    var green:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bubble.layer.cornerRadius = bubble.frame.width/2
        firstAnimate()
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        bubble.addGestureRecognizer(gesture)
    }
    
    func firstAnimate(){
        bubble.transform = CGAffineTransform(scaleX: 7, y: 7)
        bubble.alpha = 0
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
            self.fadeIn(view: self.bubble)
        })
    }
    
    func fadeOut(view: UIView){
        view.transform = CGAffineTransform(scaleX: 7, y: 7)
        view.alpha = 0
    }
    
    func fadeIn(view: UIView){
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
        view.alpha = 1
    }
    
    func changeColor(){
        red = CGFloat(Float.random(in: 0...1))
        blue = CGFloat(Float.random(in: 0...1))
        green = CGFloat(Float.random(in: 0...1))
        bubble.backgroundColor = UIColor(displayP3Red: self.red, green: self.green, blue:
            self.blue, alpha: 1)
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
                self.move(view: self.bubble)
                self.changeColor()
                UIView.animate(withDuration: 2, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.allowUserInteraction], animations: {
                    self.fadeIn(view: self.bubble)
                })
            }
        }
    }

}
