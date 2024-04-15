//
//  ContentView.swift
//  D-Day
//
//  Created by 김은정 on 4/15/24.
//

import SwiftUI

// struct
// UUID: 네트웤 상에서 고유성이 보장되는 id를 만들기 위한 표준 규약
struct Memo {
    // stored property
    var id: UUID = UUID()
    var title: String
    var endDate: Date
}


struct ContentView: View {
    @State var newText = ""
    @State var currentDate = Date()
    
    @State var showSheet = false
    @State var memoList: [Memo] = [
        Memo(title: "여름휴가", endDate: Date.now)
    ]
    
    
    var body: some View {
        NavigationStack {
            List(memoList, id: \.id) { memo in
                HStack {
                    Text(memo.title)
                    Text(memo.endDate.description)
                    Spacer()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            })
            .sheet(isPresented: $showSheet, content: {
                VStack {
                    TextField("새로운 일정", text: $newText)
                    DatePicker("종료일", selection: $currentDate, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                    Text("Sheet")
                    Button {
                        memoList.append(Memo(id: UUID(), title: newText, endDate: currentDate))
                        showSheet = false
                    } label: {
                        Text("추가")
                    }
                }
            })
        }
    }
}



#Preview {
    ContentView()
}


// struct와 class의 차이


// class는 위치를 저장
