//
//  String.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 29/07/23.
//

import Foundation

extension String {
    func removeSpacing() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
