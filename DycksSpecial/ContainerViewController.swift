//
//  ContainerViewController.swift
//  DycksSpecial
//
//  Created by Evan Baumgardner on 10/17/15.
//  Copyright © 2015 Evan Baumgardner. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var leftViewController: UIViewController? {
        willSet{
            if self.leftViewController != nil {
                if self.leftViewController!.view != nil {
                    self.leftViewController!.view!.removeFromSuperview()
                }
                self.leftViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            
            self.view!.addSubview(self.leftViewController!.view)
            self.addChildViewController(self.leftViewController!)
        }
    }

    
    
    var rightViewController: UIViewController? {
        willSet {
            if self.rightViewController != nil {
                if self.rightViewController!.view != nil {
                    self.rightViewController!.view!.removeFromSuperview()
                }
                self.rightViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            
            self.view!.addSubview(self.rightViewController!.view)
            self.addChildViewController(self.rightViewController!)
        }
    }
    
    var menuShown: Bool = false

    // put these into DyckMapViewController then link them in storyboard and stuff again
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        
        let theTouchStartLocation: CGPoint = sender.locationOfTouch(0, inView: self.view)
        let x = theTouchStartLocation.x
        if( x < 15 )
        {
           // self.parentViewController!.showMenu
            
            showMenu()
        }
        
    }
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        hideMenu()
    }

    func showMenu() {
        UIView.animateWithDuration(0.3, animations: {
            self.rightViewController!.view.frame = CGRect(x: self.view.frame.origin.x + 235, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShown = true
        })
    }
    
    func hideMenu() {
        UIView.animateWithDuration(0.3, animations: {
            self.rightViewController!.view.frame = CGRect(x: 0, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShown = false
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mapVC: DyckMapViewController = storyboard.instantiateViewControllerWithIdentifier("mapScreen") as! DyckMapViewController
        
        let menuVC: SlideMenuViewController = storyboard.instantiateViewControllerWithIdentifier("slideMenu")as! SlideMenuViewController
        
        self.leftViewController = menuVC
        self.rightViewController = mapVC
    }
    
}