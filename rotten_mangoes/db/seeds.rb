# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  Movie.create(
    title:"Guardians of the Galaxy",
    director:"James Gunn",
    runtime_in_minutes:"121"
    poster_image_url: "http://ia.media-imdb.com/images/M/MV5BMTAwMjU5OTgxNjZeQTJeQWpwZ15BbWU4MDUxNDYxODEx._V1_SX214_AL_.jpg",
    release_date:"Dec 30, 2014"
    description: "After being deemed unfit for military service, Steve Rogers volunteers for a top secret research project that turns him into Captain America, a superhero dedicated to defending USA ideals."
    )


   Movie.create(
    title:"Antman",
    director:"John",
    runtime_in_minutes:"60",
    poster_image_url:"http://ia.media-imdb.com/images/M/MV5BMTU1MDAwNDk0NF5BMl5BanBnXkFtZTgwOTA4OTIzMDE@._V1_SX214_AL_.jpg",
    release_date:"Dec 30, 2014"
    )

   Movie.create(
    title:"Avengers",
    director:"Brandon",
    runtime_in_minutes:"100",
    poster_image_url:"http://ia.media-imdb.com/images/M/MV5BMTk2NTI1MTU4N15BMl5BanBnXkFtZTcwODg0OTY0Nw@@._V1_SY317_CR0,0,214,317_AL_.jpg",
    release_date:"Dec 30, 2014"
    )

   Movie.create(
    title:"Spiderman",
    director:"Greg",
    runtime_in_minutes:"190",
    poster_image_url:"http://ia.media-imdb.com/images/M/MV5BMjMyOTM4MDMxNV5BMl5BanBnXkFtZTcwNjIyNzExOA@@._V1_SX214_AL_.jpg",
    release_date:"Dec 30, 2014"
    )

   Movie.create(
    title:"Captain America",
    director:"James",
    runtime_in_minutes:"120",
    poster_image_url:"http://ia.media-imdb.com/images/M/MV5BMTYzOTc2NzU3N15BMl5BanBnXkFtZTcwNjY3MDE3NQ@@._V1_SX214_AL_.jpg",
    release_date:"Dec 30, 2014"
    )

