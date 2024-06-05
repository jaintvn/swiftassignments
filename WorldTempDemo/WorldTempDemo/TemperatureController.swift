//
//  TemperatureController.swift
//  WorldTempDemo
//
//  Created by Jayanth V.N. on 6/4/24.
//

import UIKit

class TemperatureController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        view.layer.backgroundColor = UIColor.systemGray4.cgColor
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAllViews()
    }
    
    func setupAllViews() {
        //        let screenSize : CGRect = UIScreen.main.bounds
        //        let labelX: CGFloat = (screenSize.width - labelWidth) * 0.5
        //        let labelY: CGFloat = (screenSize.height - labelHeight) * 0.15
        //
        
        let firstLabel = getUILabel(title: "212", fontSize: 30, color: UIColor.orange)
        view.addSubview(firstLabel)
        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        
        
        let label2 = getUILabel(title: "Degrees Fahrenheit", fontSize: 30, color: UIColor.orange)
        view.addSubview(label2)
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant : 10),
            label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
        let label3 = getUILabel(title: "is really", fontSize: 16, color: UIColor.black)
        view.addSubview(label3)
        NSLayoutConstraint.activate([
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant : 50),
            label3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
        let label4 = getUILabel(title: "100", fontSize: 30, color: UIColor.orange)
        view.addSubview(label4)
        NSLayoutConstraint.activate([
            label4.topAnchor.constraint(equalTo: label3.bottomAnchor, constant : 50),
            label4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
        let label5 = getUILabel(title: "Degrees Celsius", fontSize: 30, color: UIColor.orange)
        view.addSubview(label5)
        NSLayoutConstraint.activate([
            label5.topAnchor.constraint(equalTo: label4.bottomAnchor, constant : 10),
            label5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func getUILabel(title : String, fontSize : CGFloat, color : UIColor) ->  UILabel {
        let label = UILabel()
        label.text = title
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textColor = color
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
}
