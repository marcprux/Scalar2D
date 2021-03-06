//
//  PathView+Mac.swift
//  Scalar2D
//
//  Created by Glenn Howes on 8/17/16.
//  Copyright © 2016 Generally Helpful Software. All rights reserved.
//
//
// The MIT License (MIT)

//  Copyright (c) 2016 Generally Helpful Software

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

import Cocoa
import CoreGraphics

#if os(OSX)
import Foundation
import Cocoa
@IBDesignable public  class PathView: NSView, ShapeView {
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.wantsLayer = true
        let myLayer = PathViewLayer()
        self.layer = myLayer
    }
    
    
    @IBInspectable public var svgPath: String?
    {
        didSet
        {
            self.setPathString(pathString: svgPath)
        }
    }
    
    @IBInspectable public var lineWidth: CGFloat = 1
    {
        didSet
        {
            self.shapeLayer.lineWidth = lineWidth
        }
    }
    
    @IBInspectable public var fillColor: NSColor?
    {
        didSet
        {
            
            self.shapeLayer.fillColor = fillColor?.cgColor
        }
    }
    
    @IBInspectable public var strokeColor: NSColor?
    {
        didSet
        {
            self.shapeLayer.strokeColor = strokeColor?.cgColor
        }
    }
    
    @IBInspectable public var strokeStart : CGFloat = 0.0
    {
        didSet
        {
            self.shapeLayer.strokeStart = self.strokeStart
        }
    }

    @IBInspectable public var strokeEnd : CGFloat = 1.0
    {
        didSet
        {
            self.shapeLayer.strokeEnd = self.strokeEnd
        }
    }
    
    override public var isFlipped: Bool // to be like the iOS version
    {
        return true
    }
    
    public var shapeLayer: CAShapeLayer
    {
        return (self.layer as! PathViewLayer).shapeLayer
    }
}

#endif
