require 'minitest/autorun'
require_relative 'cryptographer.rb'

class EncryptorTest < Minitest::Test

  def test_it_encrypts_using_rot13
    engine = Encryptor.new(13)
    output = engine.encrypt("My Message")
    assert_equal "Zl Zrffntr", output
  end

  def test_it_encrypts_all_caps
    engine = Encryptor.new(13)
    output = engine.encrypt("HELLO")
    assert_equal "URYYB", output
  end

  def test_it_encrypts_with_random_key
    engine = Encryptor.new(6)
    output = engine.encrypt("Hello")
    assert_equal "Nkrru", output
  end

end

class DecryptorTest < Minitest::Test

  def test_it_decrypts_using_rot13
    engine = Decryptor.new(13)
    output = engine.decrypt("Zl Zrffntr")
    assert_equal "My Message", output
  end

  def test_it_decrypts_all_caps
    engine = Decryptor.new(13)
    output = engine.decrypt("HELLO")
    assert_equal "URYYB", output
  end

  def test_it_decrypts_with_random_key
    engine = Decryptor.new(6)
    output = engine.decrypt("Nkrru")
    assert_equal "Hello", output
  end

end
