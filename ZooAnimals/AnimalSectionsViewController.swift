//
//  AnimalSectionsViewController.swift
//  ZooAnimals
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalSectionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animalClasifications = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        animalClasifications = ZooAnimal.classificationSections()
    }
    
    
    
}

extension AnimalSectionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalClasifications[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalClasifications.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalClasifications[section].first?.classification
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // alternate left and rigt image cells based on even or odd modulo remainder
        
        var cell: AnimalCell!
        
        if indexPath.section % 2 == 0 { // even
            guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "rightCell", for: indexPath) as? AnimalCell else {
                fatalError("Couldn't deque rightCell properly")
            }
            cell = animalCell
        } else {  // odd
            guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "leftCell", for: indexPath) as? AnimalCell else {
                fatalError("COuldn't deque leftCell properly")
            }
            cell = animalCell
        }
        // get the animal at the  indexPath
        let animal = animalClasifications[indexPath.section][indexPath.row]
        
        // configure the cell uaing the animal object retireved from above
        cell.configureCell(for: animal)
        
        return cell
    }
}

extension AnimalSectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
