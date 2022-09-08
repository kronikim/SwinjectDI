//
//  BackgroundColorProviding.swift
//  SwinjectDI
//
//  Created by deniz karahan on 23.08.2022.
//

import Foundation
import UIKit

class BackgroundColorProviding : BackgroundColorProvider {
    var backgroundColor: UIColor {
        let backgroundColors : [UIColor] = [.systemBlue,.systemGreen,.systemRed,.systemOrange, .systemPurple]
        return backgroundColors.randomElement()!
    }
 }
