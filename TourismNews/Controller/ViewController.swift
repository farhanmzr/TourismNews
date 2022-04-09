//
//  ViewController.swift
//  TourismNews
//
//  Created by Farhan Mazario on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var tourismTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgProfile.setCircle()
        
        tourismTableView.dataSource = self
        tourismTableView.delegate = self
        tourismTableView.register(UINib(nibName: "TourismTableViewCell", bundle: nil), forCellReuseIdentifier: "TourismCell")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tappedMe))
        imgProfile.addGestureRecognizer(tap)
        imgProfile.isUserInteractionEnabled = true
    }
    
    @objc func tappedMe(){
        performSegue(withIdentifier: "moveProfile", sender: imgProfile)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    //Hide Navigation Controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wisatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TourismCell", for: indexPath) as? TourismTableViewCell {
            let wisata = wisatas[indexPath.row]
            cell.nameTourism.text = wisata.wisataName
            cell.descTourism.text = wisata.wisataDesc
            cell.pictureTourism.image = wisata.wisataPicture
            
            cell.pictureTourism.setRadius()
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detail.wisata = wisatas[indexPath.row]
        self.navigationController?.pushViewController(detail, animated: true)
    }
}

//for custom corner image
extension UIImageView {
    func setCircle() {
        self.layer.cornerRadius = (self.frame.height / 2)
        self.layer.masksToBounds = true
    }
    func setRadius() {
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
    }
}
