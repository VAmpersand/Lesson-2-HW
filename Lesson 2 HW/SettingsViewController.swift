//
//  SettingsViewController.swift
//  Lesson 2 HW
//
//  Created by Viktor Prikolota on 18.08.2022.
//

import UIKit

final class SettingsViewController: UIViewController {

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 50
        return view
    }()

    private let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Set duration"
        return label
    }()

    private let durationTextField: UITextField = {
        let field = UITextField()
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.borderWidth = 0.5
        field.placeholder = "Duration"
        return field
    }()

    private let okButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Ok", for: .normal)
        return button
    }()

    private var duration = 0
    weak var delegate: SettingDurationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40)
        ])

        [
            durationLabel,
            durationTextField,
            okButton,
        ].forEach(stackView.addArrangedSubview)

        okButton.addTarget(self, action: #selector(okButtonHandler), for: .touchUpInside)
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
