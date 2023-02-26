//
//  NewsDetailsViewController.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import UIKit

class NewsDetailsViewController: UIViewController, NewsDetailsViewProtocol {

    //MARK: - IBOutLets
    @IBOutlet weak var newsImageView: UIImageView!{
        didSet{
            newsImageView.layer.cornerRadius = newsImageView.frame.height/5
        }
    }
    @IBOutlet weak var newsTitleStack: UIStackView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    
    @IBOutlet weak var publishedByStack: UIStackView!
    @IBOutlet weak var publishedByLabel: UILabel!
    
    @IBOutlet weak var sourceStack: UIStackView!
    @IBOutlet weak var sourceLabel: UILabel!
    
    @IBOutlet weak var summaryStack: UIStackView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var dateStack: UIStackView!
    @IBOutlet weak var dateLabel: UILabel!
    

    //MARK: - Properites
    var presenter: NewsDetailsPresenterProtocol?

    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupImageViewTapGesture()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationController()
    }

    //MARK: - Helper Functions
    private func setupNavigationController(){
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupImageViewTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openFullImage))
        newsImageView.isUserInteractionEnabled = true
        newsImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func openFullImage(){
        presenter?.tapOnImageView()
    }
    
    func setupViews(with newsDetails: NewsModel) {
        
        if let firstMedia = newsDetails.media.first,
           let firstMetaData = firstMedia.mediaMetadata.first,
           let url = URL(string: firstMetaData.url) {
            
            newsImageView.kf.setImage(with: url)
            
        }
        
        if !newsDetails.title.isEmpty {
            newsTitleLabel.text = newsDetails.title
            self.title = newsDetails.title
        }else {
            newsTitleStack.isHidden = true
        }
        !newsDetails.byline.isEmpty ? (publishedByLabel.text = newsDetails.byline) : (publishedByStack.isHidden = true)
        !newsDetails.publishedDate.isEmpty ? (dateLabel.text = newsDetails.publishedDate) : (dateStack.isHidden = true)
        !newsDetails.abstract.isEmpty ? (summaryLabel.text = newsDetails.abstract) : (summaryStack.isHidden = true)
        !newsDetails.source.isEmpty ? (sourceLabel.text = newsDetails.source) : (sourceStack.isHidden = true)
        
    }
    
    
}
