//
//  CharacterCell.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import UIKit
import Kingfisher

class CharacterCell: UITableViewCell {
    
    private var lblName = UILabel()
    private var vwBackground = UIView()
    private var imgAvatar = UIImageView()
    private var imgArrow = UIImageView()
    
    //-----------------------------------------------------------------------
    //  MARK: - Config/Load UI
    //-----------------------------------------------------------------------
    
    private func configUI() {
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        // Background
        
        self.addBackgroundView()
        self.addConstraintBackgroundView()
        
        // Avatar
        
        self.addAvatarImage()
        self.addConstraintAvatarImage()
        
        // Arrow
        
        self.addArrowIndicator()
        self.addConstraintArrowImage()
        
        // Name
        
        self.addNameLabel()
        self.addConstraintNameLabel()
    }
    
    func loadUI(item: Character) {
        
        self.configUI()
        
        lblName.text = item.name
        
        if let imgURL = URL(string: item.image){
            imgAvatar.kf.setImage(with: imgURL)
        }
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UI Elements
    //-----------------------------------------------------------------------
    
    private func addBackgroundView() {
        
        vwBackground.backgroundColor = .white
        vwBackground.alpha = 0.08
        vwBackground.layer.cornerRadius = 15
        vwBackground.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(vwBackground)
    }
    
    private func addAvatarImage() {
        
        imgAvatar.image = nil
        imgAvatar.backgroundColor = .gray
        imgAvatar.layer.cornerRadius = 25
        imgAvatar.clipsToBounds = true
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imgAvatar)
    }
    
    private func addNameLabel() {
        
        lblName.textColor = .green
        lblName.font = UIFont(name: "SpecialElite-Regular", size: 24)
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(lblName)
    }
    
    private func addArrowIndicator() {
        
        imgArrow.image = UIImage(named: "Arrow")
        imgArrow.contentMode = .scaleAspectFit
        imgArrow.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(imgArrow)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Constraints
    //-----------------------------------------------------------------------
    
    private func addConstraintAvatarImage() {
        
        let constraintCenterY = NSLayoutConstraint(item: self.imgAvatar,
                                                   attribute: NSLayoutConstraint.Attribute.centerY,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self,
                                                   attribute: NSLayoutConstraint.Attribute.centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        
        let constraintLeading = NSLayoutConstraint(item: self.imgAvatar,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 25)
        
        let constraintHeight = NSLayoutConstraint(item: self.imgAvatar,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 50)
        
        let constraintWidth = NSLayoutConstraint(item: self.imgAvatar,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 50)
        
        self.addConstraints([constraintCenterY, constraintLeading, constraintHeight, constraintWidth])
    }
    
    private func addConstraintNameLabel() {
        
        let constraintTop = NSLayoutConstraint(item: self.lblName,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 0)
        
        let constraintBottom = NSLayoutConstraint(item: self.lblName,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        let constraintTrailing = NSLayoutConstraint(item: self.lblName,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.imgArrow,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintLeading = NSLayoutConstraint(item: self.lblName,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.imgAvatar,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 65)
        
        self.addConstraints([constraintTop, constraintBottom, constraintTrailing, constraintLeading])
    }
    
    private func addConstraintBackgroundView() {
        
        let constraintTop = NSLayoutConstraint(item: self.vwBackground,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 10)
        
        let constraintLeading = NSLayoutConstraint(item: self.vwBackground,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 10)
        
        let constraintTrailing = NSLayoutConstraint(item: self.vwBackground,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -10)
        
        let constraintBottom = NSLayoutConstraint(item: self.vwBackground,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: -10)
        
        self.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintBottom])
    }
    
    private func addConstraintArrowImage() {
        
        let constraintCenterY = NSLayoutConstraint(item: self.imgArrow,
                                                   attribute: NSLayoutConstraint.Attribute.centerY,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self,
                                                   attribute: NSLayoutConstraint.Attribute.centerY,
                                                   multiplier: 1,
                                                   constant: 0)
        
        
        let constraintTrailing = NSLayoutConstraint(item: self.imgArrow,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -20)
        
        let constraintHeight = NSLayoutConstraint(item: self.imgArrow,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 20)
        
        
        let constraintWidth = NSLayoutConstraint(item: self.imgArrow,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 20)
        
        self.addConstraints([constraintCenterY, constraintTrailing, constraintHeight, constraintWidth])
    }
}
