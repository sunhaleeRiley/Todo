//
//  TodoDetailView.swift
//  ToDo
//
//  Created by agmma on 2024/01/07.
//

import SwiftUI
import SwiftData

struct TododetailView: View {
//@State var currentDate = Date()
    @State var todo: Todo
    var body: some View {
        VStack(spacing: 20){
         
            HStack{
                Image("pen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                TextField("오늘의 할일은?", text: $todo.title)
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .padding(12)
                    .background(Color.purple)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
                
            }
            
            VStack(alignment: .leading, spacing: 20) {
              
                
                Text("상세내용을 입력해주세요!")
                    .font(.caption2)
                    .foregroundColor(.secondary)
                
                DatePicker(
                                     "날짜",
                                     selection: $todo.nowDate,
                                     displayedComponents: [.date]
                                 )
                                 .datePickerStyle(.compact)
                
                TextEditor(text: $todo.detail)
                    .font(.system(size: 15))
                    .frame(height: 200)
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 2)
            }
            
            Spacer()
            
            
            
            
        } .offset(y: +50)
        
            .padding(.horizontal)
            .background(Color(UIColor.systemGroupedBackground)) // iOS의 그룹 배경 색상
            .navigationBarTitle("My Task", displayMode: .inline)
        //                .navigationBarItems(trailing: Button("Save") {
        //                    // 저장 버튼 액션
        //                })
        
        
        
        
        
    }
}

//#Preview {
//    TododetailView(todo:Todo(title: "2번째화면의 투두"))
//}
