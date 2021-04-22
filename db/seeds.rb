# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

books = [
  {
    isbn: '9781593275846',
    title: 'Eloquent JavaScript Second Edition',
    author: 'Marijn Haverbeke',
    published_on: '2014-12-14T00:00:00.000Z',
    pages: 472,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'JavaScript lies at the heart of almost every modern web application, from social apps to the newest browser-based games. Though simple for beginners to pick up and play with, JavaScript is a flexible, complex language that you can use to build full-scale applications.',
  },
  {
    isbn: '9781449331818',
    title: 'Learning JavaScript Design Patterns',
    author: 'Addy Osmani',
    published_on: '2012-07-01T00:00:00.000Z',
    pages: 254,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'With Learning JavaScript Design Patterns, you\'ll learn how to write beautiful, structured, and maintainable JavaScript by applying classical and modern design patterns to the language. If you want to keep your code efficient, more manageable, and up-to-date with the latest best practices, this book is for you.',
  },
  {
    isbn: '9781449365035',
    title: 'Speaking JavaScript',
    author: 'Axel Rauschmayer',
    published_on: '2014-02-01T00:00:00.000Z',
    pages: 460,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'Like it or not, JavaScript is everywhere these days-from browser to server to mobile-and now you, too, need to learn the language or dive deeper than you have. This concise book guides you into and through JavaScript, written by a veteran programmer who once found himself in the same position.',
  },
  {
    isbn: '9781491950296',
    title: 'Programming JavaScript Applications',
    author: 'Eric Elliott',
    published_on: '2014-07-01T00:00:00.000Z',
    pages: 254,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'Take advantage of JavaScript\'s power to build robust web-scale or enterprise applications that are easy to extend and maintain. By applying the design patterns outlined in this practical book, experienced JavaScript developers will learn how to write flexible and resilient code that\'s easier-yes, easier-to work with as your code base grows.',
  },
  {
    isbn: '9781593277574',
    title: 'Understanding ECMAScript 6',
    author: 'Nicholas C. Zakas',
    published_on: '2016-09-03T00:00:00.000Z',
    pages: 352,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'ECMAScript 6 represents the biggest update to the core of JavaScript in the history of the language. In Understanding ECMAScript 6, expert developer Nicholas C. Zakas provides a complete guide to the object types, syntax, and other exciting changes that ECMAScript 6 brings to JavaScript.',
  },
  {
    isbn: '9781491904244',
    title: 'You Don\'t Know JS',
    author: 'Kyle Simpson',
    published_on: '2015-12-27T00:00:00.000Z',
    pages: 278,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'No matter how much experience you have with JavaScript, odds are you don’t fully understand the language. As part of the \'You Don’t Know JS\' series, this compact guide focuses on new features available in ECMAScript 6 (ES6), the latest version of the standard upon which JavaScript is built.',
  },
  {
    isbn: '9781449325862',
    title: 'Git Pocket Guide',
    author: 'Richard E. Silverman',
    published_on: '2013-08-02T00:00:00.000Z',
    pages: 234,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'This pocket guide is the perfect on-the-job companion to Git, the distributed version control system. It provides a compact, readable introduction to Git for new users, as well as a reference to common commands and procedures for those of you with Git experience.',
  },
  {
    isbn: '9781449337711',
    title: 'Designing Evolvable Web APIs with ASP.NET',
    author: 'Glenn Block, et al.',
    published_on: '2014-04-07T00:00:00.000Z',
    pages: 538,
    cover_url: "https://picsum.photos/200/300?random=2",
    description: 'Design and build Web APIs for a broad range of clients—including browsers and mobile devices—that can adapt to change over time. This practical, hands-on guide takes you through the theory and tools you need to build evolvable HTTP services with Microsoft’s ASP.NET Web API framework. In the process, you’ll learn how design and implement a real-world Web API.',
  }
]

# Seeds book
# @param params [Hash]
# @return [Book]
def load_book(params)
  author = Author.by_name(params.delete(:author))
  
  params.tap do |e| 
    e[:author] = author
  end

  book = Book.where(title: params[:title]).first_or_create(params)
  puts "created book: #{book.title}."
  book
end

# Randomly assign a book to a library
# @param library [Library]
# @param book [Book]
# @param stock [Integer]
def load_inventory(library, book, stock)
  inventory = Inventory.add_book_to_library(library, book, stock)
  puts "#{library.name} has a stock of #{stock} of #{book.title}"
end

# main
# Load Libraries
libraries = Library.create([{ name: 'Northern Star' }, { name: 'Eastend Library' }])
puts "Created libraries: #{libraries.collect(&:name)}"

genre ||= Genre.first_or_create(name: 'Programming')

books.each do |e|
  e.tap { |n| n[:genre] = genre }
  
  book = load_book(e)
  library = libraries.sample
  stock = 10
  
  load_inventory(library, book, stock)
end

books = Book.first(5)
library = Library.create({ name: 'Woodend library' })
books.each { |book| load_inventory(library, book, 10) }


