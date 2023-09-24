//
//  Extensions.swift
//  RandomPhoto
//
//  Created by Muhammad Talha on 25/09/2023.
//

import UIKit

extension UIView{
    func addSubviews(_ views: UIView...){
        views.forEach({
            self.addSubview($0)
        })
    }
}
