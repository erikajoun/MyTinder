//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Hye Lim Joun on 4/13/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  var photo: UIImage?
  @IBOutlet weak var profileImageView: UIImageView!
  
  @IBAction func onDone(_ sender: UIButton) {
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let cardsViewController = storyBoard.instantiateViewController(withIdentifier: "CardsViewController") as! CardsViewController
    self.present(cardsViewController, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    profileImageView.image = photo
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
