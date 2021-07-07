//
//  Helpers.swift
//  
//
//  Created by Russell Warwick on 08/07/2021.
//

import UIKit

protocol Chainable {}

extension Chainable {
    
        @discardableResult func with(_ block: (Self) throws -> Void) rethrows -> Self {
        try block(self)
        return self
    }

    @discardableResult func mutatedWith(_ block: (inout Self) -> Void) -> Self {
        var value = self
        block(&value)
        return value
    }
}

extension NSObject: Chainable {}
