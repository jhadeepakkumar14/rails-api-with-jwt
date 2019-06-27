vertical_1 = Vertical.where(name: 'Health & Fitness').first_or_create
vertical_2 = Vertical.where(name: 'Business').first_or_create
vertical_3 = Vertical.where(name: 'Music').first_or_create

category_1 = vertical_1.categories.where(name: 'Booty & Abs', state: "active").first_or_create
category_2 = vertical_1.categories.where(name: 'Full Body', state: "active").first_or_create
category_3 = vertical_2.categories.where(name: 'Advertising', state: "active").first_or_create
category_4 = vertical_2.categories.where(name: 'Writing', state: "active").first_or_create
category_5 = vertical_3.categories.where(name: 'Singing', state: "active").first_or_create
category_6 = vertical_3.categories.where(name: 'Music Fundamentals', state: "active").first_or_create

category_1.courses.where(name: 'Loose the Gutt, keep the Butt', state: 'active', author: 'Anowa').first_or_create
category_1.courses.where(name: 'BrittneBabe Fitness Transformation', state: 'active', author: 'Brittnebabe').first_or_create
category_2.courses.where(name: 'BTX: Body Transformation Extreme', state: 'active', author: 'Barstarzz').first_or_create
category_2.courses.where(name: 'Facebook Funnel Marketing', state: 'active', author: 'Russell Brunson').first_or_create
category_3.courses.where(name: 'Build a Wild Audience', state: 'active', author: 'Tim Nilson').first_or_create
category_4.courses.where(name: 'Editorial Writing Secrets', state: 'active', author: 'J. K. Rowling').first_or_create
category_4.courses.where(name: 'Scientific Writing', state: 'active', author: 'Stephen Hawking').first_or_create
category_5.courses.where(name: 'Vocal Training 101', state: 'active', author: 'Linkin Park').first_or_create
category_5.courses.where(name: 'Music Production', state: 'active', author: 'Lady Gaga').first_or_create
category_6.courses.where(name: 'Learn the Pianon', state: 'active', author: 'Lang Lang').first_or_create
category_6.courses.where(name: 'Become a guitar hero', state: 'active', author: 'Jimmy Page').first_or_create