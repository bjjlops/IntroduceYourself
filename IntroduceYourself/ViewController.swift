//
//  ViewController.swift
//  IntroduceYourself
//
//  Created by Diego Lopez on 8/29/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var petsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        petsStepper.minimumValue = 0
        petsStepper.maximumValue = 100
        petsStepper.stepValue = 1
        numberOfPetsLabel.text = "\(Int(petsStepper.value))"
    }

    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }

    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        view.endEditing(true)

        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let schoolName = schoolNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex) ?? "First"
        let numberOfPets = numberOfPetsLabel.text ?? "0"
        let morePetsPreference = morePetsSwitch.isOn ? "would" : "would not"

        let introduction = """
        My name is \(firstName) \(lastName), and I attend \(schoolName).
        I am currently in my \(year.lowercased()) year and I own \(numberOfPets) pets.
        I \(morePetsPreference) like more pets.
        """

        let alertController = UIAlertController(
            title: "My Introduction",
            message: introduction,
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "Nice to meet you!", style: .default)

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
