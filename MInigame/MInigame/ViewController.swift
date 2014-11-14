//
//  ViewController.swift
//  MInigame
//
//  Created by Student on 11/14/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollisionBehaviorDelegate {
    var ball: UIImageView!
    var barrier: UIView!
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var snap: UISnapBehavior!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            ball = UIImageView(frame: CGRectMake(110, 50, 50, 50))
            var image = UIImage(named: "ball.jpg")
            ball.image = UIImage(named: "ball.jpg")
            self.view.addSubview(ball)
        
        
            animator = UIDynamicAnimator(referenceView: view)
        
        
        let itemBehavior = UIDynamicItemBehavior(items: [ball])
        itemBehavior.elasticity = 0.6
        animator.addBehavior(itemBehavior)
        
        
        barrier = UIView(frame: CGRectMake(0, 300, 20, 100))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        
        collision = UICollisionBehavior(items: [ball,barrier])
        collision.translatesReferenceBoundsIntoBoundary = true
       // collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.collisionDelegate = self
           animator.addBehavior(collision)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        if(snap != nil){
            animator.removeBehavior(snap)
        }
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item:barrier, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
        
    }

}

