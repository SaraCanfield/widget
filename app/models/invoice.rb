class Invoice < ActiveRecord::Base
  belongs_to :customer
  validates :quantity, :numericality => { :greater_than => 0 }
  validates :quantity, presence: :true
   validates :widgetType, presence: true
   validates :color, presence: true
  validates :requiredDate, presence: true
  validate :valid_required_date
   def valid_required_date
      if requiredDate.present? && requiredDate < 6.days.from_now
        errors.add(:requiredDate, "Required Date must be a week or more from today") 
      end
   end



end
