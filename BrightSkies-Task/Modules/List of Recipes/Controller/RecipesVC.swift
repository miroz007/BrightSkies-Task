//
//  RecipesVC.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/12/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import UIKit

protocol favoriteDelegate : AnyObject {
    func didPressButton(_ tag: Int)
}

class RecipesVC: BaseViewController{
    
    @IBOutlet weak var headerView: UIViewX!
    @IBOutlet weak var tableView: UITableView!
    
    var recipes : [RecipesModel]?
    var viewModel = RecipesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    private func configuration() {
        headerView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 18)
        let nib = UINib(nibName: RecipeCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: RecipeCell.identifier)
        viewModel.getRecipes()
    }
    
    
    override func setupUI() {
        viewModel.isData.asObservable().subscribe(onNext: { [weak self] isData in
            guard let self = self else {return}
            if isData {
                DispatchQueue.main.async {
                    self.recipes = self.viewModel.recipes.value
                    self.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
        
        viewModel.msg.asObservable().subscribe(onNext: { [weak self] msg in
            guard let self = self , msg.count > 0 else {return}
            DispatchQueue.main.async {
                self.view.showSimpleAlert("Error", msg, .error)
            }
        }).disposed(by: disposeBag)
        
        viewModel.isLoading
            .distinctUntilChanged()
            .drive(onNext: { [weak self] (isLoading) in
                guard let `self` = self else { return }
                self.killLoading()
                if isLoading {
                    self.startLoading()
                }
            })
            .disposed(by: disposeBag)
        
        viewModel.recipes.asObservable()
            .bind(to: tableView.rx.items) { [weak self ] (tableView, row, element) in
                guard let self = self else {return UITableViewCell()}
                let indexPath = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
                cell.cellDelegate = self
                if let rec = self.recipes , !self.recipes!.isEmpty {
                    cell.configure(recipe: rec[indexPath.row])
                }
                return cell
        }
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                let vc = UIStoryboard.main.recipeDetailsVC
                vc.recipe = self?.recipes?[indexPath.row]
                self?.navigationController?.pushViewController(vc, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    
    @IBAction func onTapDismiss(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension RecipesVC: favoriteDelegate {
    func didPressButton(_ tag: Int) {
        let indexPath = IndexPath(row: tag, section: 0)
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
    }
}
