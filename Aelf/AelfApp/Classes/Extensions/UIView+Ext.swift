//
//  UIView+Ext.swift
//  RxExamples
//
//  Created by 晋先森 on 2019/5/30.
//  Copyright © 2019 晋先森. All rights reserved.
//

import Foundation

extension UIView {

    var width: CGFloat {
        get { return self.frame.size.width }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }

    var height: CGFloat {
        get { return self.frame.size.height }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }

    var size: CGSize {
        get { return self.frame.size }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }

    var origin: CGPoint {
        get { return self.frame.origin }
        set {
            var frame = self.frame
            frame.origin = newValue
            self.frame = frame
        }
    }

    var x: CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    var centerX: CGFloat {
        get { return self.center.x }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }

    var centerY: CGFloat {
        get { return self.center.y }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }

    var top : CGFloat {
        get { return self.frame.origin.y }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }

    var bottom : CGFloat {
        get { return frame.origin.y + frame.size.height }
        set {
            var frame = self.frame
            frame.origin.y = newValue - self.frame.size.height
            self.frame = frame
        }
    }

    var right : CGFloat {
        get { return self.frame.origin.x + self.frame.size.width }
        set {
            var frame = self.frame
            frame.origin.x = newValue - self.frame.size.width
            self.frame = frame
        }
    }

    var left : CGFloat {
        get { return self.frame.origin.x }
        set {
            var frame = self.frame
            frame.origin.x  = newValue
            self.frame = frame
        }
    }

    @IBInspectable var heightCircle: Bool {
        get { return self.layer.masksToBounds }
        set {
            layer.cornerRadius = self.height/2
            self.layer.masksToBounds = true
        }
    }
}
