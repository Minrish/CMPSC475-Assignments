//
//  BuildingListView.swift
//  Campus Map 2
//
//  Created by Bert Yan on 2/28/22.
//

import SwiftUI

enum SectionStyle: String, CaseIterable {
    case none, byName
}

struct BuildingListView : View {
    @EnvironmentObject var locationsManager : LocationsManager
    @Binding var tabSelection : String
    var sectionStyle = SectionStyle.byName
    
    var body: some View{
        NavigationView{
            List{
                ForEach( sectionTitles(for: sectionStyle), id: \.self) { sectionTitle in
                    Section(header: Text(sectionTitle)) {
                        SectionViews(tabSelection: $tabSelection,
                                     filter: sectionFilter(for: sectionStyle, sectionTitle: sectionTitle))
                            .environmentObject(locationsManager)
                    }
                }
            }.navigationTitle("Penn State Buildings")
        }
        
    }
    
    // MARK: These functions are implemented for future extension
    // generate array of section titles based on section style
    func sectionTitles(for sectionStyle:SectionStyle) -> [String] {
        switch sectionStyle {
        case .byName:
            return locationsManager.campusBuildings.buildingTitles(using: {$0.name.firstLetter!})
        //case .byDecade: break
        default:
            assert(false, "No section titles for .none option")
        }
    }
    
    // generate a filter (predicate function) that tests whether a state belongs in the section with title sectionTitle using sectionStyle (by Name or by Decade)
    func sectionFilter(for sectionStyle:SectionStyle, sectionTitle:String) ->  ((Building) -> Bool) {
        switch sectionStyle {
        case .byName:
            return {$0.name.firstLetter! == sectionTitle}
        //case .byDecade:
        //     break
        default:
            assert(false, "No section filtering for .none option")
        }
    }
}
