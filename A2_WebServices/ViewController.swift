//
//  ViewController.swift
//  A2_WebServices
//
//  Created by Cambrian on 2023-01-25.
//

import UIKit

class ViewController: UITableViewController {
    
    var breeds: [String:[String]] = [:]
    var keys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllDogBreeds()
    }
    
    func getAllDogBreeds(){
        Task{
            do{
                self.breeds = try await WebService.getDogBreed(urlString: APIUrl.shared.allDogsAPI)
                self.keys = breeds.keys.sorted(by: <)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let err{
                print("something went wrong: \(err)")
            }
        }
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return breeds.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfSubbreed = 1
        if breeds[keys[section]]!.count>0 {
            numberOfSubbreed = breeds[keys[section]]!.count + 1
        }
        return numberOfSubbreed
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCellIdentifier", for: indexPath) as! DogsListTableViewCell
        let breed = keys[indexPath.section]
        
        if breeds[breed]!.count > 0
            && indexPath.row != 0{
            cell.breedName.text = "\(breed):"
            cell.subBreedName.text = breeds[breed]![indexPath.row-1]
        } else {
            cell.breedName.text = breed
            cell.subBreedName.alpha = 0
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

