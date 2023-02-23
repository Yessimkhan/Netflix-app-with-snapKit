//
//  Extensions.swift
//  Netflix
//
//  Created by Yessimkhan Zhumash on 23.11.2022.
//

import Foundation

extension String{
    func cpitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
