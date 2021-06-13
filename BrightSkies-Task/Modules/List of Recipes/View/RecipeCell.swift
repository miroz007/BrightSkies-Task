//
//  RecipeCell.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/12/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    
    static let identifier = "RecipeCell"
    var cellDelegate: favoriteDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configure(recipe: RecipesModel) {
        self.recipeNameLabel.text = recipe.name
        self.favLabel.text = "\(recipe.favorites ?? 0)"
        self.rateLabel.text = "\(recipe.rating ?? 0.0)"
        if let url = URL(string: recipe.image) {
            self.recipeImage.sd_setImageWithURLWithFade(url: url, placeholderImage: #imageLiteral(resourceName: "Logo"))
        }
    }
    
    @IBAction func onTapFavorite(_ sender: UIButton) {
        self.cellDelegate?.didPressButton(sender.tag)
    }
    
}
