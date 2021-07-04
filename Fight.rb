#ПРАВИЛА ИГРЫ:
#Есть 16 типов карт (оружия, заклинаний, если хотите) 
#вам дают 8 карт и компьютеру в самом начале игры
#и больше карты больше не перемешиваются 
#вам придётся играть все теми же картами
#компьютер генерирует код случайным образом
#вам надо его добить
#ПРОСТО ВВЕДИТЕ ЧИСЛО ОТ 0 ДО 8
class Player
    attr_accessor :name, :health, :power
    def initialize(n, h, pow)
        @name = n
        @health = h
        @power = pow
    end
    def isAlive
        @health > 0
    end
    def hit(opponent, cards)
        if self.name=="computer" 
            ind=rand(8)
        else
            ind=-1
            puts "GET CARD" 
            ind=Integer(gets)
            if ind < 0
               ind =0
            elsif ind >7 
               ind =7
            end
        end
        self.power=cards[ind].power
        self.health+=cards[ind].health
        puts "CARD: #{ind}"
        puts "#{cards[ind]}" 
        opponent.health -= self.power
    end
    def to_s
        "#{name}: Health: #{health}, Power: #{power}"
    end
end
class Card
    attr_accessor :power, :health, :title, :execute, :type, :index
    @@count=0
    def initialize
        @execute=false
        @@count+=1
        @type=rand(16)+1
        @index=@@count
        case @type
        when 1
           @title="Магический шар" 
           @power=1
           @health=0
        when 2
           @title="свеча"
           @power=0
           @health=77
        when 3
           @title="живой огонь" 
           @power=77
           @health=77
        when 4
           @title="огонь древних" 
           @power=32
           @health=12
        when 5
           @title="честное слово" 
           @power=16
           @health=0
        when 6
           @title="диско-чума"
           @power=12
           @health=-8
        when 7
           @title="DDOS атака в голову" 
           @power=66
           @health=20
        when 8
           @title="волна невезение" 
           @power=20
           @health=-5
        when 9
           @title="аспирин"
           @power=2
           @health=20
        when 10
           @title="чат-лох"
           @power=2
           @health=-10
        when 11
           @title="чат-бот"
           @power=5
           @health=-10
        when 12
           @title="вино ворона" 
           @power=0
           @health=20
        when 13
           @title="13 чертей" 
           @power=13
           @health=13
        when 14
           @title="доступ к админу" 
           @power=7
           @health=7
        when 15
           @title="морской шторм" 
           @power=13
           @health=-5
        when 16
           @title="ответ небесного сервера" 
           @power=42
           @health=42
        end        
    end
    def to_s
       "Card: #{title} Health: #{health} Power: #{power}" 
    end
end
play='yes'
step=0
def fight(step, p1, p2, c1, c2)
    play = 'yes'
    if p1.isAlive && p2.isAlive
        if step%2
           p1.hit(p2, c1)
        else
           p2.hit(p1, c2)
        end
        puts "RESULT" 
        show_info(p1, p2)
        puts "SELECT"
    end
    if !p2.isAlive 
        puts "#{p1.name} WON!"
        play = '#{p1.name}'
    elsif !p1.isAlive
        puts "#{p2.name} WON!"
        play = '#{p2.name}'
    elsif !p1.isAlive && !p2.isAlive
        puts "TIE!"
        play = 'TIE'
    end
    return play
end
def show_card(*p) 
    p.each { |x| puts x} 
end
def show_info(*p)
    p.each { |x| puts x}
end
card_p1=[]
card_p2=[] 
#initialize Players
puts "PLAYERS INFO"
p1 = Player.new("human", 100, 100)
p2 = Player.new("computer", 100, 100)
puts "LETS FIGHT!"
while play == 'yes'
    puts "*********"
    puts "NEW CARDS" 
    8.times { card_p1 << Card.new} 
    8.times { card_p2 << Card.new}
    puts "PLAYER 1"
    card_p1.each {|x| show_card(x)} 
    puts "PLAYER 2"
    card_p2.each {|x| show_card(x)}
    show_info(p1, p2)
    play = fight(step, p1, p2, card_p1, card_p2)
    card_p1=[]
    card_p2=[]
    step+=1
end
puts "THE END"
