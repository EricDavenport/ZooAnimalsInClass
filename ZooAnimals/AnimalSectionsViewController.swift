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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            fatalError("unable to deuque AnimalsSectionViewCOntroller Cell")
        }
        let animal = animalClasifications[indexPath.section][indexPath.row]
        
        cell.configureCell(for: animal)
        
        return cell
    }
}

extension AnimalSectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
