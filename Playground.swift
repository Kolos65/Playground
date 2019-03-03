//The optional assignment operator
infix operator ?=
func ?=<T>(left: inout T, right: T?) {
    left = right ?? left
}

var name = "Simon"
let nilName: String?
let newName: String? = "Simonett"

name ?= nilName 
//name: "Simon"
name ?= newName 
//name: "Simonett"


//Grouping based on first letter
struct Person: CustomStringConvertible {
    var name: String?
    var age: Int?
    var address: String?

    var description: String {
        return name ?? "nil"
    }
}

private extension Array where Element == Person {
    var grouped: [String: [Person]] {
        return self.reduce(into: [String: [Person]]()) {
            guard let firstCharacter = $1.name?.first else { return }
            let letter = String(firstCharacter)
            $0[letter] = ($0[letter] ?? []) + [$1]
        }
    }
}


let names = ["Adam","Andy","Alex","Bob","Betty","Dean","Deril","Tim","Thomas",
                "Roger","Rick","Rami","Peter","Zack","Zimba","Zumba","Kitty","Keys","Christopher","Cindy","Xavier"]

let people = names.map { Person(name: $0, age: nil, address: nil) }

let groups = people.grouped

print(groups)

/* ["A": [Adam, Andy, Alex], "X": [Xavier], "R": [Roger, Rick, Rami], "B": [Bob, Betty], "K": [Kitty, Keys], 
"D": [Dean, Deril], "P": [Peter], "T": [Tim, Thomas], "Z": [Zack, Zimba, Zumba], "C": [Christopher, Cindy]] */
