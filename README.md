### Vigenere cypher implementation in Swift.

### Usage

```swift
let vigenere = Vigenere(key: "LABAS")
vigenere.encrypt(plainText: "ABCDE") // "LBDDW"
vigenere.decrypt(encryptedText: "LBDDW") // "ABCDE"
```

By default alphabet is 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'. You can specify different alphabet when initializing Vigenere:

```swift
let vigenere = Vigenere(alphabet: "ABCDEFGHIJKLMNOPQRSTUVWXYZ", key: "LABAS")
```
