//
//  CarLoanController.swift
//  Clementine
//
//  Created by Nick Chekmazov on 11.10.2020.
//

import UIKit

final class CarLoanController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        configure()
    }
    
    private lazy var titleLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title1
        label.textColor = UIColor.styleGuide.grey100

        return label
    }()
    
    private lazy var desire1Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.blue60

        return label
    }()
    
    private lazy var desire2Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey100

        return label
    }()
    
    private lazy var minDesireLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey60

        return label
    }()
    
    private lazy var maxDesireLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey60

        return label
    }()
    
    private lazy var term1Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.blue60

        return label
    }()
    
    private lazy var term2Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey100

        return label
    }()
    
    private lazy var minTermLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey60

        return label
    }()
    
    private lazy var maxTermLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey60

        return label
    }()
    
    
    private lazy var additional1TermLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.blue60

        return label
    }()
    
    private lazy var additional2TermLabel: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey100

        return label
    }()
    
    private lazy var rate1Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.blue60

        return label
    }()
    
    private lazy var rate2Label: UILabel = {

        let label = UILabel()

        label.font = UIFont.styleGuide.title4
        label.textColor = UIColor.styleGuide.grey100

        return label
    }()
    
    private lazy var sumSlider: UISlider = {

        let slider = UISlider()

        return slider
    }()
    
    private lazy var yearSlider: UISlider = {

        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 7
        slider.value = 5
        
        return slider
    }()
    
    private lazy var confirmButton: UIButton = {

        let button = UIButton()
        button.backgroundColor = UIColor.styleGuide.blue60
        button.titleLabel?.font = UIFont.styleGuide.title4
        button.layer.cornerRadius = 15
        
        return button
    }()
    
    private lazy var checkButton: UIButton = {

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.backgroundColor = UIColor.styleGuide.blue60
        button.titleLabel?.font = UIFont.styleGuide.title4
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    private func configure() {
        
        titleLabel.text = "Оформление заявки"
        desire1Label.text = "Желаемая сумма"
        desire2Label.text = "1 500 000"
        term1Label.text = "Срок кредитования"
        term2Label.text = "5 лет"
        additional1TermLabel.text = "Дополнительные условия"
        additional2TermLabel.text = "С каско"
        rate1Label.text = "Процентная ставка"
        rate2Label.text = "7.5%"
        confirmButton.setTitle("Оформить", for: .normal)
        minDesireLabel.text = "1 500 000"
        maxDesireLabel.text = "10 000 000"
        minTermLabel.text = "1 год"
        maxTermLabel.text = "7 лет"
        
        let desireStack = UIStackView(arrangedSubviews: [
                                minDesireLabel, maxDesireLabel])
        desireStack.alignment = .leading
        desireStack.distribution = .equalCentering
        
        let yearStack = UIStackView(arrangedSubviews: [
                                minTermLabel, maxTermLabel])
        yearStack.alignment = .leading
        yearStack.distribution = .equalCentering
       
        let additionalStack = UIStackView(arrangedSubviews: [
                                additional2TermLabel, checkButton])
        additionalStack.alignment = .leading
        additionalStack.distribution = .equalCentering
        
        let stack = UIStackView(arrangedSubviews: [
                                titleLabel, desire1Label, desire2Label, sumSlider, desireStack, term1Label,
                                term2Label, yearSlider, yearStack, additional1TermLabel, additionalStack,
                                rate1Label, rate2Label])
        view.addSubview(stack)
        view.addSubview(confirmButton)
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            confirmButton.topAnchor.constraint(equalTo: stack.bottomAnchor,constant: 10),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            confirmButton.widthAnchor.constraint(equalToConstant: 343),
            confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
        
    }
}
