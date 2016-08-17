import UIKit
import CoreGraphics
import Scalar2D // make sure to build this library for a valid simulator device.


let pathString = "M 170 207C139 183 40 199 41 109A18 18 0 1 1 56 75Q67 53 91 45A18 18 0 1 1 127 40C170 29 193 62 212 173L225 110Q241 70 252 120L253 156 C253 180 265 223 235 214Q210 210 215 242 C222 265 161 249 125 248"

if let myPath = UIBezierPath(svgPath: pathString)
{
    let size = CGSize(width: 300, height: 300)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
    let context = UIGraphicsGetCurrentContext()
    UIColor.green.setStroke()
    myPath.lineWidth = 4
    myPath.stroke()
    
    //This code must always be at the end of the playground
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
}

let pathView = PathView(frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300))
pathView.svgPath = pathString
pathView.fillColor = UIColor.clear
pathView.strokeColor = UIColor.green
pathView.lineWidth = 5.0
pathView.backgroundColor = UIColor.blue
