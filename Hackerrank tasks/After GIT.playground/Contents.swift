import UIKit

func cavityMap(grid: [String]) -> [String] {
    if grid.count < 3 {
        return grid
    }
    var arrayOfStrings = grid

        for i in 1...arrayOfStrings.count-2 {
            for j in 1...arrayOfStrings[i].count-2 {
                let iJ = arrayOfStrings[i].index(arrayOfStrings[i].startIndex, offsetBy: j)
                if arrayOfStrings[i][iJ] == "X" {
                    continue
                }

                let iJMinusOne = arrayOfStrings[i].index(arrayOfStrings[i].startIndex, offsetBy: j-1)
                let iJPlusOne = arrayOfStrings[i].index(arrayOfStrings[i].startIndex, offsetBy: j+1)
                let iMinusOneJ = arrayOfStrings[i-1].index(arrayOfStrings[i].startIndex, offsetBy: j)
                let iPlusOneJ = arrayOfStrings[i+1].index(arrayOfStrings[i].startIndex, offsetBy: j)


                let intValue = Int(String(arrayOfStrings[i][iJ])) ?? 10
                let intValueIMinusOne = Int(String(arrayOfStrings[i][iJMinusOne])) ?? 10
                let intValueIPlusOne = Int(String(arrayOfStrings[i][iJPlusOne])) ?? 10
                let intValueJMinusOne = Int(String(arrayOfStrings[i-1][iMinusOneJ])) ?? 10
                let intValueJPlusOne = Int(String(arrayOfStrings[i+1][iPlusOneJ])) ?? 10

                if (intValue > intValueIMinusOne) && (intValue > intValueIPlusOne) && (intValue > intValueJMinusOne) && (intValue > intValueJPlusOne){
                    //arrayOfStrings[i][iJ] = "X"
                    arrayOfStrings[i].replaceSubrange(iJ...iJ, with: "X")
                }

            }
        }

        return arrayOfStrings

}

func palindromeIndex1(s: String) -> Int {
    let array = Array(s)
    let arrayCount = s.count
    let halfOfCount = arrayCount / 2

    var number = -1
    let lastNumber = arrayCount - 1

    for item in 0...halfOfCount {
        if array[lastNumber - item] == array[item] {
            continue
        }
        if array[lastNumber - item - 1] == array[item] {
            lastNumber - item - 1
            item
            number = item
            break
        }
        if array[lastNumber - item] == array[item + 1] {
            number = lastNumber - item
            break
        }
    }
    return number
}

func palindromeIndex(s: String) -> Int {
    let array = Array(s)
    let arrayCount = s.count
    let halfOfCount = arrayCount / 2

    var number = -1
    let lastNumber = arrayCount - 1
    for item in 0...halfOfCount {
        if array[lastNumber - item] == array[item] {
            continue
        }

        if array[lastNumber - item] == array[item + 1] && array[lastNumber - item - 1] == array[item + 1 + 1]{
            number = item
            break
        }

        if array[lastNumber - item - 1] == array[item] && array[lastNumber - item - 1 - 1] == array[item + 1] {
            number = lastNumber - item
            break
        }

    }
    return number
}
palindromeIndex(s: "hgygsvlfcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcwflvsgygh")
//hgygsvlfwcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcflvsgygh
//hgygsvlfcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcwflvsgygh

func stones(n: Int, a: Int, b: Int) -> [Int] {
    let count = n - 1

    var array = [Int]()
    for item in 0...count {
        array.append((a * item) + (b * (count - item)))
    }
    return Array(Set(array)).sorted()
}

stones(n: 5, a: 3, b: 23)
stones(n: 12, a: 73, b: 82)
stones(n: 73, a: 25, b: 25)

func toys(w: [Int]) -> Int {
    let sortedArray = w.sorted()

    var sum = 0
    var currentMin = sortedArray[0]
    for item in 1...sortedArray.count-1 {
        if (sortedArray[item] - sortedArray[item - 1]) > 4 || (sortedArray[item] - currentMin) > 4 {
            sum += 1
            currentMin = sortedArray[item]
        }

    }
    return sum + 1
}

toys(w: [1, 2, 3, 21, 7, 12, 14, 21])



