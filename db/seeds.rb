# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
    'https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/2560px-Pizza-3007395.jpg',
    'https://31p86334w2bvkz0249eyr0cr-wpengine.netdna-ssl.com/wp-content/uploads/2014/12/best-chicago-style-pizza-recipe-3.jpg',
    'http://cookdiary.net/wp-content/uploads/images/Chicago-Style-Pizza_5965.jpg',
    'https://cdn.nexternal.com/cincyfav3/images/larosas_cheese_pizzas.jpg',
    'https://digitalmarketing.blob.core.windows.net/9866/images/items/image432262.jpg',
    'https://www.usafleamarket1.com/wp-content/uploads/2018/02/image-905.jpg',
    'https://sirpizza-mi.com/wp-content/uploads/2017/11/Sir-Pizza-Royal-Feast-837_72-490x314.jpg',
    'http://dimondpizza.com/images/pizza/mushroom.jpg',
    'https://images.food52.com/xCVk3TjhDPDNcMO2kioQrMttHLc=/fit-in/1200x1200/c96076d4-ef12-450f-bb4a-dee11e341a88--2018-0626_grilled-corn-ranch-pizzas_3x2_ty-mecham_001.jpg',
    'http://www.scottspizzatours.com/images/temphome.jpg',
    'https://cdn.pinchofyum.com/wp-content/uploads/Pizza-with-Mozzarella-and-Pesto.jpg',
    'http://paulreverespizza.com/files/2014/04/dl3.jpg',
    'https://www.pizzaplanet.com/wp-content/uploads/2018/03/Website_OnlinePizza-min.png',
    'https://img.grouponcdn.com/deal/mCAFXuquUtdd6juyeN3E/QF-700x420/v1/c700x420.jpg',
    'https://hips.hearstapps.com/ghk.h-cdn.co/assets/18/03/2048x3071/gallery-1516313068-baguette-pizzas-ghk-0218.jpg',
    'https://assets.bonappetit.com/photos/5a9dd672eb730726d6c7ec19/16:9/w_1200,c_limit/pizza-slice-opener-pepperoni-cheese.jpg',
    'https://static1.squarespace.com/static/5808f02ee58c62d4801a430f/t/5a87671d24a694d70776bfd5/1518832580879/whole+pie_forbes.jpg',
    'https://detoxinista.com/wp-content/uploads/2012/01/best-cauliflower-pizza.jpg',
    'https://img.sndimg.com/food/image/upload/w_896,h_504,c_fill,fl_progressive,q_80/v1/img/recipes/11/00/67/YPpFj7SnSriaVNlZ9NBn_pita%20pizza.JPG',
    'https://img.huffingtonpost.com/asset/58b9c7d61900003300bd6a4d.jpeg'
].each { |url|
    Image.create!(url: url)
}
