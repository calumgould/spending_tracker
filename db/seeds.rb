require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/track')
require('pry')

Track.delete_all()
Category.delete_all()
Merchant.delete_all()

############# CATEGORIES #############

category1 = Category.new({
  "name" => "Appearance"
})
category1.save()

category2 = Category.new({
  "name" => "Bills"
})
category2.save()

category3 = Category.new({
  "name" => "Enjoyment"
})
category3.save()

category4 = Category.new({
  "name" => "Family"
})
category4.save()

category4 = Category.new({
  "name" => "Home"
})
category4.save()

category5 = Category.new({
  "name" => "Income"
})
category5.save()

category6 = Category.new({
  "name" => "Insurance"
})
category6.save()

category7 = Category.new({
  "name" => "One-off or Other"
})
category7.save()

category8 = Category.new({
  "name" => "Repayments"
})
category8.save()

category9 = Category.new({
  "name" => "Savings"
})
category9.save()

category10 = Category.new({
  "name" => "Transfers"
})
category10.save()

category11 = Category.new({
  "name" => "Transport"
})
category11.save()

category12 = Category.new({
  "name" => "Untagged"
})
category12.save()

category13 = Category.new({
  "name" => "Food"
})
category13.save()

#####################################

############# MERCHANTS #############

merchant1 = Merchant.new({
  "name" => "Scotmid"
})
merchant1.save()

merchant2 = Merchant.new({
  "name" => "Tesco"
})
merchant2.save()

merchant3 = Merchant.new({
  "name" => "Amazon"
})
merchant3.save()

merchant4 = Merchant.new({
  "name" => "ScotRail"
})
merchant4.save()

merchant5 = Merchant.new({
  "name" => "Scotmid"
})
merchant5.save()

merchant6 = Merchant.new({
  "name" => "Pret A Manger"
})
merchant6.save()

merchant7 = Merchant.new({
  "name" => "Barburrito"
})
merchant7.save()

merchant8 = Merchant.new({
  "name" => "SSE"
})
merchant8.save()

merchant9 = Merchant.new({
  "name" => "Lothian Buses"
})
merchant9.save()

merchant10 = Merchant.new({
  "name" => "Under Armour"
})
merchant10.save()

merchant11 = Merchant.new({
  "name" => "River Island"
})
merchant11.save()

merchant12 = Merchant.new({
  "name" => "Statement Barbers"
})
merchant12.save()

#####################################


############# TRACKS #############

track1 = Track.new({
  "amount" => "20",
  "category_id" => category1.id,
  "merchant_id" => merchant12.id
  })
track1.save()

track2 = Track.new({
  "amount" => "30",
  "category_id" => category13.id,
  "merchant_id" => merchant1.id
  })
track2.save()

track3 = Track.new({
  "amount" => "100",
  "category_id" => category1.id,
  "merchant_id" => merchant10.id
  })
track3.save()

track4 = Track.new({
  "amount" => "5",
  "category_id" => category11.id,
  "merchant_id" => merchant9.id
  })
track4.save()

track5 = Track.new({
  "amount" => "30",
  "category_id" => category3.id,
  "merchant_id" => merchant3.id
  })
track5.save()

#####################################

binding.pry
nil
