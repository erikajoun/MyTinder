//
//  CardsViewController.swift
//  Tinder
//
//  Created by Hye Lim Joun on 4/13/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
  
  var fadeTransition: FadeTransition!
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  var cardInitialCenter: CGPoint!
  var cardInitialRotation: CGAffineTransform!
  var rotationSpeed = 1.0
  
  @IBAction func didPanImage(_ sender: UIPanGestureRecognizer) {
    let imageView = sender.view as! UIImageView
    let translation = sender.translation(in: view)
    let velocity = sender.velocity(in: view)
    let location = sender.location(in: view)
    let imageHalf = 210
    
    if sender.state == .began {
      cardInitialCenter = imageView.center
      cardInitialRotation = imageView.transform
      
      if(location.y >= CGFloat(imageHalf)) {
        rotationSpeed = -0.6
      }
      else {
        rotationSpeed = 0.6
      }
      
    } else if sender.state == .changed {
      imageView.center = CGPoint(x: cardInitialCenter.x + translation.x, y: cardInitialCenter.y)
      
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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let profileViewController = segue.destination as! ProfileViewController
    
    // Pass on the data to the Detail ViewController
    profileViewController.photo = photoImageView.image
    
    // Set the modal presentation style of your destinationViewController to be custom.
    profileViewController.modalPresentationStyle = UIModalPresentationStyle.custom
    
    // Create a new instance of your fadeTransition.
    fadeTransition = FadeTransition()
    
    // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
    profileViewController.transitioningDelegate = fadeTransition
    
    // Adjust the transition duration. (seconds)
    fadeTransition.duration = 1.0
  }
}
