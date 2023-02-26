//
//  NewsTableViewCell.swift
//  SeenaIOSTask
//
//  Created by Ahmed Khaled on 26/02/2023.
//

import UIKit
import Kingfisher

class NewsTableViewCell: UITableViewCell, NewsCellView {

    //MARK: - IBOutLets
    @IBOutlet weak var newsImageView: UIImageView!{
        didSet{
            newsImageView.layer.cornerRadius = newsImageView.frame.height/5
        }
    }
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var publishedByLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
 
    }
    
    //MARK: - Helper Functions
    func configureCell(viewModel: NewsViewModel) {
        self.newsImageView.kf.setImage(with: viewModel.imageUrl)
        self.newsTitleLabel.text = viewModel.title
        self.publishedByLabel.text = viewModel.publishedBy
        self.publishedDateLabel.text = viewModel.publishedDate
    }
    

    
}
