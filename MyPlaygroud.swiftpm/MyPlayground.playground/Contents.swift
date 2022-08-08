import UIKit
import Foundation

var greeting = "Hello, playground"
//入门语句
print("hello swift")
//定义变量
var myVariable = 42
myVariable = 50
//定义常量
let myConstant = 42
//编译器会自动推断类型，也可以指定类型
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
//练习：创建一个显式类型为float，值为4的常量
let explicitFloat: Float = 4

//类型转换  类型（变量）
let lable = "The width is"
let width = 94
let widthLable = lable + String(width)
//另一种转字符串转换方式   \(变量)
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//练习：把一个浮点计算放入字符串，欢迎语句加上某人的名字
let floatA:Float = 4.9
let floatB = 8
let friendName = "xiaohei"
let sentence = "welcome \(friendName), do you have \(floatA + Float(floatB)) yuan?"

//多行字符串 """...."""
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)

//使用[]创建数组和字典
var shopingList = ["catfish", "water", "tulips", "blue paint"]
shopingList[1] = "bottle of water"
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"
print(occupations)
//设置空数组或字典，可指定类型 或自动推断
let emptyArray = [String]()
let emptyDictionary = [String:Float]()
shopingList = []
occupations = [:]

//for..in循环
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}
print(teamScore)

//标记可选值 类型后面+？使用if let操作可选值
var optionalString: String? = "Hello"
print(optionalString == nil)
var optionalName: String? = "John Appleseed"
//optionalName = nil
//var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}else{
    print(greeting)
}
//使用？？处理可选值
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
//let informalGreeting = "Hi \(nickName)"
//Switch支持各种类型的比较
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucurmber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
//字典遍历
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers{
    for number in numbers{
        if number > largest{
            largest = number
            largestKind = kind
        }
    }
}
print("\(largestKind) have largest number,it's \(largest).")
//while循环
var n = 2
while n < 100{
    n = n * 2
}
print(n)
var m = 2
repeat{
    m = m * 2
}while m < 100
print(m)
//序列空间  ..<不包含最大值 或... 包含最大值
var total = 0
for i in 0..<4{
    total += i
}
print(total)

//函数func 函数名（参数）-> 返回值{内容}
func greet(person: String, day: String) -> String {
    return "Hello \(person),today is \(day)."
}
greet(person: "Bob", day: "Tuesday")
//练习：移除参数day，添加一个参数表示今天午餐吃了什么，在欢迎语句中显示
func practice(person: String, lunch: String){
    print("Hello \(person), lunch is \(lunch) today.")
}
practice(person: "Blake", lunch: "rice")
//自定义参数标签
func greet2(_ person: String, on day: String) -> String{
    return "Hello \(person), today is \(day)."
}
greet2("John", on: "Wednesday")
//使用元组创建复合值
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    for score in scores {
        if score > max{
            max = score
        }else if score < min{
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
//多参数函数
func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)
//练习：计算参数平均数函数
func averageOf(numbers: Int...) -> Int {
    var sum = 0
    var i = 0
    for number in numbers {
        sum += number
        i += 1
    }
    return sum/(i == 0 ? 1 : i)
}
averageOf()
averageOf(numbers: 42, 597, 12)
//内嵌函数
func returnFifteen() -> Int {
    var y = 10
    func add (){
        y += 5
    }
    add()
    return y
}
returnFifteen()
//函数做返回值
func makeIncrement() -> ((Int) -> Int){
    func addOne (number: Int) -> Int{
        return 1+number
    }
    return addOne
}
var increment = makeIncrement()
increment(7)
//函数做参数
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list{
        if condition(item){
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen(number:))
//闭包
var re = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(re)
//练习：重写闭包令奇数返回0
var singleNum = numbers.map({
    (number: Int) -> Int in
    let re = number%2
    return re == 0 ? number : 0
})
//简洁的闭包
let mappedNumbers = numbers.map{number in number * 3}
print(mappedNumbers)
let sortedNumbers = numbers.sorted{$0 > $1}
print(sortedNumbers)

//创建类并定义变量和方法
class Shape{
    var numberOfSides = 0
    func simpleDecripeion() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
//练习：创建一个类，包含一个常量和带参数的方法
class PracticeClass {
    let constant = 2
    func methods(param: String) {
        print("Hello class")
    }
}
//创建实例
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDecripeion()
//初始化器  init 和 反初始化器 deinit
class NamedShape {
    var numberOfSide: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDecription() -> String {
        return "A shape with \(numberOfSide) sides."
    }
}
var nameShape = NamedShape(name: "square")
//子类与父类
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSide = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDecription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDecription()
//练习：创建一个带半径和名称的circle子类,实现area和simpleDecription方法
class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return radius * radius * 3.14
    }
    override func simpleDecription() -> String {
        return "A circle with radius of length \(radius)"
    }
}
let testCricle = Circle(radius: 2, name: "my test cricle")
testCricle.area()
testCricle.simpleDecription()
//getter和setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSide = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    override func simpleDecription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
//willset和didset
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
//可选值？
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sidesLength = optionalSquare?.sideLength

//枚举    enum
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, joker
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        case .joker:
            return "joker"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
//练习：写一个函数通过对比原始值来比较两个Rank值
func compareRank(value1: Int, value2: Int) -> String {
    if(value1 > value2){
        return "v1 大于 v2"
    }else if (value2 > value1){
        return "v1 小于 v2"
    }else {
        return "v1 等于 v2"
    }
}
let king = Rank.king
let kingRawValue = king.rawValue
compareRank(value1: aceRawValue, value2: kingRawValue)
//初始化原始值    init?(rawValue:)
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}
//无原始值的枚举
enum Suit {
    case spades, hearts, diamonds, clubs, red, black
    func simpleDescription() -> String {
        switch self{
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamouds"
        case .clubs:
            return "clubs"
        case .red:
            return "red"
        case .black:
            return "black"
        }
    }
    func color() -> String {
        switch self {
        case .spades, .diamonds:
            return "black"
        default:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsRawValue = hearts.simpleDescription()
//练习：添加一个 color()方法到 Suit，为黑桃和梅花返回“black”，为红桃和方片返回“red”。
let color = hearts.color()
//自定义枚举值
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case timeout(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let timeout = ServerResponse.timeout("timeout")
switch success{
case let .result(sunrise, sunset):
    print("sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(mesage):
    print("Failure...   \(mesage)")
case let .timeout(message):
    print("Connection \(message)")
}
//练习：添加第三个case到ServerResponse和switch
//结构体 struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func createADeckOfCard() -> [Card] {
        var cards = [Card]()
        for i in 1..<14 {
            if let convertedRank = Rank.init(rawValue: i){
                cards.append(Card(rank: convertedRank, suit: .clubs))
                cards.append(Card(rank: convertedRank, suit: .spades))
                cards.append(Card(rank: convertedRank, suit: .diamonds))
                cards.append(Card(rank: convertedRank, suit: .hearts))
            }
        }
        cards.append(Card(rank: .joker, suit: .red))
        cards.append(Card(rank: .joker, suit: .black))
        return cards
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//练习：给Card创建一个方法以创建整副扑克牌，并把rank和suit对应起来
let card = Card(rank: .ace, suit: .hearts)
var cards = card.createADeckOfCard()
for car in cards {
    print(car.simpleDescription())
}

//协议    protocol
protocol ExampleProtocol{
    var simpleDescription: String {get}
    mutating func adjust()
    func test()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
    func test() {
        print("new ask")
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    func test() {
        print("structure test")
    }
    var b = 3
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//练习：给协议添加另一个要求。
//使用extension给现存的类增加新功能
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
    func test() {
        print(self)
    }
}
print(7.simpleDescription)
//练习：给double添加一个扩展，添加absolute属性
protocol DoubleProtocol {
    var absoluteValue: Double {get}
}
extension Double: DoubleProtocol {
    var absoluteValue: Double {
        return self < 0 ? self * -1 : self
    }
}
print((-3.2).absoluteValue)
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)
print(a.anotherProperty)

//错误处理  error 通过继承error协议定义错误
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
//使用throw 和throws 抛出错误
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}
//异常处理 do-catch
do {
    let printerResponse = try send(job: 1041, toPrinter: "Never has Toner")
    print(printerResponse)
}catch {
    print(error)
}
//多catch处理
enum lserror: Error {
    case lserror
}
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
    //throw PrinterError.onFire
    //throw PrinterError.outOfPaper
    throw lserror.lserror
}catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
}catch let printerError as PrinterError {
    print("Printer error : \(printerError).")
}catch{
    print(error)
}
//try?转换结果项
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never has Toner")
//defer java中的finally
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains (_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)

//范型
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOfTimes{
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element] where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element{
    var x = [T.Iterator.Element]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem{
                x.append(lhsItem)
            }
        }
    }
    return x
}
anyCommonElements([1, 2, 3], [3])
