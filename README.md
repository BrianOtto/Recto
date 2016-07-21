# Recto
A String Manipulation Library for Wren

### Usage

---

import "Recto" for Recto

var recto = Recto.new()

System.print(recto.verso("lived"))

### Class Methods

---

**Split a string into a list of substrings**

split("Bacon&Lettuce&Tomato", "&")

Result is **["Bacon","Lettuce","Tomato"]**

---

**Split a string into a list of substrings, up to a specified maximum**

split("Bacon&Lettuce&Tomato", "&", 2)

Result is **["Bacon","Lettuce"]**

---

**Slice a string into a substring, starting at the specified offset**

slice("Madam", 1)

Result is **"adam"**

slice("Madam", -4)

Result is **"adam"**

---

**Slice a string into a substring, starting at the specified offset and for a specified length**

slice("Madam", 1, 3)

Result is **"ada"**

slice("Madam", 1, -1)

Result is **"ada"**

---

**Strip whitespace from both sides of a string**

strip("\n Hello Wren! \n")

Result is **"Hello Wren!"**

---

**Convert the string to lowercase**

lower("camelCaseIsAwesome!")

Result is **"camelcaseisawesome!"**

---

**Convert the string to uppercase**

upper("camelCaseIsAwesome!")

Result is **"CAMELCASEISAWESOME!"**

---

**Uppercase the first letter in each word**

words("the unicorn prances")

Result is **"The Unicorn Prances"**

---

**Reverse the string**

verso("lived")

Result is **"devil"**

---

**Convert the character to its numeric ASCII value**

toOrd("!")

Result is **33**

---

**Convert the numeric ASCII value to its character**

toChr(33)

Result is **"!"**

---

**Convert the string to a number**

toNum("123")

Result is **123** as Num

toNum("ABC")

Result is **null**

---

**Check if the string represents a number**

isNum("123")

Result is **true**

isNum("ABC")

Result is **false**