//
//  ImageCell.swift
//  ImageLoadingProject
//
//  Created by Teacher on 16.11.2020.
//

import UIKit

class ImageCell: UITableViewCell {
    var imageUrl: URL? {
        didSet {
            loadImage()
        }
    }

    var title: String? {
        didSet {
            customTitleLabel.text = title
        }
    }

    @IBOutlet private var customTitleLabel: UILabel!
    @IBOutlet private var customImageView: UIImageView!

    private func loadImage() {
        // load image
    }
}
