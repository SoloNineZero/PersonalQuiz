//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        let animal = getAnimal()
        updateUI(animal)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

// MARK: Private Methods
private extension ResultViewController {
    func getAnimal() -> Animal? {
        return Dictionary(grouping: answers, by: { $0.animal })
            .sorted(by: { $0.value.count > $1.value.count })
            .first?.key
    }
    
    func updateUI(_ animal: Animal?) {
        animalLabel.text = "Вы - \(animal?.rawValue ?? " ")!"
        definitionLabel.text = animal?.definition ?? ""
    }
}
