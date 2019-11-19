//
//  AnimalCell.swift
//  ZooAnimals
//
//  Created by Eric Davenport on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!

    func configureCell(for animal: ZooAnimal) {
        animalImageView.image = UIImage(named: animal.imageNumber.description)
        
        classificationLabel.text = animal.classification
        originLabel.text = animal.origin
        
    }
}
