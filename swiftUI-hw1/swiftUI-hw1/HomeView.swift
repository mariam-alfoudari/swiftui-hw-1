//
//  HomeView.swift
//  swiftUI-hw1
//
//  Created by mariam alfoudari on 27/12/2020.
//

import SwiftUI

struct CalculatorState {
    var currentNumber: Double = 0
    var storedNumber: Double?
    var storedAction: ActionView.Action?
    
    mutating func appendNumber(_ number: Double) {
        if number.truncatingRemainder(dividingBy: 1) == 0 &&
            currentNumber.truncatingRemainder(dividingBy: 1) == 0 {
            currentNumber = 10 * currentNumber + number
        } else {
            currentNumber = number
        }
    }
}

struct HomeView: View {
    
    @State var state = CalculatorState()
     
    var displayedString: String {
        return String(format: "%.2f", [state.currentNumber])
    }
    var body: some View {
        VStack(alignment: .trailing, spacing: 20) {
            Spacer()
            
            Text(displayedString)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.black)
            .lineLimit(3)
            .padding(.bottom, 64)
            HStack{
                FunctionView(function: .cosinus, state: $state)
                Spacer()
                FunctionView(function: .sinus, state: $state)
                Spacer()
                FunctionView(function: .tangens, state: $state)
                Spacer()
//                FunctionView(function: .mulitply, state: $state)
                
                
            }
            HStack {
                NumberView(number: 7, state: $state)
                Spacer()
                NumberView(number: 8, state: $state)
                Spacer()
                NumberView(number: 9, state: $state)
                Spacer()
//                FunctionView(function: .Divide, state: $state)
            }
                HStack {
                    NumberView(number: 4, state: $state)
                    Spacer()
                    NumberView(number: 5, state: $state)
                    Spacer()
                    NumberView(number: 6, state: $state)
                    Spacer()
                    ActionView(action: .plus, state: $state)
                }
            HStack {
                NumberView(number: 1, state: $state)
                Spacer()
                NumberView(number: 2, state: $state)
                Spacer()
                NumberView(number: 3, state: $state)
                Spacer()
               ActionView(action: .minus, state: $state)
            }
            HStack {
                ActionView(action: .clear, state: $state)
                Spacer()
                NumberView(number: 0, state: $state)
                Spacer()
                NumberView(number: .pi, state: $state)
                Spacer()
                ActionView(action: .equal, state: $state )
            }
        }.padding(32)
    }
}
struct NumberView: View {
    let number: Double
    @Binding var state: CalculatorState
    
    var numberString: String {
        if number == .pi {
            return "π"
        }
       return String((number))
    }
    var body : some View {
        Text(numberString)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.orange)
            .cornerRadius(20)
            .shadow(color: Color.orange.opacity(0.3), radius: 10, x: 0, y: 10)
            .onTapGesture{
                print(numberString)
                self.state.appendNumber(Double(numberString)!)
                print(self.state.appendNumber(Double(numberString)!))
            }
    }
}
struct FunctionView: View {
    enum MathFunction {
        case sinus, cosinus, tangens
        
        func String() -> String {
            switch self {
            case .sinus: return "sin"
            case .cosinus: return "con"
            case .tangens: return "tan"
            }
        }
        func operation(_ input: Double) -> Double {
            switch self {
            case .sinus:   return sin(input)
            case .cosinus: return cos(input)
            case .tangens: return tan(input)
                
           }
        }
    }
    var function: MathFunction
    @Binding var state: CalculatorState
    
    var body: some View{
        return Text (function.String())
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.9),radius: 10, x: 0, y: 10)
            .onTapGesture {
                self.state.currentNumber = self.function.operation(self.state.currentNumber)
            }
         }
  }
struct ActionView: View{
    
    enum Action {
        case equal, clear, plus, minus, mulitply, Divide
        
        func image() -> Image {
        switch self {
           case .equal:
            return Image(systemName: "equal")
          case .clear:
            return Image(systemName: "xmark.bin.fill" )
        case  .plus:
             return Image(systemName: "plus" )
         case .minus:
          return Image(systemName: "minus")
        case .mulitply:
         return Image(systemName: "multiply" )
         case  .Divide:
          return Image(systemName: "Divide" )
              }
        }
        func calculate(_ input1: Double, _ input2: Double) -> Double? {
            switch self {
            case .plus:
                return input1 + input2
            case .minus:
                return input1 + input2
            case .mulitply:
                return input1 * input2
            case .Divide:
                return input1 / input2
            default:
                return nil
                
            }
        }
    }
    let action : Action
    @Binding var state: CalculatorState
    
    var body: some View {
        action.image()
            .font(Font.title.weight(.bold))
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x:0, y:10)
            .onTapGesture {
                self.tapped()
            }
    }
    func tapped (){
        switch action {
        case .clear:
            state.currentNumber = 0
            state.storedNumber = nil
            state.storedAction = nil
            break
        case .equal:
            guard let storedAction = state.storedAction
            else {
                return
            }
            guard let storedNumber = state.storedNumber
            else {
                return
            }
          guard let result = storedAction.calculate(storedNumber, state.currentNumber) else {
                return
            }
           state.currentNumber = result
            state.storedNumber = nil
            state.storedAction = nil
            break
        default:
            state.storedNumber = state.currentNumber
            state.currentNumber = 0
            state.storedAction = action
        }
        
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
