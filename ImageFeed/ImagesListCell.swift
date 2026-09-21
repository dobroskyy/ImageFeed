//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Максим on 20.09.2026.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"

    private static let gradientHeight: CGFloat = 70

    @IBOutlet private var cellImage: UIImageView?
    @IBOutlet private var dateLabel: UILabel?
    @IBOutlet private var likeButton: UIButton?

    private let dateGradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.black.withAlphaComponent(0).cgColor,
                        UIColor.black.withAlphaComponent(0.6).cgColor,
                        UIColor.black.cgColor]
        layer.locations = [0, 0.4, 1]
        layer.actions = ["position": NSNull(),
                         "bounds": NSNull()]
        return layer
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        cellImage?.layer.cornerRadius = 16
        cellImage?.layer.masksToBounds = true
        cellImage?.layer.addSublayer(dateGradientLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard let cellImage else { return }

        dateGradientLayer.frame = CGRect(x: 0,
                                         y: cellImage.bounds.height - Self.gradientHeight,
                                         width: cellImage.bounds.width,
                                         height: Self.gradientHeight)
    }

    func configure(image: UIImage?, date: String, isLiked: Bool) {
        cellImage?.image = image
        dateLabel?.text = date

        let likeImage = UIImage(named: isLiked ? "like_button_on" : "like_button_off")
        likeButton?.setImage(likeImage, for: .normal)
    }
}
