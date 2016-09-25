fileprivate extension String {
    subscript(i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
}

class Vigenere {
    let alphabet: String
    let alphabetSize: Int
    let key: String
    let keySize: Int

    init(alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", key: String) {
        self.alphabet = alphabet
        self.alphabetSize = alphabet.characters.count
        self.key = key
        self.keySize = key.characters.count
    }

    func encrypt(plainText: String) -> String {
        var encryptedText = ""

        for (index, character) in plainText.characters.enumerated() {
            let indexInAlphabet = indexOfAlphabet(forCharacter: character)

            if indexInAlphabet == -1 {
                encryptedText.append(character)
                continue
            }

            let keyToEncryptWith = key[index % keySize]
            let keyIndexInAlphabet = indexOfAlphabet(forCharacter: keyToEncryptWith)
            let encryptedLetterIndex = (indexInAlphabet + keyIndexInAlphabet) % alphabetSize
            encryptedText.append(alphabet[encryptedLetterIndex])
        }

        return encryptedText
    }

    func decrypt(encryptedText: String) -> String {
        var decryptedText = ""

        for (index, character) in encryptedText.characters.enumerated() {
            let indexInAlphabet = indexOfAlphabet(forCharacter: character)

            if indexInAlphabet == -1 {
                decryptedText.append(character)
                continue
            }

            let keyToEncryptWith = key[index % keySize]
            let keyIndexInAlphabet = indexOfAlphabet(forCharacter: keyToEncryptWith)
            let encryptedLetterIndex = (indexInAlphabet - keyIndexInAlphabet) % alphabetSize
            decryptedText.append(alphabet[encryptedLetterIndex])
        }

        return decryptedText
    }

    private func indexOfAlphabet(forCharacter character: Character) -> Int {
        var index = 0

        for chr in alphabet.characters {
            if chr == character {
                return index
            }
            index += 1
        }

        return -1
    }
}

