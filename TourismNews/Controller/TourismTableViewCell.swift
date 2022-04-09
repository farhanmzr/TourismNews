//
//  TourismTableViewCell.swift
//  TourismNews
//
//  Created by Farhan Mazario on 05/04/22.
//

import UIKit

class TourismTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureTourism: UIImageView!
    @IBOutlet weak var nameTourism: UILabel!
    @IBOutlet weak var descTourism: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
