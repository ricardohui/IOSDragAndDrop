//
//  ViewController.swift
//  DragnDrop
//
//  Created by Ricardo on 27/12/2015.
//  Copyright © 2015 Standard University. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DroppableDelegate {
    @IBOutlet weak var binImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let halfSizeOfView = 25.0
        let maxViews = 25
        let insetSize = CGRectInset(self.view.bounds, CGFloat(Int(2 * halfSizeOfView)), CGFloat(Int(2 * halfSizeOfView))).size
        
        // Add the Views
        for i in 0..<maxViews {
            var pointX = CGFloat(UInt(arc4random() %
                UInt32(UInt(insetSize.width))))
            var pointY = CGFloat(UInt(arc4random() %
                UInt32(UInt(insetSize.height))))
            
            var newView = MyView(frame: CGRectMake(pointX, pointY, 50, 50))
            newView.delegate = self
            self.view.addSubview(newView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func doWhenTouchesEnded(view: UIView) {
        if (CGRectContainsPoint(binImageView.frame, view.frame.origin)){
            view.removeFromSuperview()
        }else{
            
        }
    }
}

