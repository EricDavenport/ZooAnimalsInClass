//
//  AnimalDetailViewController.swift
//  ZooAnimals
//
//  Created by Eric Davenport on 11/20/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalClassification: UILabel!
    @IBOutlet weak var animalInfoTextView: UITextView!
    @IBOutlet weak var animalOriginLabel: UILabel!
    
    
    var animal: ZooAnimal?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let zooAnimal = animal else {
            fatalError("COuldn't set zooAnimal object, check prepare for segue.")
        }
        
        navigationItem.title = zooAnimal.name
        animalImageView.image = UIImage(named: zooAnimal.imageNumber.description)
        animalClassification.text = zooAnimal.classification
        animalInfoTextView.text = zooAnimal.info
        animalOriginLabel.text = zooAnimal.origin
    }
    
    


}
