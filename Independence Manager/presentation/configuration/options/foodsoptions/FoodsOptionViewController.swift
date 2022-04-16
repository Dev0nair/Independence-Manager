//
//  ConfOptionsViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 14/4/22.
//

import UIKit

class FoodsOptionViewController: UIBaseViewController {

    @IBOutlet weak var foodList: UITableView!
    private let viewModel = FoodsOptionViewModel(
        getFoodList: UCGetAllFood()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.cornerRadius = 45
        
        self.foodList.dataSource = self
        self.foodList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        self.foodList.delegate = self
        
        
        
        self.viewModel.foods.listen { _ in
            self.foodList.reloadData()
        }
        
        self.viewModel.loadFoods()
    }
}

extension FoodsOptionViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.foods.item?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.viewModel.foods.item?[indexPath.item].desc
        
        return cell
    }
    
    
    
    
}
