class Instrument < ApplicationRecord
  mount_uploader :image , ImageUploader
  serialize :image , JSON # if you use SQLite , add this line
  belongs_to :user , optional: true

  validates :title , :brand , :price , :model , presence: true
  validates :description , length: {maximum: 1000 , too_long: "%{count} characteres is  the maximum aloud."}
  validates :title , length: {maximum: 140 , too_long: "%{count} characteres is  the maximum aloud."}
  validates :price , numericality: {only_integer: true } , length: {maximum: 7}

  BRAND = %w{ Fiat Volkswagen Honda Citroen Ford Bmw Ferrari Audi Lifan Hyunday Chevrolet Mini AlfaRomeo }
  FINISH = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }
  CONDITION = %w{ New Excellent Mint Used Fair Poor }

end
