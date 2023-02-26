//
//  FullImageVC.swift
//  birlasoftONE
//
//  Created by Dharmendra Chaudhary on 26/02/20.
//  Copyright © 2020 Birlasoft Ltd. All rights reserved.
//

import UIKit
import Kingfisher

class FullImageVC: UIViewController , UIScrollViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageUrl:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = imageUrl {
            imageView.kf.setImage(with: url)
        }
        
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
