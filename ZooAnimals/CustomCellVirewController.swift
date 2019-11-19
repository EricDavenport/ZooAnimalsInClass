//
//  CustomCellVirewController.swift
//  ZooAnimals
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CustomCellVirewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // data for tableView
    var animals = [ZooAnimal]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()   // updqates animals array - causing didSet to run
    }
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }


}

extension CustomCellVirewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count  // amount if rows to show if only 1 section or more
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError("failed to deque animalCell")
        }
        
        let animal = animals[indexPath.row]
        
        // configure cell
        cell.configureCell(for: animal)
        
        return cell
    }
    
}

extension CustomCellVirewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
