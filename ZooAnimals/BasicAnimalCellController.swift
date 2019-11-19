//
//  BasicAnimalCellController.swift
//  ZooAnimals
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class BasicAnimalCellController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {
        didSet {  // property observer - when property gets set 9 when animals is set ) - reload the tableView
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadDate()
    }
    
    func loadDate() {
        animals = ZooAnimal.zooAnimals
    }
   
    
}

extension BasicAnimalCellController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        
        // get current animal
        let animal = animals[indexPath.row]
        
        // configure cell to be "subtitle"
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.origin
        cell.imageView?.image = UIImage(named: animal.imageNumber.description)
        
        return cell
    }
    
    
}
