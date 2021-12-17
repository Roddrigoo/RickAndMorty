//
//  DetailViewController.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var character: Character!
   
    private let imgBackground = UIElements.getBackgroundImage()
    private let imgAvatar = UIElements.getImageAvatar()
    private let lblName = UIElements.getNameAvatar()
    
    private let viewCharacter = UIElements.getUIViewCharacteristics()
    
    private let lblSpeciesTitle = UIElements.getLabelWhite()
    private let lblSpeciesValue = UIElements.getLabelGreen()
    
    private let lblGenderTitle = UIElements.getLabelWhite()
    private let lblGenderValue = UIElements.getLabelGreen()
    
    private let lblTypeTitle = UIElements.getLabelWhite()
    private let lblTypeValue = UIElements.getLabelGreen()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadUI(item: character)
    }
       
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    private func configUI() {
        
        // Background
        
        self.view.addSubview(imgBackground)
        self.addConstraintBackground()
        
        // Avatar
        
        self.view.addSubview(imgAvatar)
        self.addConstraintImgAvatar()
        
        // Name Avatar
        
        self.view.addSubview(lblName)
        self.addConstraintLblName()
        
        // View Characteristics
        
        self.view.addSubview(viewCharacter)
        self.addConstraintViewCharacteristics()
        
        // Specie Title
        
        self.view.addSubview(lblSpeciesTitle)
        self.addConstraintLblSpecieTitle()
        
        // Specie Value
        
        self.view.addSubview(lblSpeciesValue)
        self.addConstraintLblSpecieValue()
        
        // Gender Title
        
        self.view.addSubview(lblGenderTitle)
        self.addConstraintLblGenderTitle()
        
        // Gender Value
        
        self.view.addSubview(lblGenderValue)
        self.addConstraintLblGenderValue()
        
        // Type Title
        
        self.view.addSubview(lblTypeTitle)
        self.addConstraintLblTypeTitle()
        
        // Gender Value
        
        self.view.addSubview(lblTypeValue)
        self.addConstraintLblTypeValue()
    }
    
    private func setupUI(){
        
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        
        self.view = view
    }
    
    func loadUI(item: Character) {
        
        self.configUI()
        
        lblName.text = item.name
        
        lblSpeciesTitle.text = "Specie:"
        lblSpeciesValue.text = item.species
        
        lblGenderTitle.text = "Gender:"
        lblGenderValue.text = item.gender
        
        lblTypeTitle.text = "Type:"
        lblTypeValue.text = item.type
        
        if let imgURL = URL(string: item.image){
            imgAvatar.kf.setImage(with: imgURL)
        }
    }
       
    //-----------------------------------------------------------------------
    //  MARK: - Constraints
    //-----------------------------------------------------------------------
    
    private func addConstraintBackground() {
        
        let constraintTop = NSLayoutConstraint(item: self.imgBackground,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.view,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 0)
        
        let constraintLeading = NSLayoutConstraint(item: self.imgBackground,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 0)
        
        let constraintTrailing = NSLayoutConstraint(item: self.imgBackground,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 0)
        
        let constraintBottom = NSLayoutConstraint(item: self.imgBackground,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintBottom])
    }
    
    private func addConstraintImgAvatar() {
        
        let constraintTop = NSLayoutConstraint(item: self.imgAvatar,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.view,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 120)
        
        let constraintHeight = NSLayoutConstraint(item: self.imgAvatar,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute:NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 200)
        
        let constraintWidth = NSLayoutConstraint(item: self.imgAvatar,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 200)
        
        let constraintCenterX = NSLayoutConstraint(item: self.imgAvatar,
                                                   attribute: NSLayoutConstraint.Attribute.centerX,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        
        self.view.addConstraints([constraintTop, constraintHeight, constraintWidth, constraintCenterX])
    }
    
    private func addConstraintLblName() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblName,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: imgAvatar,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 200)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblName,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblName,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblName,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  multiplier: 1,
                                                  constant: -750)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintViewCharacteristics() {
        
        let constraintTop = NSLayoutConstraint(item: self.viewCharacter,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblName,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 120)
        
        let constraintTrailing = NSLayoutConstraint(item: self.viewCharacter,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintBottom = NSLayoutConstraint(item: self.viewCharacter,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: -100)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintBottom])
    }
    
    private func addConstraintLblSpecieTitle() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblSpeciesTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: viewCharacter,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 20)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblSpeciesTitle,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblSpeciesTitle,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblSpeciesTitle,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintLblSpecieValue() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblSpeciesValue,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblSpeciesTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 30)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblSpeciesValue,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblSpeciesValue,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblSpeciesValue,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintLblGenderTitle() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblGenderTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblSpeciesValue,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 50)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblGenderTitle,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblGenderTitle,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblGenderTitle,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintLblGenderValue() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblGenderValue,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblGenderTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 30)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblGenderValue,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblGenderValue,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblGenderValue,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintLblTypeTitle() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblTypeTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblGenderValue,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 50)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblTypeTitle,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblTypeTitle,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblTypeTitle,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
    
    private func addConstraintLblTypeValue() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblTypeValue,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: lblTypeTitle,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 30)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblTypeValue,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: viewCharacter,
                                                    attribute:NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblTypeValue,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: viewCharacter,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.lblTypeValue,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 40)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintHeight])
    }
}
