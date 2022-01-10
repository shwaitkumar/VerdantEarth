// Copyright © 2018 Flinesoft. All rights reserved.

import UIKit

extension CGPoint {
    /// Returns a new CGPoint object with the x and y converted to true pixels on the main screen.
    public var inPixels: CGPoint { inPixels(.main) }

    /// Returns a new CGPoint object with the x and y converted to true pixels on the given screen.
    ///
    /// - Parameters:
    ///   - screen: The target screen to convert to pixels for.
    public func inPixels(_ screen: UIScreen) -> CGPoint {
        CGPoint(x: x * screen.scale, y: y * screen.scale)
    }
}
