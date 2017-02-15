# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [{name: "Programming"}, {name: "Design"}, {name: "Music"}]

categories.each do |category|
  Category.create(category)
end

trails = [
  {
    title: "Intro to JavaScript",
    author_id: 14,
    category_id: 4,
    description: "Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum."
  }
]

sections = [
  {title: "Basic JavaScript", trail_id: 6 },
  {title: "Advanced JavaScript", trail_id: 6}
]

resources = [
  {
    title: "Dan Abramov Fanpage",
    url: "http://github.com/gaearon",
    section_id: 1
  },
  {
    title: "Shrine to Linus Torvalds",
    url: "http://kernel.org",
    section_id: 1
  }
]

trails.each do |trail|
  Trail.create(trail)
end

sections.each do |section|
  Section.create(section)
end


resources.each do |resource|
  Resource.create(resource)
end
