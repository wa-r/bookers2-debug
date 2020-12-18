class SearchController < ApplicationController
  
  def search
    @user = User.new
    @book = Book.new
    @value = params["search"]["value"] #検索にかけた文字列を@valueに代入
    @model = params["search"]["model"] #選択したmodelを@modelに代入
    @how = params["search"]["how"] #選択した検索方法howを@howに代入
    @datas = search_for(@model, @value, @how) #@datasに最終的な検索結果が入る
  end
  
  private
  
  def match(model, value) #def search_forでhowがmatchだった場合の処理
    if model == 'user' #modelがuserの場合の処理
      User.where(name: value) #whereでvalueと完全一致するnameを探します
    elsif model == 'book'
      Book.where(title: value)
    end
  end
  
  def forward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "#{value}%") 
    elsif model == 'book'
      Book.where("title LIKE ?", "#{value}%")
    end
  end
  
  def backward(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}")
    end
  end
  
  def partical(model, value)
    if model == 'user'
      User.where("name LIKE ?", "%#{value}%")
    elsif model == 'book'
      Book.where("title LIKE ?", "%#{value}%")
    end
  end  
    
  def search_for(model, value, how)
    case how
    when 'match'
      match(model, value)
    when 'forward'
      forward(model, value)
    when 'backward'
      backward(model, value)
    when 'partical'
      partical(model, value)
    end
  end
  
end
