class Decryptor

  attr_accessor :key

  def initialize(key)
    @key = key
  end

  def decrypt (message)
    abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    alphabet = abc.chars
    cipher = message.chars

    decrypted = []

    cipher.size.times do |element|
      abc.length.times do |letter|
        if cipher[element] == alphabet[letter] && cipher[element] == cipher[element].downcase && letter - @key < 0
          decrypted << alphabet[(letter - @key) + 26]
        elsif cipher[element] == alphabet[letter] && cipher[element] == cipher[element].upcase && letter - @key < 26
          decrypted << alphabet[(letter - @key) + 26]
        elsif cipher[element] == alphabet[letter]
          decrypted << alphabet[letter-@key]
        end
      end
      if cipher[element] == " "
        decrypted << " "
      end
    end

  decrypted.join("")
  end
end

class Encryptor

  attr_accessor :key

  def initialize(key)
    @key = key
  end

def encrypt(message)
    abc = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    alphabet = abc.chars
    cipher = message.chars

    encrypted = []

    cipher.size.times do |element|
      abc.length.times do |letter|
        if cipher[element] == alphabet[letter] && cipher[element] == cipher[element].downcase && letter + @key > 25
          encrypted << alphabet[(letter+@key)-26]
        elsif cipher[element] == alphabet[letter] && cipher[element] == cipher[element].upcase && letter + @key > 52
          encrypted << alphabet[(letter+@key)-26]
        elsif cipher[element] == alphabet[letter]
          encrypted << alphabet[letter+@key]
        end
      end
      if cipher[element] == " "
        encrypted << " "
      end
    end

  encrypted.join("")
  end
end
