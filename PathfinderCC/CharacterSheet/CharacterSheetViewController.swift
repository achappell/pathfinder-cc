//
//  CharacterSheetViewController.swift
//  PathfinderCC
//
//  Created by Amanda Chappell on 3/3/16.
//  Copyright © 2016 AmplifiedProjects. All rights reserved.
//

import UIKit

class CharacterSheetViewController: UICollectionViewController {
    
    var character : Character? {
        return Character.selectedCharacter()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let collectionView = self.collectionView {
            collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier:"NoCharacterHeader")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.collectionView!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCharacter(sender: UIButton!) {
        self.performSegueWithIdentifier("CreateCharacter", sender: self)
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let character = character {
            let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AbilityHeader", forIndexPath: indexPath) as! AbilityScoreCollectionViewCell
            collectionViewCell.character = character
            return collectionViewCell
        }
        
        let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("NoCharacterHeader", forIndexPath: indexPath)
        
        let createCharacterButton = UIButton(type: .Custom)
        createCharacterButton.setTitle("Create Character", forState: .Normal)
        createCharacterButton.sizeToFit()
        createCharacterButton.center = CGPointMake(CGRectGetWidth(collectionViewCell.bounds)/2.0,CGRectGetHeight(collectionViewCell.bounds)/2.0)
        createCharacterButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        createCharacterButton.addTarget(self, action: "createCharacter:", forControlEvents: .TouchUpInside)
        collectionViewCell.contentView.addSubview(createCharacterButton)
        
        return collectionViewCell
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

}
