require 'post'
require 'post_repository'

def reset_post_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end 

RSpec.describe PostRepository do 
  before(:each) do 
    reset_post_table
  end

  it "returns all posts" do 
    repo = PostRepository.new 
    post = repo.all 

    expect(post.length).to eq 2
    expect(post[0].id).to eq 1
    expect(post[0].title).to eq 'title-1'
    expect(post[0].content).to eq 'content-1'
    expect(post[0].views).to eq 10
    expect(post[0].user_id).to eq 1
    
    expect(post[1].id).to eq 2
    expect(post[1].title).to eq 'title-2'
    expect(post[1].content).to eq 'content-2'
    expect(post[1].views).to eq 5
    expect(post[1].user_id).to eq 2
  end

  it "returns a single post 'title-1'" do 
    repo = PostRepository.new 
    post = repo.find(1)

    expect(post.id).to eq 1
    expect(post.title).to eq 'title-1'
    expect(post.content).to eq 'content-1'
    expect(post.views).to eq 10
    expect(post.user_id).to eq 1
  end 

  it "creates a new post" do 
    repo = PostRepository.new

    new_post = Post.new
    new_post.title = 'title-3'
    new_post.content = 'content-3'
    new_post.views = 100
    new_post.user_id = 1

    repo.create(new_post)

    all_posts = repo.all

    expect(all_posts.length).to eq 3
    expect(all_posts[2].id).to eq 3
    expect(all_posts[2].title).to eq 'title-3'
    expect(all_posts[2].content).to eq 'content-3'
    expect(all_posts[2].views).to eq 100
    expect(all_posts[2].user_id).to eq 1
  end

  it "deletes one post" do 
    repo = PostRepository.new 

    repo.delete(1)

    all_posts = repo.all

    expect(all_posts.length).to eq 1
    expect(all_posts[0].id).to eq 2
  end 
end 
