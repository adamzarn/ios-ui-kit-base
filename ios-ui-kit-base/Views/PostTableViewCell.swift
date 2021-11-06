//
//  PostTableViewCell.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 11/5/21.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    var viewModel: PostTableViewCellViewModel! {
        didSet {
            nameLabel.text = viewModel.nameLabelText
            timeLabel.text = viewModel.timeLabelText
            postLabel.text = viewModel.postLabelText
            viewModel.getProfilePhoto(completion: { image in
                DispatchQueue.main.async {
                    self.profilePhotoImageView.image = image
                }
            })
        }
    }
    
    func setup(with viewModel: PostTableViewCellViewModel) {
        self.viewModel = viewModel
        configureProfilePhotoImageView()
    }
    
    private func configureProfilePhotoImageView() {
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.width/2
        profilePhotoImageView.layer.borderColor = UIColor.separator.cgColor
        profilePhotoImageView.layer.borderWidth = 1
        profilePhotoImageView.contentMode = .scaleAspectFill
    }
}
