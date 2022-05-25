module ApplicationHelper

    # 각 페이지 당 완전한 페이지 타이틀을 리턴!
    def full_title(page_title = '')                         # 메소드 정의와 파라미터
        base_title = "Ruby on Rails Tutorial Sample App"    # 변수 대입
        if page_title.empty?                                # 논리값 확인
            base_title                                      # 암묵적 리턴값 return 생략
        else                            
            page_title + " | " + base_title                 # 문자열 결합
        end
    end 
end
