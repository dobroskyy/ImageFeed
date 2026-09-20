//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Максим on 20.09.2026.
//

import UIKit

final class ImagesListCell: UITableViewCell {

    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        cellImage.layer.cornerRadius = 16
        cellImage.layer.masksToBounds = true
    }

}
