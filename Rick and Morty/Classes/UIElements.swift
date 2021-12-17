//
//  UIElements.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import UIKit

class UIElements {
    
    static let characterCellId = "CharacterCellId"
    
    static func getUIViewCharacteristics() -> UIView {
        
        let viewCharacter = UIView()
        viewCharacter.backgroundColor = .darkGray
        viewCharacter.alpha = 0.5
        viewCharacter.clipsToBounds = true
        viewCharacter.layer.cornerRadius = 30
        viewCharacter.translatesAutoresizingMaskIntoConstraints = false
        
        return viewCharacter
    }
    
    static func getLogoImage() -> UIImageView {
        
        let imgLogo = UIImageView()
        imgLogo.image = UIImage(named: "Logo")
        imgLogo.contentMode = .scaleAspectFit
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        
        return imgLogo
    }
    
    static func getBackgroundImage() -> UIImageView {
        
        let imgBackground = UIImageView()
        imgBackground.image = UIImage(named: "Background")
        imgBackground.contentMode = .scaleAspectFill
        imgBackground.alpha = 0.8
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
        
        return imgBackground
    }
    
    static func getListTableView() -> UITableView {
        
        let tbList = UITableView()
        tbList.backgroundColor = .clear
        tbList.tintColor = .white
        tbList.register(CharacterCell.self, forCellReuseIdentifier: characterCellId)
        tbList.translatesAutoresizingMaskIntoConstraints = false
        
        return tbList
    }
    
    static func getImageAvatar() -> UIImageView {
        
        let imgAvatar = UIImageView()
        imgAvatar.layer.cornerRadius = 100
        imgAvatar.clipsToBounds = true
        imgAvatar.contentMode = .scaleAspectFill
        imgAvatar.image = UIImage(named: "image")
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        return imgAvatar
    }
    
    static func getNameAvatar() -> UILabel {
        
        let nameAvatar = UILabel()
        nameAvatar.textAlignment = .center
        nameAvatar.textColor = .green
        nameAvatar.font = UIFont(name: "SpecialElite-Regular", size: 35)
        nameAvatar.translatesAutoresizingMaskIntoConstraints = false
        
        return nameAvatar
    }
    
    static func getLabelWhite() -> UILabel {
        
        let labelWhite = UILabel()
        labelWhite.textColor = .white
        labelWhite.font = UIFont(name: "SpecialElite-Regular", size: 20)
        labelWhite.translatesAutoresizingMaskIntoConstraints = false
        
        return labelWhite
    }
    
    static func getLabelGreen() -> UILabel {
        
        let labelGreen = UILabel()
        labelGreen.textColor = .green
        labelGreen.font = UIFont(name: "SpecialElite-Regular", size: 24)
        labelGreen.translatesAutoresizingMaskIntoConstraints = false
        
        return labelGreen
    }
}
