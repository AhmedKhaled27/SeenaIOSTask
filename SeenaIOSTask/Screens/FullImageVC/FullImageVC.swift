//
//  FullImageVC.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//


import UIKit
import Kingfisher

class FullImageVC: UIViewController , UIScrollViewDelegate {

    //MARK: - IBOutLets
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Properites
    var stringImageUrl:String?

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        if let stringUrl = stringImageUrl,
           let url = URL(string: stringUrl) {

            imageView.kf.setImage(with: url)
            
        }
        
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
    
}
