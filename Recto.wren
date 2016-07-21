class Recto {
   /**
    * The constructor
    *
    * Ex.
    * import "Recto" for Recto
    * var recto = Recto.new()
    * System.print(recto.verso("lived"))
    *
    * @return A Recto object
    */
    construct new() {}
    
   /**
    * Split a string into a list of substrings
    *
    * The string is split on the boundaries defined by the separator.
    * The separator can be a single character or an entire string.
    *
    * Ex. split("Bacon&Lettuce&Tomato", "&")
    * Result is ["Bacon","Lettuce","Tomato"]
    *
    * @param string str The string to split
    * @param string sep The separator to split on
    *
    * @return list A list of substrings
    */
    split(str, sep) {
        var strToken = ""
        var chrToken = ""
        var sepCount = sep.bytes.count
        var sepIndex = 0
        var result   = []
        
        for (chr in str) {
            chrToken = chrToken + chr
            
            if (chr == sep[sepIndex]) {
                sepIndex = sepIndex + 1
                
                if (sepIndex == sepCount) {
                    result.add(strToken)
                    strToken = ""
                    chrToken = ""
                    sepIndex = 0
                }
            } else {
                strToken = strToken + chrToken
                chrToken = ""
                sepIndex = 0
            }
        }
        
        if (strToken.bytes.count > 0) {
            result.add(strToken)
        }
        
        return result
    }
   
   /**
    * Split a string into a list of substrings, up to a specified maximum
    *
    * The string is split on the boundaries defined by the separator.
    * The separator can be a single character or an entire string.
    * The method will stop processing the string as soon as it reaches the maximum,
    * and so longer strings will take the same amount of time as shorter strings.
    *
    * Ex. split("Bacon&Lettuce&Tomato", "&", 2)
    * Result is ["Bacon","Lettuce"]
    *
    * @param string str The string to split
    * @param string sep The separator to split on
    * @param number max The maximum number of substrings to return
    *
    * @return list A list of substrings
    */
    split(str, sep, max) {
        var strToken = ""
        var chrToken = ""
        var sepCount = sep.bytes.count
        var sepIndex = 0
        var result   = []
        
        for (chr in str) {
            chrToken = chrToken + chr
            
            if (chr == sep[sepIndex]) {
                sepIndex = sepIndex + 1
                
                if (sepIndex == sepCount) {
                    result.add(strToken)
                    strToken = ""
                    chrToken = ""
                    sepIndex = 0
                    
                    if (result.count == max) {
                        return result
                    }
                }
            } else {
                strToken = strToken + chrToken
                chrToken = ""
                sepIndex = 0
            }
        }
        
        if (strToken.bytes.count > 0) {
            result.add(strToken)
        }
        
        return result
    }
   
   /**
    * Slice a string into a substring, starting at the specified offset
    *
    * The substring will start at the offset and include the remaining string.
    * Each byte in a string is considered a single offset and counting starts at 0.
    * If the offset is negative then counting starts at the end of the string.
    *
    * Ex. slice("Madam", 1)
    * Result is "adam"
    *
    * Ex. slice("Madam", -4)
    * Result is "adam"
    *
    * @param string str The string to slice
    * @param number off The offset to start the substring at
    *
    * @return string The sliced substring
    */
    slice(str, off) {
        var strCount = str.bytes.count
        
        if (off > strCount - 1) {
            return ""
        } else if (off < 0) {
            off = strCount + off
            if (off < 0) { off = 0 }
        }
        
        return str[off..strCount - 1]
    }
   
   /**
    * Slice a string into a substring, starting at the specified offset and for a specified length
    *
    * The substring will start at the offset and include the remaining string, up until it reaches the maximum bytes specified by length.
    * Each byte in a string is considered a single offset and counting starts at 0.
    * If the offset is negative then counting starts at the end of the string.
    * If the length is negative then that many bytes will be omitted from the end of string.
    *
    * Ex. slice("Madam", 1, 3)
    * Result is "ada"
    *
    * Ex. slice("Madam", 1, -1)
    * Result is "ada"
    *
    * @param string str The string to slice
    * @param number off The offset to start the substring at
    * @param number len The maximum length of the substring
    *
    * @return string The sliced substring
    */ 
    slice(str, off, len) {
        var strCount = str.bytes.count
        
        if (off > strCount - 1) {
            return ""
        } else if (off < 0) {
            off = strCount + off
            if (off < 0) { off = 0 }
        }
        
        var strEndAt = off + len - 1
        
        if (len < 0) {
            strEndAt = strCount + len
            if (strEndAt < 0) { strEndAt = 0 }
        } else if (strEndAt > strCount - 1) {
            strEndAt = strCount - 1
        }
        
        if (off > strEndAt) {
            strEndAt = off
        }
        
        return str[off..strEndAt]
    }
    
   /**
    * Strip whitespace from both sides of a string
    *
    * It removes spaces, tabs, newlines, carriage returns, the NUL-byte and vertical tabs from both sides of a string.
    *
    * Ex. strip("\n Hello Wren! \n")
    * Result is "Hello Wren!"
    *
    * @param string str The string to strip
    *
    * @return string The stripped string
    */
    strip(str) {
        var strSpace = [" ", "\t", "\n", "\r", "\0", "\x0B"]
        var strTrimL = 0
        var strTrimR = 0
                
        for (chr in str) {
            if (strSpace.contains(chr)) {
                strTrimL = strTrimL + 1
            } else {
                break
            }
        }
        
        str = str[strTrimL...str.count]
        
        for (chr in str[str.count - 1..0]) {
            if (strSpace.contains(chr)) {
                strTrimR = strTrimR + 1
            } else {
                break
            }
        }
        
        return str[0...str.count - strTrimR]
    }
    
    // TODO: add the ability to specify what characters get stripped
    strip(str, spc) {
    
    }
    
    // TODO: add the ability to specify what side of the string gets stripped, as well as other modes
    strip(str, spc, mod) {
    
    }
    
   /**
    * Convert a string to lowercase
    *
    * Ex. lower("camelCaseIsAwesome!")
    * Result is "camelcaseisawesome!"
    *
    * @param string str The string to lowercase
    *
    * @return string The lowercased string
    */
    lower(str) {
        return str.bytes.map {|ord|
            if (ord >= 65 && ord <= 90) {
                ord = ord + 32
            }
            
            return toChr(ord)
        }.join()
    }
    
   /**
    * Convert a string to uppercase
    *
    * Ex. upper("camelCaseIsAwesome!")
    * Result is "CAMELCASEISAWESOME!"
    *
    * @param string str The string to uppercase
    *
    * @return string The uppercased string
    */
    upper(str) {
        return str.bytes.map {|ord|
            if (ord >= 97 && ord <= 122) {
                ord = ord - 32
            }
            
            return toChr(ord)
        }.join()
    }
    
   /**
    * Uppercase the first letter in each word
    *
    * Ex. words("the unicorn prances")
    * Result is "The Unicorn Prances"
    *
    * @param string str The string to update
    *
    * @return string The updated string
    */
    words(str) {
        var strWords = ""
        
        for (word in split(str, " ")) {
            strWords = strWords + upper(word[0]) + word[1...word.count] + " "
        }
        
        return strWords
    }
    
   /**
    * Reverse a string
    *
    * Ex. verso("lived")
    * Result is "devil"
    *
    * @param string str The string to reverse
    *
    * @return string The reversed string
    */
    verso(str) {
        return str[str.count - 1..0]
    }
    
   /**
    * Convert a character to its numeric ASCII value
    *
    * This only works with a single character.
    * This works with the extended ASCII table (0 - 255).
    *
    * Ex. toOrd("!")
    * Result is 33 as Num
    *
    * @param string chr The character to convert
    *
    * @return number The numeric ASCII value it represents
    */
    toOrd(chr) {
        return chr.bytes[0]
    }
    
   /**
    * Convert a numeric ASCII value to its character
    *
    * This only works with a single number.
    * This works with the extended ASCII table (0 - 255).
    *
    * Ex. toChr(33)
    * Result is "!"
    *
    * @param number ord The ASCII numeric value to convert
    *
    * @return string The character it represents
    */
    toChr(ord) {
        var decToHex = [
            "\x00", "\x01", "\x02", "\x03", "\x04", "\x05", "\x06", "\x07",
            "\x08", "\x09", "\x0A", "\x0B", "\x0C", "\x0D", "\x0E", "\x0F",
            "\x10", "\x11", "\x12", "\x13", "\x14", "\x15", "\x16", "\x17",
            "\x18", "\x19", "\x1A", "\x1B", "\x1C", "\x1D", "\x1E", "\x1F",
            "\x20", "\x21", "\x22", "\x23", "\x24", "\x25", "\x26", "\x27",
            "\x28", "\x29", "\x2A", "\x2B", "\x2C", "\x2D", "\x2E", "\x2F",
            "\x30", "\x31", "\x32", "\x33", "\x34", "\x35", "\x36", "\x37",
            "\x38", "\x39", "\x3A", "\x3B", "\x3C", "\x3D", "\x3E", "\x3F",
            "\x40", "\x41", "\x42", "\x43", "\x44", "\x45", "\x46", "\x47",
            "\x48", "\x49", "\x4A", "\x4B", "\x4C", "\x4D", "\x4E", "\x4F",
            "\x50", "\x51", "\x52", "\x53", "\x54", "\x55", "\x56", "\x57",
            "\x58", "\x59", "\x5A", "\x5B", "\x5C", "\x4D", "\x5E", "\x5F",
            "\x60", "\x61", "\x62", "\x63", "\x64", "\x65", "\x66", "\x67",
            "\x68", "\x69", "\x6A", "\x6B", "\x6C", "\x6D", "\x6E", "\x6F",
            "\x70", "\x71", "\x72", "\x73", "\x74", "\x75", "\x76", "\x77",
            "\x78", "\x79", "\x7A", "\x7B", "\x7C", "\x7D", "\x7E", "\x7F",
            "\x80", "\x81", "\x82", "\x83", "\x84", "\x85", "\x86", "\x87",
            "\x88", "\x89", "\x8A", "\x8B", "\x8C", "\x8D", "\x8E", "\x8F",
            "\x90", "\x91", "\x92", "\x93", "\x94", "\x95", "\x96", "\x97",
            "\x98", "\x99", "\x9A", "\x9B", "\x9C", "\x9D", "\x9E", "\x9F",
            "\xA0", "\xA1", "\xA2", "\xA3", "\xA4", "\xA5", "\xA6", "\xA7",
            "\xA8", "\xA9", "\xAA", "\xAB", "\xAC", "\xAD", "\xAE", "\xAF",
            "\xB0", "\xB1", "\xB2", "\xB3", "\xB4", "\xB5", "\xB6", "\xB7",
            "\xB8", "\xB9", "\xBA", "\xBB", "\xBC", "\xBD", "\xBE", "\xBF",
            "\xC0", "\xC1", "\xC2", "\xC3", "\xC4", "\xC5", "\xC6", "\xC7",
            "\xC8", "\xC9", "\xCA", "\xCB", "\xCC", "\xCD", "\xCE", "\xCF",
            "\xD0", "\xD1", "\xD2", "\xD3", "\xD4", "\xD5", "\xD6", "\xD7",
            "\xD8", "\xD9", "\xDA", "\xDB", "\xDC", "\xDD", "\xDE", "\xDF",
            "\xE0", "\xE1", "\xE2", "\xE3", "\xE4", "\xE5", "\xE6", "\xE7",
            "\xE8", "\xE9", "\xEA", "\xEB", "\xEC", "\xED", "\xEE", "\xEF",
            "\xF0", "\xF1", "\xF2", "\xF3", "\xF4", "\xF5", "\xF6", "\xF7",
            "\xF8", "\xF9", "\xFA", "\xFB", "\xFC", "\xFD", "\xFE", "\xFF",
        ]
        
        return decToHex[ord]
        
        /* wren doesn't support incomplete byte sequences
           and so this implementation will have to wait
        var hex = "\x"
        var rem = 0
        
        while (int > 0) {
            rem = int % 16
            int = (int / 16).floor
            
            hex = hex + "%(rem)"
        }
        
        return hex
        */
    }
    
   /**
    * Convert a string to a number
    *
    * Ex. toNum("123")
    * Result is 123 as Num
    *
    * Ex. toNum("ABC")
    * Result is null
    *
    * @param string str The number (as String) to convert
    *
    * @return number The number (as Num) it represents or null if the string does not represent a number
    */
    toNum(str) {
        return Num.fromString(str)
    }
    
   /**
    * Check if a string represents a number
    *
    * Ex. isNum("123")
    * Result is true
    *
    * Ex. isNum("ABC")
    * Result is false
    *
    * @param string str The number (as String) to check
    *
    * @return bool true if the string represents a number
    */ 
    isNum(str) {
        return toNum(str) is Num
    }
}