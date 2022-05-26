# Word라는 class 생성
class Word
    # 어떠한 단어를 앞에서부터 읽어도 뒤에서부터 읽어도 똑같은 말하는 메소드 작성
    def palindrome?(str)
        str == str.reverse
    end
end

w = Word.new

w.palindrome?("foobar")
w.palindrome?("level")

# 위 클래스는 많이 부자연스럽다.
# 문자열 파라미터로 넘기는 메소드를 작성하기 위해 일부러 새로운 클래스를 만드는 것은 바람직하지 않다.

class Word < String
    def palindrome?
        self == self.reverse
    end
end

s = Word.new("level")

s.palindrome?