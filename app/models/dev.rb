class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one?(item_name)
    if self.freebies.find_by(item_name: item_name)
      true
    else
      false
    end
  end

  def give_away(dev, freebie)
    if self.received_one?(freebie.name)
      item = self.freebies.find_by(item_name:freebie.name)
      item.dev = dev.id
    else
      "You don't have a #{freebie.name} to give away"
  end

end
