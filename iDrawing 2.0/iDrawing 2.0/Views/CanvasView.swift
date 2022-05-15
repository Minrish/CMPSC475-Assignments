//
//  CanvasView.swift
//  iDrawing 2.0
//
//  Created by Bert Yan on 3/24/22.
//

import SwiftUI

struct CanvasView: View {
    @ObservedObject var manager = ArtboardManager()
    
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    @State private var selectedTool: ShapeType = .line

        
    //TESTING FOR CONFIRMATION DIALOG
    @State private var showingConfirmation = false
    
    var body: some View {
         
        let dragGesture = DragGesture(minimumDistance: 0)
            .onChanged({ value in
                if manager.inProgressShape == nil {
                    manager.inProgressShape = Line(points: [], color: selectedColor, lineWidth: selectedLineWidth)
                    manager.deletedShapes.removeAll()
                } else {
                    var _shape = manager.inProgressShape as! Line
                    _shape.points.append(value.location)
                    manager.inProgressShape = _shape
                }
            })
            .onEnded { value in
                switch manager.inProgressShape!.type {
                    case .line:
                        manager.addShape()
                    case .rectangle:
                        manager.addShape()
                    case .ellipse:
                        manager.addShape()
                }
            }
        
        
        return VStack {
            ZStack {
                Color.white
                Canvas { context, size in
                    
                    for _shape in manager.drawnShapes {
                        let _line = _shape as! Line
                        var path = Path()
                        path.addLines(_line.points)
                        context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)
                        
                    }
                    
                    if manager.inProgressShape != nil {
                        
                        let _line = manager.inProgressShape as! Line
                        var path = Path()
                        path.addLines(_line.points)
                        context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)
                    }
                    
                    
                }
                .gesture(dragGesture)
            }
            Spacer()
            
            // ToolBar
            
            VStack{
                Divider()
                HStack {
                    
                    // Undo button
                    Button(action: {manager.undo()}, label: {Image(systemName: "arrow.uturn.backward.circle").imageScale(.large)})
                        .disabled(manager.drawnShapes.isEmpty)
                    
                    // Redo button
                    Button(action: {manager.redo()}, label: {Image(systemName: "arrow.uturn.forward.circle").imageScale(.large)})
                        .disabled(manager.deletedShapes.isEmpty)
                    
                    // Shape/Tool selector
                    Picker("Tools", selection: $selectedTool) {
                        Image(systemName: "scribble")
                            .tag(ShapeType.line)
                        Image(systemName: "circle")
                            .tag(ShapeType.ellipse)
                        Image(systemName: "rectangle")
                            .tag(ShapeType.rectangle)
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    // ColorPicker
                    ColorPicker("line color", selection: $selectedColor)
                        .labelsHidden()
                    Slider(value: $selectedLineWidth, in: 1...30) {
                        Text("linewidth")
                    }.frame(maxWidth: 100)
                    Text(String(format: "%.0f", selectedLineWidth))
                    
                }
                .padding()
            }
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
