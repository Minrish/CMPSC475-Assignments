//
//  TitleView.swift
//  Multiply Speedrun 2
//
//  Created by Bert Yan on 1/24/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View{
        ZStack{
            Text(ViewConstants.title1stline).padding(10.0).background(RoundedRectangle(cornerRadius: 50).fill(Color.gray).opacity(0.2))
            Text(ViewConstants.title2ndline).padding(10.0).background(RoundedRectangle(cornerRadius: 50).fill(Color.gray).opacity(0.2))
        }
    }
}
