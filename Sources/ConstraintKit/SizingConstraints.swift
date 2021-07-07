//
//  SizingConstraints.swift
//  
//
//  Created by Russell Warwick on 08/07/2021.
//

import UIKit

public extension UIView {
    
    // MARK: - Width
    
    @discardableResult
    func withWidth(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value, priority: priority)
    }
    
    @discardableResult
    func withWidth(lessThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(width: value, priority: priority)
    }
    
    @discardableResult
    func withWidth(greaterThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(width: value, priority: priority)
    }
}

public extension UIView {
    
    // MARK: - Height

    @discardableResult
    func withHeight(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(height: value, priority: priority)
    }

    @discardableResult
    func withHeight(lessThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(height: value, priority: priority)
    }

    @discardableResult
    func withHeight(greaterThan value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withMinimum(height: value, priority: priority)
    }
}

public extension UIView {
    
    @discardableResult
    func withSquare(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value, height: value, priority: priority)
    }

    @discardableResult
    func withSize(_ value: CGSize, priority: UILayoutPriority = .required) -> Self {
        return withFixed(width: value.width, height: value.height, priority: priority)
    }
    
    @discardableResult
    func withMinimum(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(greaterThanOrEqualToConstant: $0) },
                height.flatMap { heightAnchor.constraint(greaterThanOrEqualToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withMaximum(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(lessThanOrEqualToConstant: $0) },
                height.flatMap { heightAnchor.constraint(lessThanOrEqualToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withFixed(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                width.flatMap { widthAnchor.constraint(equalToConstant: $0) },
                height.flatMap { heightAnchor.constraint(equalToConstant: $0) }
            ]
            .compactMap {
                $0?.priority = priority
                return $0
            }
        )
        return self
    }

    @discardableResult
    func withAspectRatio(_ value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: value).with { $0.priority = priority }
        ])
        return self
    }

    @discardableResult
    func withAspectRatio(greaterThanOrEqualTo value: CGFloat, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: value).with { $0.priority = priority }
        ])
        return self
    }

    @discardableResult
    func withAspectFilledContent(priority: UILayoutPriority = .required, content: () -> [UIView]) -> Self {
        let contentViews = content()
        withSubviews {
            contentViews
        }
        withCenteredContent(add: false, content: { contentViews })
        withEdgePinnedContent(priority: .defaultLow, add: false, content: { contentViews })
        NSLayoutConstraint.activate(
            contentViews
                .flatMap {[
                    $0.widthAnchor.constraint(greaterThanOrEqualTo: widthAnchor, multiplier: 1),
                    $0.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor, multiplier: 1)
                ]}
                .map {
                    $0.priority = priority
                    return $0
                }
        )
        return self
    }
}
