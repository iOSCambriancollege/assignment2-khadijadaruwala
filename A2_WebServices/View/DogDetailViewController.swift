//
//  DogDetailViewController.swift
//  Assignment-2-CMP-1000
//
//  Created by Khadija Daruwala on 2023-02-01.
//

import UIKit

class DogDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedImageView: UIImageView!
    var breedName: String?
    var breedImages = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = breedName {
            getBreedImage(breedName: name)
        }
    }
    
        func getBreedImage(breedName:String){
            Task{
                do{
                    breedImages = try await WebService.getDogImage(urlString: APIUrl.shared.breedImageAPI + "\(breedName)/images")
                    DispatchQueue.main.async {
                        self.nameLabel.text = breedName
                        self.breedImageView.load(url: URL(string: self.breedImages[0])!)
                    }
                } catch let err{
                    print("something went wrong: \(err)")
                }
            }
        }

}
