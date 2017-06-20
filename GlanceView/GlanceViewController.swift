//
//  ViewController.swift
//  GlanceView
//
//  Created by Nikhil on 6/16/17.
//  Copyright © 2017 Nikhil. All rights reserved.
//

import UIKit

public enum GestureState {
  case singleTap
  case doubleTap
}

public enum GlanceViewImages : String{
  case genreGroup = "Genre_Group"
  case actionYears = "Action_Multi_Year"
  case hackathonLastLevel = "Hackathon_Last_Level"
  case action = "Action"
  case comedy = "Comedy"
  case drama = "Drama"
  case family = "Family"
}


class GlanceViewController: UIViewController {
  
  //properties
  //by default current state for every view is single tap
  var currentGestureState: GestureState = .singleTap
  //force unwrapping as we have images in the assets
  var animationImagesArray:[UIImage] = [UIImage(named: GlanceViewImages.genreGroup.rawValue)!, UIImage(named: GlanceViewImages.actionYears.rawValue)!,
                                        UIImage(named: GlanceViewImages.hackathonLastLevel.rawValue)!]
  var imageIndex = 0
  let animationDuration: TimeInterval = 0.25
  let switchingInterval: TimeInterval = 3
  var singleTapGesture: UITapGestureRecognizer?
  

  
  //Outlets
  @IBOutlet weak var glanceImageView: UIImageView!
  @IBOutlet weak var glanceView: UIView!
  @IBOutlet weak var ratingImageView: UIImageView!
  @IBOutlet weak var glanceBlurView: UIVisualEffectView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    setUpView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //Set Up View
  private func setUpView(){
    //set up Genre Group
    setUpGenreGroupImage()
    ratingImageView.isHidden = true
    glanceBlurView.isHidden = true
  }

  
  func setUpGenreGroupImage(){
    self.glanceImageView.image = UIImage(named: GlanceViewImages.genreGroup.rawValue)
    //initialize the views and add as subviews on top of image views
    let actionView = setUpOverlayView(frame: CGRect(x:0,y:0, width: 300, height: 320))
    actionView.tag = 1001
    
    singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.actionTapped))
    singleTapGesture?.numberOfTapsRequired = 1
    if let singleTapGesture = singleTapGesture{
      actionView.addGestureRecognizer(singleTapGesture)
    }
    let dramaView = setUpOverlayView(frame: CGRect(x: (actionView.frame.origin.x + actionView.frame.size.width) + 10, y:0, width: 300, height: 320))
    dramaView.tag = 1002
    let comedyView = setUpOverlayView(frame: CGRect(x: (dramaView.frame.origin.x + dramaView.frame.size.width) + 10, y:0, width: 300, height: 320))
    comedyView.tag = 1003
    let romanceView = setUpOverlayView(frame: CGRect(x: 0, y: (actionView.frame.origin.y + actionView.frame.size.height) + 5, width: 300, height: 320))
    romanceView.tag = 1004
    let horrorView = setUpOverlayView(frame: CGRect(x: (romanceView.frame.origin.x + romanceView.frame.size.width) + 10, y: (actionView.frame.origin.y + actionView.frame.size.height) + 5, width: 300, height: 320))
    horrorView.tag = 1005
    let familyView = setUpOverlayView(frame: CGRect(x: (horrorView.frame.origin.x + horrorView.frame.size.width) + 10, y: (actionView.frame.origin.y + actionView.frame.size.height) + 5, width: 300, height: 320))
    familyView.tag = 1006
  }
  
  private func setUpOverlayView(frame: CGRect) -> UIView{
    let overlayView = UIView(frame: frame)
    //add a single tap gesture to the view
    glanceView.addSubview(overlayView)
    glanceView.bringSubview(toFront: overlayView)
    return overlayView
  }
  
  @objc  private func actionTapped(){
    animateImages()
  }
  
  func animateImages(){
    imageIndex = imageIndex < animationImagesArray.count - 1  ? imageIndex + 1 : 0
    CATransaction.begin()
    CATransaction.setAnimationDuration(animationDuration)
    let transition = CATransition()
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromRight
    glanceImageView.layer.add(transition, forKey: kCATransition)
    if animationImagesArray.count > imageIndex{
      glanceImageView.image = animationImagesArray[imageIndex]
//      if imageIndex == 2 {
//        ratingImageView.isHidden = false
//        singleTapGesture =
//      }else {
//        ratingImageView.isHidden = true
//      }
    }
    CATransaction.commit()
  }
}

