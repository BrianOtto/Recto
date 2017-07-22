import "Recto" for Recto

var testResult = ""

// split

testResult = Recto.split("Word1&Word2&Word3", "&")
System.print(testResult)

testResult = Recto.split("Word1&Word2&Word3&", "&")
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3", "&nbsp;")
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3&nbsp;", "&nbsp;")
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3&Word4", "&nbsp;")
System.print(testResult)

// split with limit

testResult = Recto.split("Word1&Word2&Word3", "&", 2)
System.print(testResult)

testResult = Recto.split("Word1&Word2&Word3&", "&", 2)
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3", "&nbsp;", 2)
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3&nbsp;", "&nbsp;", 2)
System.print(testResult)

testResult = Recto.split("Word1&nbsp;Word2&nbsp;Word3&Word4", "&nbsp;", 2)
System.print(testResult)

// slice

testResult = Recto.slice("Word1", 0)
System.print(testResult)

testResult = Recto.slice("Word1", 1)
System.print(testResult)

testResult = Recto.slice("Word1", 5)
System.print(testResult)

testResult = Recto.slice("Word1", -1)
System.print(testResult)

testResult = Recto.slice("Word1", -3)
System.print(testResult)

testResult = Recto.slice("Word1", -6)
System.print(testResult)

// slice with length

testResult = Recto.slice("Word1", 0, 1)
System.print(testResult)

testResult = Recto.slice("Word1", 1, 2)
System.print(testResult)

testResult = Recto.slice("Word1", 5, 4)
System.print(testResult)

testResult = Recto.slice("Word1", -1, 2)
System.print(testResult)

testResult = Recto.slice("Word1", -3, 2)
System.print(testResult)

testResult = Recto.slice("Word1", -6, 2)
System.print(testResult)

testResult = Recto.slice("Word1", -4, -2)
System.print(testResult)

testResult = Recto.slice("Word1", -2, -4)
System.print(testResult)

// lower

testResult = Recto.lower("myCamelCase")
System.print(testResult)

// upper

testResult = Recto.upper("myCamelCase")
System.print(testResult)

// toChr

testResult = Recto.toChr(33)
System.print(testResult)

// toOrd

testResult = Recto.toOrd("!")
System.print(testResult)

// words

testResult = Recto.words("my lower case")
System.print(testResult)

// verso

testResult = Recto.verso("Word1")
System.print(testResult)

// isNum

testResult = Recto.isNum("1")
System.print(testResult)

testResult = Recto.isNum("A")
System.print(testResult)

testResult = Recto.toNum("1")
System.print(testResult)

testResult = Recto.toNum("A")
System.print(testResult)

// strip

testResult = Recto.strip("  Word1  Word2  ")
System.print(testResult)

testResult = Recto.strip("  Word1  Word2")
System.print(testResult)

testResult = Recto.strip("Word1  Word2  ")
System.print(testResult)

testResult = Recto.strip("Word1  Word2")
System.print(testResult)

testResult = Recto.strip("

Word1  Word2

")

System.print(testResult)

testResult = Recto.strip("

Word1  Word2

Word3")

System.print(testResult)
