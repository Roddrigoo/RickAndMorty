//
//  ListViewController.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var items: [Character] = []
    
    // UI Elements
    
    private let imgBackground = UIElements.getBackgroundImage()
    private let imgLogo = UIElements.getLogoImage()
    private let tbList = UIElements.getListTableView()
    
    //-----------------------------------------------------------------------
    //  MARK: - UIViewController
    //-----------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - UITableView Delegate / Datasource
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: UIElements.characterCellId, for: indexPath) as! CharacterCell
        cell.loadUI(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = items[indexPath.row]
        self.showDetails(character: object)
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Presenter Delegate
    //-----------------------------------------------------------------------
    
    func dataLoaded() {
        
        tbList.reloadData()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custom methods
    //-----------------------------------------------------------------------
    
    private func loadData() {
        
        RequestManager().loadCharacters { items in
            
            if let array = items {
                
                self.items = array
                self.tbList.reloadData()
            }
        }
    }
    
    private func showDetails(character: Character) {
        
        let controller = DetailViewController()
        controller.character = character
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupView() {
        
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = .black
        
        self.view = view
    }
    
    private func configUI() {
        
        // Background
        
        self.view.addSubview(imgBackground)
        self.addConstraintBackground()
        
        // Logo
        
        self.view.addSubview(imgLogo)
        self.addConstraintLogo()
        
        // List
        
        tbList.delegate = self
        tbList.dataSource = self
        
        self.view.addSubview(tbList)
        self.addConstraintList()
    }
    
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
    
    private func addConstraintLogo() {
        
        let constraintTop = NSLayoutConstraint(item: self.imgLogo,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.view,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 20)
        
        let constraintHeight = NSLayoutConstraint(item: self.imgLogo,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 150)
        
        let constraintWidth = NSLayoutConstraint(item: self.imgLogo,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 300)
        
        let constraintCenterX = NSLayoutConstraint(item: self.imgLogo,
                                                   attribute: NSLayoutConstraint.Attribute.centerX,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.centerX,
                                                   multiplier: 1,
                                                   constant: 0)
        
        self.view.addConstraints([constraintTop, constraintHeight, constraintWidth, constraintCenterX])
    }
    
    private func addConstraintList() {
        
        let constraintTop = NSLayoutConstraint(item: self.tbList,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.imgLogo,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 180)
        
        let constraintLeading = NSLayoutConstraint(item: self.tbList,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.view,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 0)
        
        let constraintTrailing = NSLayoutConstraint(item: self.tbList,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.view,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 0)
        
        let constraintBottom = NSLayoutConstraint(item: self.tbList,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self.view,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: 0)
        
        self.view.addConstraints([constraintTop, constraintTrailing, constraintLeading, constraintBottom])
    }
}
