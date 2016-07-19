import "Recto" for Recto

var recto = Recto.new()
var testResult = ""

// split

testResult = recto.split("Word1&Word2&Word3", "&")
System.print(testResult)

testResult = recto.split("Word1&Word2&Word3&", "&")
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3", "&nbsp;")
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3&nbsp;", "&nbsp;")
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3&Word4", "&nbsp;")
System.print(testResult)

// split with limit

testResult = recto.split("Word1&Word2&Word3", "&", 2)
System.print(testResult)

testResult = recto.split("Word1&Word2&Word3&", "&", 2)
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3", "&nbsp;", 2)
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3&nbsp;", "&nbsp;", 2)
System.print(testResult)

testResult = recto.split("Word1&nbsp;Word2&nbsp;Word3&Word4", "&nbsp;", 2)
System.print(testResult)

// slice

testResult = recto.slice("Word1", 0)
System.print(testResult)

testResult = recto.slice("Word1", 1)
System.print(testResult)

testResult = recto.slice("Word1", 5)
System.print(testResult)

testResult = recto.slice("Word1", -1)
System.print(testResult)

testResult = recto.slice("Word1", -3)
System.print(testResult)

testResult = recto.slice("Word1", -6)
System.print(testResult)

// slice with length

testResult = recto.slice("Word1", 0, 1)
System.print(testResult)

testResult = recto.slice("Word1", 1, 2)
System.print(testResult)

testResult = recto.slice("Word1", 5, 4)
System.print(testResult)

testResult = recto.slice("Word1", -1, 2)
System.print(testResult)

testResult = recto.slice("Word1", -3, 2)
System.print(testResult)

testResult = recto.slice("Word1", -6, 2)
System.print(testResult)

testResult = recto.slice("Word1", -4, -2)
System.print(testResult)

testResult = recto.slice("Word1", -2, -4)
System.print(testResult)

// lower

testResult = recto.lower("myCamelCase")
System.print(testResult)

// upper

testResult = recto.upper("myCamelCase")
System.print(testResult)

// toChr

testResult = recto.toChr(33)
System.print(testResult)

// toOrd

testResult = recto.toOrd("!")
System.print(testResult)

// words

testResult = recto.words("my lower case")
System.print(testResult)

// verso

testResult = recto.verso("Word1")
System.print(testResult)

// isNum

testResult = recto.isNum("1")
System.print(testResult)

testResult = recto.isNum("A")
System.print(testResult)

testResult = recto.toNum("1")
System.print(testResult)

testResult = recto.toNum("A")
System.print(testResult)

// strip

testResult = recto.strip("  Word1  Word2  ")
System.print(testResult)

testResult = recto.strip("  Word1  Word2")
System.print(testResult)

testResult = recto.strip("Word1  Word2  ")
System.print(testResult)

testResult = recto.strip("Word1  Word2")
System.print(testResult)

testResult = recto.strip("

Word1  Word2

")

System.print(testResult)

testResult = recto.strip("

Word1  Word2

Word3")

System.print(testResult)
