//
//  ExampleViewController.swift
//  Independence Manager
//
//  Created by Ismael González on 24/4/22.
//

import UIKit
import CoreData

/*
 Views & conf variables
 */
open class CustomModal: UIBaseViewController {
	lazy var notesLabel: UILabel = {
		let label = UILabel()
		label.text = "Lorem ipsum dolor sit am"
		label.font = .systemFont(ofSize: 16)
		label.textColor = .darkGray
		label.numberOfLines = 0
		label.backgroundColor = .green
		return label
	}()
	
	lazy var vTopContent: UIView = {
		let topContent = setTopContent()
		let base = UIStackView(arrangedSubviews: topContent )
		base.clipsToBounds = true
		base.axis = .vertical
		base.layer.cornerRadius = 45
		base.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
		base.isLayoutMarginsRelativeArrangement = true
		base.layoutMargins = UIEdgeInsets(top: self.view.safeAreaInsets.top, left: 0, bottom: differenceBetweenBottomAndTop + 10, right: 0)
		base.backgroundColor = UIColor(named: "Oscuro")
		
		return base;
	}()
	
	lazy var vBottomContent: UIView = {
		let base = UIStackView(arrangedSubviews: setBottomContent())
		base.backgroundColor = UIColor(named: "Claro")
		base.clipsToBounds = true
		base.layer.cornerRadius = 45
		base.isLayoutMarginsRelativeArrangement = true
		base.layoutMargins = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
		
		dropShadow(color: .black, offSet: CGSize(width: 0, height: 40), radius: 45, layer: base.layer)
		
		return base;
	}()
	
	open func setTopContent() -> [UIView] { return [UIView()] }
	open func setBottomContent() -> [UIView] { return [UIView()] }
	
	// Constraints estáticas
	let animationTime = 0.5
	let differenceBetweenBottomAndTop: Double = 90
	
	private var vBottomHeightDefault: Double
	private var vBottomHeightMin: Double
	private var vBottomHeightMax: Double
	
	// Constraints dinamicas
	private var showTopBar = false
	private var vTopY: NSLayoutConstraint?
	private var vTopHeight: NSLayoutConstraint?
	private var vBottomY: NSLayoutConstraint?
	private var vBottomHeight: NSLayoutConstraint?
	private var currentTopSheetHeight: CGFloat = 0.0
	private var currentBottomSheetHeight: CGFloat = 0.0
	
	private func getBottomHeightDefault() -> Double {
		return self.view.bounds.height * self.vBottomHeightDefault
	}
	private func getBottomHeightMin() -> Double {
		return self.view.bounds.height * self.vBottomHeightMin
	}
	private func getBottomHeightMax() -> Double {
		return self.view.bounds.height * self.vBottomHeightMax
	}
	
	public init(
		minHeight: Double = 0.3,
		defaultHeight: Double = 0.45,
		maxHeight: Double = 1.0
	) {
		self.vBottomHeightMin = minHeight
		self.vBottomHeightDefault = defaultHeight
		self.vBottomHeightMax = maxHeight
		
		super.init(nibName: nil, bundle: nil)
	}
	
	required public init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

/*
 Main methods
 */
extension CustomModal {
	open override func viewDidLoad() {
		super.viewDidLoad()
		
		buildView()
		configureView()
		setStaticConstraints()
		setDynamicConstraints()
		setupPanGesture()
	}
	
	open override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		loadEnterAnimation()
	}
	
	private func configureView() {
		self.view.backgroundColor = .clear
		self.view.isOpaque = false
		
		vTopContent.translatesAutoresizingMaskIntoConstraints = false
		vBottomContent.translatesAutoresizingMaskIntoConstraints = false
		
		self.currentBottomSheetHeight = self.getBottomHeightDefault()
		self.currentTopSheetHeight = self.getTopSheetHeight()
	}
	
	private func buildView() {
		view.addSubview(vTopContent)
		view.addSubview(vBottomContent)
	}
}

/*
 Public methods
 */
extension CustomModal {
	func showTopBar(show: Bool) {
		self.showTopBar = show
		loadEnterAnimation()
	}
}

/*
 Configuration
 */
extension CustomModal {
	private func setStaticConstraints() {
		vTopContent.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		vBottomContent.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		
	}
	
	private func getTopSheetHeight() -> Double {
		return self.view.bounds.height - currentBottomSheetHeight + differenceBetweenBottomAndTop
	}
	
	private func setCurrentHeights(bottomHeight: Double) {
		currentBottomSheetHeight = bottomHeight
		currentTopSheetHeight = self.getTopSheetHeight()
		
	}
	
	private func setDynamicConstraints() {
		// TOP CONTENT
		let heightTopSheet = getTopSheetHeight()
		
		vTopHeight = vTopContent.heightAnchor.constraint(equalToConstant: heightTopSheet)
		vTopY = vTopContent.topAnchor.constraint(equalTo: view.topAnchor, constant: heightTopSheet * -1)
		
		vTopHeight?.isActive = true
		vTopY?.isActive = true
		
		
		// BOTTOM CONTENT
		vBottomHeight = vBottomContent.heightAnchor.constraint(equalToConstant: getBottomHeightDefault())
		vBottomY = vBottomContent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: getBottomHeightDefault())
		
		vBottomHeight?.isActive = true
		vBottomY?.isActive = true
	}
	
	private func setupPanGesture() {
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
		panGesture.delaysTouchesBegan = false
		panGesture.delaysTouchesEnded = false
		view.addGestureRecognizer(panGesture)
	}
	
	@objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
		let translation = gesture.translation(in: view)
		
		let isDraggingDown = translation.y > 0
		
		let newBottomHeight = currentBottomSheetHeight - translation.y
		let newTopHeight = currentTopSheetHeight + translation.y
		
		// Handle based on gesture state
		switch gesture.state {
		case .changed:
			
			if(showTopBar) {
				vTopHeight?.constant = newTopHeight
			}
			
			vBottomHeight?.constant = newBottomHeight
			
			self.view.layoutIfNeeded()
			
		case .ended:
			
			if(isDraggingDown) {
				
				if(newBottomHeight < self.getBottomHeightMin()) {
					animateContainersHeight(0)
					
				} else if(newBottomHeight < self.getBottomHeightDefault()) {
					animateContainersHeight(self.getBottomHeightMin())
					
				} else if(newBottomHeight < self.getBottomHeightMax()){
					animateContainersHeight(self.getBottomHeightDefault())
					
				} else {
					animateContainersHeight(self.currentBottomSheetHeight)
				}
				
			} else {
				
				if (newBottomHeight > self.getBottomHeightDefault()){
					animateContainersHeight(self.getBottomHeightMax())
					
				} else if(newBottomHeight > self.getBottomHeightMin()) {
					animateContainersHeight(self.getBottomHeightDefault())
					
				} else {
					animateContainersHeight(self.currentBottomSheetHeight)
				}
			}
			
		case .cancelled:
			animateContainersHeight(self.currentBottomSheetHeight)
		default:
			break;
		}
	}
}

/*
 Animations
 */
extension CustomModal {
	private func loadEnterAnimation() {
		
		UIView.animate(withDuration: animationTime) {
			self.vBottomY?.constant = 0
			
			if(self.showTopBar) {
				self.vTopY?.constant = 0
				self.vTopHeight?.constant = self.getTopSheetHeight()
			} else {
				self.vTopY?.constant = self.getTopSheetHeight() * -1
			}
			
			self.view.layoutIfNeeded()
		}
		
	}
	
	private func animateContainersHeight(_ height: CGFloat) {
		if(height > 0){
			setCurrentHeights(bottomHeight: height)
		}
		
		UIView.animate(withDuration: self.animationTime, animations: {
			if(height == 0) {
				if(self.showTopBar) {
					self.vTopY?.constant = self.currentTopSheetHeight * -1
				}
				
				self.vBottomY?.constant = self.currentBottomSheetHeight
				
				self.vBottomContent.alpha = 0
				self.vTopContent.alpha = 0
				
				self.view.layoutIfNeeded()
				
			} else {
				
				if(self.showTopBar) {
					self.vTopY?.constant = self.currentTopSheetHeight * -1
				}
				
				self.vBottomHeight?.constant = self.currentBottomSheetHeight
				
				self.view.layoutIfNeeded()
			}
		}) { completed in
			if(completed) {
				self.dismiss(animated: false)
			}
		}
	}
}
