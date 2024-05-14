//
//  ContentView.swift
//  ToDo
//
//  Created by agmma on 2023/12/31.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @State var currentDate = Date()
    @Environment(\.modelContext)
    private var modelContext
    @Query(sort: \Todo.orderIndex) var todoList: [Todo]
    
    func addTodo() {
        withAnimation{
            let newTodo = Todo(title: "할 일 ", orderIndex: todoList.count)
            //            todoList.append(newTodo)
            modelContext.insert(newTodo)
        }
    }
    func deleteTodo(indexSet:IndexSet) {
        withAnimation
        {for index in indexSet{
            //            todoList.remove(at: index)
            //
            let todo = todoList[index]
            modelContext.delete(todo)
        }
        }
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            List {
                
                VStack(alignment: .leading){
                    
                    NavigationLink(destination: CalendarView()){
                        HStack{
                            Image("Calender")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            VStack(alignment: .leading, spacing: 5){
                                Text("My Task")
                                    .font(.title)
                                    .bold()
                                
                                ZStack{
                                    
                                    Text("당신의 오늘 할일을 기록해봐요!")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.gray)
                                        .padding(8)
                                        .background(Color.white)
                                        .cornerRadius(12)
                                    .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)}
                                
                                
                            }
                        }
                    }
                    Divider()
                    HorizontalCalendarView()
                        .padding(10)
                    Text("스와이프 하면 일정이 삭제됩니다!")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                    
                }
                
                
            }
            ZStack(alignment: .bottom){
                List{
                    ForEach(todoList) {todo in
                        HStack {
                            Image(systemName: todo.isCompleted == true ? "circle.fill" : "circle")
                                .foregroundColor(.purple
                                )
                            
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                    
                                }
                            
                            NavigationLink {
                                TododetailView(todo: todo)
                            } label: {
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted, color: Color.gray)
                                    .foregroundStyle(todo.isCompleted  ?
                                        .gray : Color.primary)
                            }
                        }
                        .listRowSeparator(.hidden)
                    }
                    .onDelete(perform: deleteTodo)
                    .onMove(perform: moveTodo)
                    
                    
                }
                .offset(y: -50)
                .listStyle(.plain)
                // .navigationTitle("My task.")
                
                .font(.system(size: 16))
                .foregroundStyle(.purple)
                
                Button(action: addTodo,
                       //전달할 때는 소괄호를 넣지않는다.
                       label: {
                    Image(systemName: "plus.circle.fill")
                    
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.purple)
                    
                })
                
            }
            
        }
        
        
    }
    
    
    func moveTodo(from source: IndexSet, to destination: Int)
    {
        var tempList = todoList
        tempList.move(fromOffsets: source, toOffset: destination)
        
        for (i, tempTodo) in tempList.enumerated() {
            if let todo = todoList.filter( { $0.id == tempTodo.id }).first {
                todo.orderIndex = i
            }
        }
    }
}











#Preview {
    ContentView()
}

