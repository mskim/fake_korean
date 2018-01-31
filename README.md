# FakeKorean

gem for creating fake Korean data, such as name, email, address, company_name

## Installation

Add this line to your application's Gemfile:

    gem 'fake_korean'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fake_korean

## Usage
 p            = KoreanNameCard.new
 p.name       #=> 김민수
 p.en_name    #=> Min Soo Kim
 p.email      #=> mskim@naver.com
 p.address    #=> 서울시 영동구 독산동 삼익 Apt 120-5
 p.en_address #=> 120-5 Samic Apt Doksan-Dong Young-DungPo GU, Seoul


## Contributing

1. Fork it ( https://github.com/[my-github-username]/fake_korean/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
