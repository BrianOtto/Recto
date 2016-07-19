class Recto {
    construct new() {}
    
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
    
    split(str, sep, lim) {
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
                    
                    if (result.count == lim) {
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
    
    strip(str, spc) {
    
    }
    
    strip(str, spc, mod) {
    
    }
    
    lower(str) {
        return str.bytes.map {|ord|
            if (ord >= 65 && ord <= 90) {
                ord = ord + 32
            }
            
            return toChr(ord)
        }.join()
    }
    
    upper(str) {
        return str.bytes.map {|ord|
            if (ord >= 97 && ord <= 122) {
                ord = ord - 32
            }
            
            return toChr(ord)
        }.join()
    }
    
    words(str) {
        var strWords = ""
        
        for (word in split(str, " ")) {
            strWords = strWords + upper(word[0]) + word[1...word.count] + " "
        }
        
        return strWords
    }
    
    verso(str) {
        return str[str.count - 1..0]
    }
    
    toOrd(chr) {
        return chr.bytes[0]
    }
    
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
    
    isNum(str) {
        return toNum(str) is Num
    }
    
    toNum(str) {
        return Num.fromString(str)
    }
}