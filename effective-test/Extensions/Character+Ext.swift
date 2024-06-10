//
//  Character+Ext.swift
//  effective-test
//
//  Created by Bahdan Piatrouski on 10.06.24.
//

import Foundation

extension Character {
    var isCyrillic: Bool {
        return ("А"..."я").contains(self) || "Ё" == self || "ё" == self
    }
}
