//
//  ShopDesignWidget.swift
//  ShopDesignWidget
//
//  Created by Saboor on 06/03/2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "😀")
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

struct ShopDesignWidgetEntryView : View {
    var entry: Provider.Entry
    
    @State private var currentIndex = 0
        private let images = [Image("brown"), Image("pink"), Image("wood")]
    
    var body: some View {
        VStack(spacing: 0) {
            
            Image("pink")
                .resizable()
                .scaledToFit()
                .scaleEffect(1.3)
                
            
            VStack(alignment:.leading,spacing:0) {
                Text("Brown T-Shirt")
                    .font(.caption)
                HStack {
                    Text("$100")
                        .font(.footnote)
                    Spacer()
                }
                    
            }
            .offset(y:10)
        }
        .ignoresSafeArea(.all)
        .overlay(
            Image(systemName: "cart.circle")
            ,
            alignment: .topTrailing
        )
        .overlay(
            Image(systemName: "heart.circle")
            ,
            alignment: .topLeading
        )
        .overlay(
            Image(systemName: "chevron.right.circle")
            ,
            alignment: .bottomTrailing
        )
    }
    
}

struct ShopDesignWidget: Widget {
    let kind: String = "ShopDesignWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                ShopDesignWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                ShopDesignWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall])
    }
}

#Preview(as: .systemSmall) {
    ShopDesignWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
