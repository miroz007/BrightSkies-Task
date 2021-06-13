//
//  RecipeDetailsVC.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/13/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit
import ReadMoreTextView

class RecipeDetailsVC: BaseViewController {
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeHeadlineLabel: UILabel!
    @IBOutlet weak var recipeFatLabel: UILabel!
    @IBOutlet weak var recipeCarbosLabel: UILabel!
    @IBOutlet weak var recipeCaloriesLabel: UILabel!
    @IBOutlet weak var recipeProteinsLabel: UILabel!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    @IBOutlet weak var descriptionTV: ReadMoreTextView!
    
    var recipe : RecipesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    private func configuration() {
        descriptionTV.text = self.recipe?.descriptionField
        descriptionTV.shouldTrim = true
        descriptionTV.maximumNumberOfLines = 4
        descriptionTV.attributedReadMoreText = NSAttributedString(string: "... Read more")
        descriptionTV.attributedReadLessText = NSAttributedString(string: " Read less")
    }
    
    override func setupUI() {
        DispatchQueue.main.async {
            self.recipeImage.downloadImageWithCaching(with: self.recipe?.image ?? "")

            self.recipeNameLabel.text = self.recipe?.name
            self.recipeHeadlineLabel.text = self.recipe?.headline
            self.recipeFatLabel.text = self.recipe?.fats
            self.recipeCarbosLabel.text = self.recipe?.carbos
            self.recipeCaloriesLabel.text = self.recipe?.calories
            self.recipeProteinsLabel.text = self.recipe?.proteins
            self.recipeIngredientsLabel.text = self.recipe?.ingredients.joined(separator: " - ")
        }
    }
    
    @IBAction func onTapDismiss(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
