50.times do
  post = Post.create({
    title: Faker::Team.name,
    body:  Faker::Lorem.paragraph(50) })

    Comment.create({
      post_id: post.id,
      message: Faker::Lorem.sentences(3) })
end
