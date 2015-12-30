//
//  MyView.swift
//  DragnDrop
//
//  Created by Ricardo on 27/12/2015.
//  Copyright © 2015 Standard University. All rights reserved.
//

import UIKit

class MyView: UIView {
    //var lastLocation:CGPoint = CGPointMake(0, 0)
    var delegate: DroppableDelegate?
    
     override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        let panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.gestureRecognizers = [panRecognizer] // register the pan gesture recognizer to the view
        
        //randomize view color
        let blueValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let greenValue = CGFloat(Int(arc4random() % 255)) / 255.0
        let redValue = CGFloat(Int(arc4random() % 255)) / 255.0
        
        self.backgroundColor = UIColor(red:redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        let translation  = recognizer.translationInView(self.superview!)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        
        }
        
        //self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.superview!) // reset the translation
        //delegate?.doWhenTouchesEnded(self)
        
        if (recognizer.state == UIGestureRecognizerState.Ended){
            delegate?.doWhenTouchesEnded(self)
        }
        
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        //lastLocation = self.center
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       //call method, this view as parameter
        //delegate?.doWhenTouchesEnded(self)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        //delegate?.doWhenTouchesEnded(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    
    override func touchesEstimatedPropertiesUpdated(touches: Set<NSObject>) {
        
    }
}

protocol DroppableDelegate{
    func doWhenTouchesEnded(view: UIView)
}
