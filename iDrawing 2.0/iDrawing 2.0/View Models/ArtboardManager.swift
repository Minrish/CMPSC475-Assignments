//
//  ArtboardManager.swift
//  iDrawing 2.0
//
//  Created by Bert Yan on 3/21/22.
//

import Foundation

class ArtboardManager : ObservableObject {
    @Published var drawnShapes : [Shape] = [Shape]()
    @Published var inProgressShape : Shape?
    @Published var deletedShapes : [Shape] = [Shape]()
    
    func addShape(){
        if inProgressShape != nil{
            drawnShapes.append(inProgressShape!)
            inProgressShape = nil
        }
    }
    
    func newLine(_ line: Line){
        inProgressShape = line
    }
    
    func newRectangle(_ rectangle: Rectangle){
        inProgressShape = rectangle
    }
    
    func newElipse(_ ellipse: Ellipse){
        inProgressShape = ellipse
    }
    
    func undo(){
        let lastShape = drawnShapes.popLast()
        deletedShapes.append(lastShape!)
    }
    
    func redo() {
        let lastDeleted = deletedShapes.popLast()
        drawnShapes.append(lastDeleted!)
    }
    
}
