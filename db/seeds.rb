    User.create(
    name: "Jhon First",
        photo: "https://randomuser.me/api/portraits/men/9.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)
    User.create(
    name: "Jane First",
        photo: "https://randomuser.me/api/portraits/women/9.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)

    User.create(name: "Jhon Second",
        photo: nil,
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)
    User.create(name: "Jane Second",
        photo: nil,
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)

    User.create(name: "Jhon Third",
        photo: "https://randomuser.me/api/portraits/men/27.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)
    User.create(name: "Jane Third",
        photo: "https://randomuser.me/api/portraits/women/27.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)

    User.create(name: "Jhon Fourth",
        photo: "https://randomuser.me/api/portraits/men/36.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)
    User.create(name: "Jane Fourth",
        photo: "https://randomuser.me/api/portraits/women/36.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)

    User.create(name: "Jhon Fifth",
        photo: "https://randomuser.me/api/portraits/men/45.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)
    User.create(name: "Jane Fifth",
        photo: "https://randomuser.me/api/portraits/women/45.jpg",
        bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        posts_counter: 0)

100.times do |post|
    Post.create(title: "#{post}-Post",
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis commodo velit. Maecenas quis tortor nec neque ornare pharetra vitae in quam. Phasellus dapibus a dui at euismod. Suspendisse ac cursus ligula. Pellentesque in augue sit amet ipsum condimentum facilisis. Aenean rutrum feugiat condimentum.",
        comments_counter: 0,
        likes_counter: 0,
        author_id: (rand(1..10)))
end

200.times do |comment|
    Comment.create(author_id: (rand(1..10)),
        post_id: (rand(1..100)),
        text: "Phasellus dapibus a dui at euismod." )
end

300.times do |like|
    Like.create(author_id: (rand(1..10)), post_id: (rand(1..100)))
end
