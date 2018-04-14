//
//  CardsViewController.swift
//  Tinder
//
//  Created by Hye Lim Joun on 4/13/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  
  var cardInitialCenter: CGPoint!
  var cardInitialRotation: CGAffineTransform!
  var rotationSpeed = 1.0

  @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
    let imageView = sender.view as! UIImageView
    let translation = sender.translation(in: view)
    let velocity = sender.velocity(in: view)
    let location = sender.location(in: view)
    let imageY = view.frame.origin.y
    let imageHeight = view.frame.height
    let imageHalf = 210
    
    //print("translation \(translation)")
    //print("velocity \(velocity)")
    print("location \(location)")
    
    if sender.state == .began {
      cardInitialCenter = imageView.center
      cardInitialRotation = imageView.transform
      print("began")
      
      if(location.y >= CGFloat(imageHalf)) {
        rotationSpeed = -1
      }
      else {
        rotationSpeed = 1
      }
      
    } else if sender.state == .changed {
      imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
      print("changed")
      
      // Rotation
      if(velocity.x > 0) {
        imageView.transform = imageView.transform.rotated(by: CGFloat(rotationSpeed * Double.pi / 180))
      }
      else if (velocity.x < 0) {
        imageView.transform = imageView.transform.rotated(by: CGFloat(-rotationSpeed * Double.pi / 180))
      }
    } else if sender.state == .ended {
      UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                     animations: { () -> Void in
                      imageView.center = self.cardInitialCenter
                      imageView.transform = self.cardInitialRotation
      }, completion: nil)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
