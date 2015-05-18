class Determiner
  attr_reader :result

  def initialize(review)
    @review = review.split(/\./)
    @good = 0
    @bad = 0
    @undefined = 0
    @result = ''
    @negative = ["concern", "off", "bad", "poor", "inconsistent", "dissatisfied",
                 "less", "limitation", "interrupt", "disagree", "nasty",
                 "unacceptable", "awful", "innapropriate"]
    @positive = ["good", "great", "alright", "well", "acceptable", "admirable",
                 "asset", "help", "Happy", "effective", "consistent", "satisfied",
                 "wonderful", "fantastic", "excellent", "amazing", "awsome",
                 "astonishing", "pleasure", "successfull", "enjoy", "devoted",
                 "perfect"]
  end

  def analyze
    @review.each do |x|
      @negative.each {|a| x.match(a) ? @bad += 1 : @undefined += 1}
      @positive.each {|b| x.match(b) ? @good += 1 : @undefined += 1}
    end
    @bad > @good ? "poor" : "satisfactory"
  end

end
