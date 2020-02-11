require_relative('../models/category')
require_relative('../models/merchant')
require_relative('../models/track')
require_relative('../models/budget')
require('pry')

Track.delete_all()
Category.delete_all()
Merchant.delete_all()
Budget.delete_all()

############# BUDGETS #############

budget1 = Budget.new({
  "amount" => "500"
})
budget1.save()

#####################################

############# CATEGORIES #############

category1 = Category.new({
  "name" => "Appearance"
})
category1.save()

category2 = Category.new({
  "name" => "Enjoyment"
})
category2.save()

category3 = Category.new({
  "name" => "Home"
})
category3.save()

category4 = Category.new({
  "name" => "One-off or Other"
})
category4.save()

category5 = Category.new({
  "name" => "Transport"
})
category5.save()

category6 = Category.new({
  "name" => "Untagged"
})
category6.save()

category7 = Category.new({
  "name" => "Food"
})
category7.save()

category8 = Category.new({
  "name" => "Business"
})
category8.save()

category9 = Category.new({
  "name" => "Personal"
})
category9.save()

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
  "name" => "My Protein"
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
  "merchant_id" => merchant12.id,
  "time_stamp" => "2020-02-10 15:43:20"
  })
track1.save()

track2 = Track.new({
  "amount" => "30",
  "category_id" => category7.id,
  "merchant_id" => merchant1.id,
  "time_stamp" => "2020-02-06 12:36:10"
  })
track2.save()

track3 = Track.new({
  "amount" => "100",
  "category_id" => category9.id,
  "merchant_id" => merchant10.id,
  "time_stamp" => "2020-02-02 10:16:52"
  })
track3.save()

track4 = Track.new({
  "amount" => "5",
  "category_id" => category5.id,
  "merchant_id" => merchant9.id,
  "time_stamp" => "2020-01-04 16:34:40"
  })
track4.save()

track5 = Track.new({
  "amount" => "30",
  "category_id" => category2.id,
  "merchant_id" => merchant3.id,
  "time_stamp" => "2020-01-13 20:26:14"
  })
track5.save()

#####################################

binding.pry
nil
