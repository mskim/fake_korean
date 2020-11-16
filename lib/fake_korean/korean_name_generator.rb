# encoding: utf-8

class KoreanBase
  def generate_korean_name(options={})
    last_name=KOREAN_LAST_NAMES[rand(KOREAN_LAST_NAMES.length)]
    first_name=FIRST_NAMES[rand(FIRST_NAMES.length)]
    if options[:female]
      first_name=FIRST_NAMES_FEMALE[rand(FIRST_NAMES_FEMALE.length)]
    end
    return last_name,first_name
  end

  def generate_korean_company_name
    random_number=rand(COMPANY_NAMES.length)
    random_number-= 1 if random_number.odd?
    korean_company_name=COMPANY_NAMES[random_number]

  end

  def generate_korean_company_type
    random_number=rand(COMPANY_TYPES.length)
    random_number-= 1 if random_number.odd?
    korean_company_types=COMPANY_TYPES[random_number]
  end


  def generate_mail_server
    random_number=rand(MAIL_SERVERS.length)
    random_number-= 1 if random_number.odd?
    mail_server=MAIL_SERVERS[random_number]
  end

  def to_english(korean)
    english=""
    korean.each_char do |char|
      if SINGLE_SYLLABLE_HASH[char].nil?
        puts "Missing English table: #{char}"
      end
      english+= SINGLE_SYLLABLE_HASH[char] unless SINGLE_SYLLABLE_HASH[char].nil?
      # english+=" "
    end
    english
  end

  def to_english_initials(korean)
    english=""
    korean.each_char do |char|
      if SINGLE_SYLLABLE_HASH[char].nil?
        puts "Missing English table: #{char}"
      end
      english+= SINGLE_SYLLABLE_HASH[char][0] unless SINGLE_SYLLABLE_HASH[char].nil?
      # english+=" "
    end
    english
  end

  def company_division
    random_number=rand(DIVISIONS.length)
    random_number-= 1 if random_number.odd?
    company_division=DIVISIONS[random_number]
  end

  def company_title
    random_number=rand(TITLES.length)
    random_number-= 1 if random_number.odd?
    company_title=TITLES[random_number]
  end

  def generate_hand_phone_number
    area= KOREAN_HAND_PHONE[rand(KOREAN_HAND_PHONE.length)] + "-"
    three= rand(9).to_s + rand(9).to_s + rand(9).to_s + "-"
    four= rand(9).to_s + rand(9).to_s + rand(9).to_s + rand(9).to_s
    area + three + four
  end

  def generate_phone_number
    area= KOREAN_AREA_CODE[rand(KOREAN_AREA_CODE.length)] + "-"
    three= rand(9).to_s + rand(9).to_s + rand(9).to_s + "-"
    four= rand(9).to_s + rand(9).to_s + rand(9).to_s + rand(9).to_s
    area + three + four
  end

  def generate_a_korean_city
    random_number=rand(CITIES.length)
    random_number-= 1 if random_number.odd?
    koran_city=CITIES[random_number]
  end

  def generate_a_korean_gu
    random_number=rand(GU.length)
    random_number-= 1 if random_number.odd?
    koran_city=GU[random_number]
  end

  def generate_a_korean_dong
    random_number=rand(DONG.length)
    random_number-= 1 if random_number.odd?
    koran_city=DONG[random_number]
  end

  def generate_address1
    address1= ADDRESS_STREET[rand(ADDRESS_STREET.length)]
  end

  def generate_address2
    city= generate_a_korean_city
    index=CITIES.index(city)
    en_city=CITIES[index+1]

    gu= generate_a_korean_gu
    index=GU.index(gu)
    en_gu=GU[index+1]

    dong=generate_a_korean_dong
    index=DONG.index(dong)
    en_dong=DONG[index+1]

    korean=city + " "+ gu + " " + dong
    english=en_dong + " " + en_gu + " " + en_city
    return korean, english
  end
end

class KoreanCompany < KoreanBase
  attr_accessor :company_name,:en_company_name, :phone,:fax, :address1,:en_address1, :address2,:en_address2, :zip
  def initialize(options={})
    company_name=generate_korean_company_name
    en_company_name=COMPANY_NAMES[COMPANY_NAMES.index(company_name)+1]
    company_type=generate_korean_company_type
    en_company_type=COMPANY_TYPES[COMPANY_TYPES.index(company_type)+1]
    @company_name=company_name+company_type
    @en_company_name=en_company_name + " " + en_company_type
    @phone=generate_phone_number
    @fax=generate_phone_number
    @address1=@en_address1=generate_address1
    @address2,@en_address2=generate_address2
    @zip=ZIP[rand(ZIP.length)]
  end
end

class KoreanNameCard < KoreanBase
  attr_accessor :name, :company_name,:en_company_name, :division,:en_division, :title, :en_title, :cell, :email, :phone,:fax, :address1,:en_address1, :address2,:en_address2, :zip, :prefix, :en_last_name,:en_first_name

  def initialize(options={})
    last,first=generate_korean_name
    @name           = last+first
    # @en_last_name=KOREAN_LAST_NAMES[KOREAN_LAST_NAMES.index(last)+1]
    @en_last_name   = to_english(last)
    # @en_first_name=FIRST_NAMES[FIRST_NAMES.index(first)+1]
    @en_first_name  = to_english(first)

    company_name    = generate_korean_company_name
    en_company_name = COMPANY_NAMES[COMPANY_NAMES.index(company_name)+1]
    company_type    = generate_korean_company_type
    en_company_type = COMPANY_TYPES[COMPANY_TYPES.index(company_type)+1]
    @company_name   = company_name+company_type
    @en_company_name= en_company_name + " " + en_company_type
    @division       = company_division
    @en_division    = DIVISIONS[DIVISIONS.index(@division)+1]
    @title          = company_title
    @en_title       = TITLES[TITLES.index(@title)+1]
    name_sting      = @en_first_name+@en_last_name
    name_sting=to_english_initials(first)
    @email          = name_sting.downcase+@en_last_name.downcase+"@" + generate_mail_server
    @cell           = generate_hand_phone_number
    @phone          = generate_phone_number
    @fax            = generate_phone_number
    @address1       = @en_address1=generate_address1
    @address2,@en_address2 = generate_address2
    @zip            = ZIP[rand(ZIP.length)]
  end

end


