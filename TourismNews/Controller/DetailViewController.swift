//
//  DetailViewController.swift
//  TourismNews
//
//  Created by Farhan Mazario on 05/04/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photoTourism: UIImageView!
    @IBOutlet weak var titleTourism: UILabel!
    @IBOutlet weak var locationTourism: UILabel!
    @IBOutlet weak var likeTourism: UILabel!
    @IBOutlet weak var latitudeTourism: UILabel!
    @IBOutlet weak var longitudeTourism: UILabel!
    @IBOutlet weak var descTourism: UILabel!
    
    var wisata: Wisata?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = wisata {
            photoTourism.image = result.wisataPicture
            titleTourism.text = result.wisataName
            locationTourism.text = result.wisataLocation
            likeTourism.text = "\(result.wisataLike)"
            latitudeTourism.text = "\(result.wisataLatitude)"
            longitudeTourism.text = "\(result.wisataLongitude)"
            descTourism.text = result.wisataDesc
        }
    }
    
    //Show Navigation Controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = false
    }
}
