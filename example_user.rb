class User
    attr_accessor :first_name, :last_name # 접근자(accessor) 작성, 변수@name과 변수@email에 접근할 수 있는 메소드
    # 레일즈에서는 인스턴스 변수를 컨트롤러 내부에서 선언하는 것만으로 뷰에서도 사용 가능
    
    # initializ는 루비의 특수한 메소드 (User.new 실행시 자동적으로 호출)
    def initialize(attributes = {})
        @first_name = attributes[:first_name]
        @last_name = attributes[:last_name]
    end

    def full_name
        "#{@first_name} #{@last_name}"
    end

    def alphabetical_name
        "#{@first_name}, #{@last_name}"
    end
end
