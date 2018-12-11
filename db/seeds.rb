sally = User.create(username: "Sally", email: "sally@email.com", password: "pass")
sandra = User.create(username: "Sandra", email: "sandra@email.com", password: "pass1")

Wine.create(name: "Sauvignon Blanc", vineyard: "Cakebread", year: 2010, rating: 10, tasting_notes: "Vibrant, melon, citrus, mineral backbone", user_id: sally.id)

sally.wines.create(name: "Pinot Noir", vineyard: "Cakebread", year: 2017, rating: 7, tasting_notes: "Elegant, earthy, short")
sandra_rating = sandra.wines.build(name: "Pinot Grigio", vineyard: "J Vineyards", year: 2014, rating: 8, tasting_notes: "Pear, rose floral, sharp")
sandra_rating.save


Bob = User.create(username: "Bob", email: "bob@email.com", password: "pass1")
Wine.create(name: "Sauvignon Blanc", vineyard: "Vineyard Vines MV", year: 2014, rating: 7, tasting_notes: "light and refreshing!",  user_id: bob.id)

bob.wines.create(name: "Pinot Noir", vineyard: "Cakebread", year: 2015, rating: 9, tasting_notes: "c'est tres bon!")
