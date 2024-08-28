class Post < ApplicationRecord
  enum age: { ageless: 0, age10s: 1, age20s: 2, age30s: 3, age40s: 4, age50s: 5, over60s: 6 }
  enum gender: { genderless: 0, male: 1, female: 2 }
  enum price: { lessthan3000: 0, lessthan5000: 1, lessthan10000: 2, lessthan30000: 3, morethan30000: 4 }
end
