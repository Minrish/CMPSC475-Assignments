//
//  Shape.swift
//  iDrawing 2.0
//
//  Created by Bert Yan on 3/21/22.
//

import Foundation
import SwiftUI

enum ShapeType : String {
    case line, rectangle, ellipse
}

protocol Shape {
    var type : ShapeType {get set}
}

// Using previous lecture codes
struct Point {
    var x : Double
    var y : Double
    static let zero = Point(x: 0, y:0)
    
    static func < (lhs:Point, rhs:Point) -> Bool {
        lhs.x < rhs.x && lhs.y < rhs.y
    }
    
    mutating func offsetBy(width:Double, height:Double) {
        self.x += width
        self.y += height
    }
}

struct Rectangle : Shape  {
    var type = ShapeType.rectangle
    var origin : Point
    var width : Double
    var height : Double
    var zIndex : Double = 0
    var color = Color.blue
    let id = UUID()
    
    static var standard = Rectangle(origin: Point(x: 100, y: 100), width: 50, height: 50)
    
    
}

extension Rectangle {
    var center : Point {
        get {
            return Point(x: origin.x + width / 2, y: origin.y + height / 2)
        }
        set(newValue){
            origin = Point(x: newValue.x - width / 2, y: newValue.y - height / 2)
        }
        
    }
    
    var ending : Point {
        get {
            return Point(x: origin.x + width, y: origin.y + height)
        }
        set(newValue){
            width = newValue.x - origin.x
            height = newValue.y - origin.y
        }
    }
   
}


struct Line : Shape {
    var type = ShapeType.line
    var points = [CGPoint]()
    var color = Color.red
    var lineWidth : Double = 1.0
}

//struct Rectangle : Shape {
//    var type = ShapeType.rectangle
//    var points = [CGPoint]()
//    var color = Color.blue
//
//}


struct Ellipse : Shape  {
    var type = ShapeType.ellipse
    var origin : Point
    var width : Double
    var height : Double
    var zIndex : Double = 0
    var color = Color.yellow
    let id = UUID()
    
    static var standard = Ellipse(origin: Point(x: 100, y: 100), width: 50, height: 50)
    
    
}

extension Ellipse {
    var center : Point {
        get {
            return Point(x: origin.x + width / 2, y: origin.y + height / 2)
        }
        set(newValue){
            origin = Point(x: newValue.x - width / 2, y: newValue.y - height / 2)
        }
        
    }
    
    var ending : Point {
        get {
            return Point(x: origin.x + width, y: origin.y + height)
        }
        set(newValue){
            width = newValue.x - origin.x
            height = newValue.y - origin.y
        }
    }
   
}
