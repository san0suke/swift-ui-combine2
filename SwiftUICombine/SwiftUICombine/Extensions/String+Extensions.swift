//
//  String+Extensions.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 15/11/24.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPredicate.evaluate(with: self)
    }
}
