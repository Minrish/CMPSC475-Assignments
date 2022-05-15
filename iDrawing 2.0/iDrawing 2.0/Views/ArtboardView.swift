//
//  ArtboardView.swift
//  iDrawing 2.0
//
//  Created by Bert Yan on 3/21/22.
//

import Foundation
import SwiftUI

struct ArtboardView: View {
    @ObservedObject var manager = ArtboardManager()

    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    @State private var selectedTool: ShapeType = .line

    //TESTING FOR CONFIRMATION DIALOG
    @State private var showingConfirmation = false

    var body: some View {

        
//        switch selectedTool {
//            case .line:
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
                        default:
                            break
                        }
                    }

//            case .rectangle:
//                break
//            case .ellipse:
//                break
//        }
        
        

        return VStack {
            ZStack {
                Color.white
                Canvas { context, size in
                    for _shape in manager.drawnShapes {

                        switch _shape.type {
                            case .line:
                                let _line = _shape as! Line
                                var path = Path()
                                path.addLines(_line.points)
                                context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)

                            case .rectangle:
                                let _rectangle = _shape as! Rectangle
                                context.fill(
                                    Path(CGRect(origin: CGPoint(x: _rectangle.origin.x, y: _rectangle.origin.y), size: CGSize(width: _rectangle.width, height: _rectangle.height))), with: .color(_rectangle.color)
                                )
                            case .ellipse:
                                let _ellipse = _shape as! Ellipse
                                context.fill(
                                    Path(ellipseIn: CGRect(origin: CGPoint(x: _ellipse.origin.x, y: _ellipse.origin.y), size: CGSize(width: _ellipse.width, height: _ellipse.height))), with: .color(_ellipse.color)
                                )
                        }

                    }


                    if manager.inProgressShape != nil {
                        
                        switch manager.inProgressShape!.type {
                            case .line:
                                let _line = manager.inProgressShape as! Line
                                var path = Path()
                                path.addLines(_line.points)
                                context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)

                            case .rectangle:
                                let _rectangle = manager.inProgressShape as! Rectangle
                                context.fill(
                                    Path(CGRect(origin: CGPoint(x: _rectangle.origin.x, y: _rectangle.origin.y), size: CGSize(width: _rectangle.width, height: _rectangle.height))), with: .color(_rectangle.color)
                                )
                            case .ellipse:
                                let _ellipse = manager.inProgressShape as! Ellipse
                                context.fill(
                                    Path(ellipseIn: CGRect(origin: CGPoint(x: _ellipse.origin.x, y: _ellipse.origin.y), size: CGSize(width: _ellipse.width, height: _ellipse.height))), with: .color(_ellipse.color)
                                )
                        }
                        
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
                    ColorPicker("color", selection: $selectedColor)
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

struct ArtboardView_Previews: PreviewProvider {
    static var previews: some View {
        ArtboardView()
    }
}
