//
//  ViewController.swift
//  Example
//
//  Created by Lasha Efremidze on 3/8/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import SpriteKit
import Magnetic

class HomeViewController: UIViewController, MagneticDelegate {

  
  @IBOutlet weak var magneticView: MagneticView! {
    didSet {
      magnetic.magneticDelegate = self
      magneticView.showsDrawCount = true
      magneticView.backgroundColor = .red
      magneticView.showsQuadCount = true
      magneticView.showsFPS = false
    }
  }
  
  @IBOutlet weak var magneticView2: MagneticView! {
    didSet {
      magnetic.magneticDelegate = self
      magneticView.showsDrawCount = true
      magneticView.showsQuadCount = true
      
    }
  }
  
  @IBOutlet weak var magneticView3: MagneticView! {
    didSet {
      magnetic.magneticDelegate = self
      magneticView.showsDrawCount = true
      magneticView.showsQuadCount = true
      
    }
  }
  
  @IBOutlet weak var magneticView4: MagneticView! {
    didSet {
      magnetic.magneticDelegate = self
      magneticView.showsDrawCount = true
      magneticView.showsQuadCount = true
    }
  }
  
  
  var magnetic: Magnetic {
    return magneticView.magnetic
  }
  
  var magnetic2: Magnetic {
    return magneticView2.magnetic
  }
  
  var magnetic3: Magnetic {
    return magneticView3.magnetic
  }
  
  var magnetic4: Magnetic {
    return magneticView4.magnetic
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    magneticView.isHidden = true
//    magneticView2.isHidden = true
//    magneticView3.isHidden = true
//    magneticView4.isHidden = true
    
//    magneticView.frame = CGRect(x: -40,y: 50, width: 300,height: 300)
//    magneticView2.frame = CGRect(x: -40, y: (magneticView.frame.origin.y + magneticView.frame.size.width) + 10, width: 300,height: 300)
//    magneticView3.frame = CGRect(x: (self.magneticView.frame.origin.x + self.magneticView.frame.size.width) + 10,y: magneticView.frame.origin.y, width: 300,height:300)
//    magneticView4.frame = CGRect(x: (self.magneticView.frame.origin.x + self.magneticView.frame.size.width) + 10,y: magneticView.frame.origin.y, width: 300,height: 300)
    
    magneticView.makeCircular()
    magneticView2.makeCircular()
    magneticView3.makeCircular()
    magneticView4.makeCircular()
    
    for _ in 0..<8 {
      add(nil)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIView.animate(withDuration: 0.5, animations: {
      
    })
    
//    UIView.animate(withDuration: <#T##TimeInterval#>, animations: <#T##() -> Void#>)
//    
//    UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIViewAnimationOptions#>, animations: //, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
  }
  
  @IBAction func add(_ sender: UIControl?) {
    
    let name = UIImage.names.randomItem()
    let color = UIColor.colors.randomItem()
    let node = Node(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
    magnetic.addChild(node)
    
    let name2 = UIImage.names.randomItem()
    let color2 = UIColor.colors.randomItem()
    let node2 = Node(text: name2.capitalized, image: UIImage(named: name2), color: color2, radius: 40)
    magnetic2.addChild(node2)

    let name3 = UIImage.names.randomItem()
    let color3 = UIColor.colors.randomItem()
    let node3 = Node(text: name3.capitalized, image: UIImage(named: name3), color: color3, radius: 40)
    magnetic3.addChild(node3)

    
    let name4 = UIImage.names.randomItem()
    let color4 = UIColor.colors.randomItem()
    let node4 = Node(text: name4.capitalized, image: UIImage(named: name4), color: color4, radius: 40)
    magnetic4.addChild(node4)

  }
  
  // MARK: - MagneticDelegate
  func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
    print("didSelect -> \(node)")
  }
  
  func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
    print("didDeselect -> \(node)")
  }
  
}

// MARK: - ImageNode
class ImageNode: Node {
  override var image: UIImage? {
    didSet {
      sprite.texture = image.map { SKTexture(image: $0) }
    }
  }
  override func selectedAnimation() {}
  override func deselectedAnimation() {}
}


extension UIView {
  func makeCircular() {
    self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
    self.clipsToBounds = true
  }
}
