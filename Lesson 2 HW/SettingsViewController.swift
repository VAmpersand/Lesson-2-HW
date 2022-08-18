//
//  SettingsViewController.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

final class SettingsViewController: BaseViewController {

    private let durationTextField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 0.5
        field.placeholder = "Duration"
        return field
    }()

    private var duration = 0
    weak var delegate: SettingDurationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        [
            topLabel,
            durationTextField,
            button,
        ].forEach(stackView.addArrangedSubview)

        topLabel.text = "Set duration"

        button.setTitle("Ok", for: .normal)
        button.addTarget(self, action: #selector(okButtonHandler), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        view.endEditing(true)
    }

    @objc func okButtonHandler() {
        guard let duration = Int(durationTextField.text ?? "") else { return }

        delegate?.set(duration: duration)
    }
}
