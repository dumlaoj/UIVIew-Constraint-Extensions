//
//  UIView+ConstraintExtension.swift
//
//  Created by Jordan Dumlao on 1/7/19.
//  Edited on 2/7/19
//  Copyright © 2019 Jordan Dumlao. All rights reserved.
//
//  Extensions to easily add common cases of constraints
//  This can help reduce bloated code required to programmatically
//  Constrain views
//
import UIKit

extension UIView {
	
	func jdPin(toLeading leading: NSLayoutXAxisAnchor?, top: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, withPadding padding: UIEdgeInsets) {
		if self.translatesAutoresizingMaskIntoConstraints { self.translatesAutoresizingMaskIntoConstraints = false }
		if let lead = leading { self.leadingAnchor.constraint(equalTo: lead, constant: padding.left).isActive = true }
		if let top = top { self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true }
		if let trail = trailing { self.trailingAnchor.constraint(equalTo: trail, constant: -padding.right).isActive = true }
		if let bot = bottom { self.bottomAnchor.constraint(equalTo: bot, constant: -padding.bottom).isActive = true }
	}
	
	func jdPin(to view: UIView, withPadding padding: UIEdgeInsets) {
		jdPin(toLeading: view.leadingAnchor, top: view.topAnchor, trailing: view.trailingAnchor, bottom: view.bottomAnchor, withPadding: padding)
	}
	
	func jdFillSuperview() {
		guard let sView = self.superview else { return }
		jdPin(to: sView, withPadding: .zero)
	}
	
	func jdFillSuperview(withPadding padding: UIEdgeInsets) {
		guard let sView = self.superview else { return }
		jdPin(to: sView, withPadding: padding)
	}
	
	func jdPin(bottomToTopOf topView: UIView, withPadding padding: CGFloat) {
		guard self.superview == topView.superview else { fatalError("Both views must be in the same superview")}
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.bottomAnchor.constraint(equalTo: topView.topAnchor, constant: padding).isActive = true
	}
	
	func jdPin(topToBottomOf botView: UIView, withPadding padding: CGFloat) {
		guard self.superview == botView.superview else { fatalError("Both views must be in the same superview")}
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.topAnchor.constraint(equalTo: botView.bottomAnchor, constant: padding).isActive = true
	}
	
	func jdPin(leadingToTrailingOf traillingView: UIView, withPadding padding: CGFloat) {
		guard self.superview == traillingView.superview else { fatalError("Both views must be in the same superview")}
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.bottomAnchor.constraint(equalTo: traillingView.topAnchor, constant: padding).isActive = true
	}
	
	func jdPin(trailingToLeadingOf leadingView: UIView, withPadding padding: CGFloat) {
		guard self.superview == leadingView.superview else { fatalError("Both views must be in the same superview")}
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.bottomAnchor.constraint(equalTo: leadingView.topAnchor, constant: padding).isActive = true
	}
	
	func jdSet(sizeTo size: CGSize) {
		self.jdSet(heightTo: size.height)
		self.jdSet(widthTo: size.width)
	}
	
	func jdSet(heightTo height: CGFloat) {
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.heightAnchor.constraint(equalToConstant: height).isActive = true
	}
	
	func jdSet(widthTo width: CGFloat) {
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.widthAnchor.constraint(equalToConstant: width).isActive = true
	}
	
	func jdAlign(verticallyTo view: UIView, _ constant: CGFloat) {
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
	}
	
	func jdAlign(horizontallyTo view: UIView, _ constant: CGFloat) {
		if translatesAutoresizingMaskIntoConstraints { translatesAutoresizingMaskIntoConstraints = false }
		self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
	}
	
	func jdCenterInSuperview() {
		guard let sView = superview else { fatalError("No Superview") }
		jdAlign(horizontallyTo: sView, 0)
		jdAlign(verticallyTo: sView, 0)
	}
	
	func jdMakeCircle(withSide side: CGFloat) {
		self.clipsToBounds = true
		self.jdSet(sizeTo: .init(width: side, height: side))
		self.layer.cornerRadius = side / 2
	}
	
	func jdRemoveAllConstraints() {
		self.removeConstraints(self.constraints)
	}
	
	
	public convenience init(backgroundColor: UIColor, cornerRadius: CGFloat? = nil) {
		self.init()
		self.backgroundColor = backgroundColor
		if let radius = cornerRadius {
			self.clipsToBounds = true
			self.layer.cornerRadius = radius
		}
	}
}

extension UILabel {
	public convenience init(backgroundColor: UIColor, textLabel: String, cornerRadius: CGFloat? = nil) {
		self.init()
		self.text = textLabel
		self.backgroundColor = backgroundColor
		if let radius = cornerRadius {
			self.clipsToBounds = true
			self.layer.cornerRadius = radius
		}
	}
}

