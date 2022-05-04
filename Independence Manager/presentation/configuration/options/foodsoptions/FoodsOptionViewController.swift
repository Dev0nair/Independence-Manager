//
//  ConfOptionsViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 14/4/22.
//

import UIKit

class FoodsOptionViewController: CustomModal {
	
	private let viewModel = FoodsOptionViewModel(
		getFoodList: UCGetAllFood()
	)
	
	private lazy var photoFood: UIImageView = {
		let image = UIImageView()
		image.clipsToBounds = true
		image.contentMode = .scaleAspectFill
		return image
	}()
	
	private lazy var infoFood: (photo: UIImageView, nombre: UILabel, ingredientes: UILabel, disponibilidad: UILabel) = {
		let lbNombre = UILabel()
		let lbIngredientes = UILabel()
		let lbDisponibilidad = UILabel()

		lbNombre.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
		lbIngredientes.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
		lbDisponibilidad.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
		
		return (photoFood, lbNombre, lbIngredientes, lbDisponibilidad)
	}()
	
	required init() {
		super.init(minHeight: 0.45, defaultHeight: 0.6, maxHeight: 0.6)
	}
	
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func setTopContent() -> [UIView] {
		let spacer = UIView()
		let stack = UIStackView(arrangedSubviews: [infoFood.nombre, infoFood.ingredientes, infoFood.disponibilidad])
		
		stack.spacing = 12
		stack.isLayoutMarginsRelativeArrangement = true
		stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		stack.axis = .vertical
		
		
		return [infoFood.photo, stack, spacer]
	}
	
	override func setBottomContent() -> [UIView] {
		
		let foodList = UITableView()
		
		foodList.dataSource = self
		foodList.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		foodList.delegate = self
		
		self.viewModel.foods.listen { list in
			foodList.reloadData()
		}
		
		foodList.backgroundColor = .clear
		
		self.viewModel.loadFoods()
		
		return [foodList]
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		if let function: () -> Void = self.params as? () -> Void {
			function()
		}
	}
}

extension FoodsOptionViewController : UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.viewModel.foods.item?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		
		cell.textLabel?.text = self.viewModel.foods.item?[indexPath.item].desc
		cell.backgroundColor = .clear
		cell.layer.cornerRadius = 20
		cell.clipsToBounds = true
		
		return cell
	}
	
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		if(tableView.indexPathForSelectedRow == indexPath) {
			showTopBar(show: false)
			tableView.deselectRow(at: indexPath, animated: true)
			return nil
		} else {
			showTopBar(show: true)
		}
		
		if let food = self.viewModel.foods.item?[indexPath.row] {
			self.infoFood.nombre.text = food.desc
			self.infoFood.ingredientes.text = "Ingredientes de la comida \(food.desc)"
			self.infoFood.photo.image = UIImage(named: food.image)
			if food.available ?? false {
				self.infoFood.disponibilidad.text = "Disponible"
			} else {
				self.infoFood.disponibilidad.text = "No disponible"
			}
		}
		
		return indexPath
	}
}
