require 'user'
require 'user_repository'

def reset_user_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end 

RSpec.describe UserRepository do 
  before(:each) do 
    reset_user_table
  end 

  it "returns all users" do 

    repo = UserRepository.new 
    user = repo.all

    expect(user.length).to eq 2
    expect(user[0].id).to eq 1
    expect(user[0].email).to eq 'name-1@gmail.com'
    expect(user[0].name).to eq 'name-1'

    expect(user[1].id).to eq 2
    expect(user[1].email).to eq 'name-2@gmail.com'
    expect(user[1].name).to eq 'name-2'
  end

  it "returns a single user 'name-1'" do 
    repo = UserRepository.new

    user = repo.find(1)
    expect(user.id).to eq 1
    expect(user.email).to eq 'name-1@gmail.com'
    expect(user.name).to eq 'name-1'
  end 

  it "creates a new user" do 
    repo = UserRepository.new

    new_user = User.new
    new_user.email = 'name-3@gmail.com'
    new_user.name = 'name-3'

    repo.create(new_user)

    all_users = repo.all

    expect(all_users.length).to eq 3
    expect(all_users[2].email).to eq 'name-3@gmail.com'
    expect(all_users[2].name).to eq 'name-3'
  end
  
  it "deletes one user" do 
    repo = UserRepository.new 

    repo.delete(1)

    all_users = repo.all

    expect(all_users.length).to eq 1
    expect(all_users[0].id).to eq 2
  end 
end 
    
    












































# def reset_users_table
#     seed_sql = File.read('spec/seeds_users.sql')
#     connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' }) # do we run the test or real database?
#     connection.exec(seed_sql)
# end
  
#   describe UserRepository do
#     before(:each) do 
#       reset_user_table
#     end
# end
  

# RSpec.describe UserRepository do
#     it "returns all users in the users table" do
#         repo = UserRepository.new

#         users = repo.all
#         expect(users.length).to eq 2
#         expect(users[0].id).to eq '1'
#         expect(users[0].username).to eq 'Tom'
#         expect(users[0].email).to eq 'tom@gmail.com'

#         expect(users[1].id).to eq '2'
#         expect(users[1].username).to eq 'Jerry'
#         expect(users[1].email).to eq 'jerry@gmail.com'
#     end

#     it "returns a single user Tom" do
#         repo = UserRepository.new

#         user = repo.find(1)
#         expect(user.id).to eq '1'
#         expect(user.username).to eq 'Tom'
#         expect(user.email).to eq 'tom@gmail.com'
#     end

#     it "returns a single user Jerry" do
#         repo = UserRepository.new
#         user = repo.find(2)
#         expect(user.id).to eq '2'
#         expect(user.username).to eq 'Jerry'
#         expect(user.email).to eq 'jerry@gmail.com'
#     end

#     it "creates a new user" do
#         repo = UserRepository.new

#         user = User.new
#         user.username = 'Ant'
#         user.email = 'ant@gmail.com'

#         repo.create(user) 

#         users = repo.all
#         last_user = users.last
#         expect(last_user.username).to eq 'Ant'
#         expect(last_user.email).to eq 'ant@gmail.com'
#     end

#     xit "deletes an existing user at user_id 1" do
#         repo = UserRepository.new

#         id_to_delete = 1

#         repo.delete(id_to_delete)

#         all_users = repo.all
#         expect(all_users.length).to eq 1 #might be 2 based on how many users in the array after the create method
#         expect(all_users.first.id).to eq  '2'
#     end

#     # it "deletes all users" do
#     #     repo = UserRepository.new
#     #     repo.delete(2)
#     #     repo.delete(3)
#     #     repo.delete(4)
#     #     repo.delete(5)
#     #     repo.delete(6)
#     #     repo.delete(7)
#     #     repo.delete(8)

#     #     all_users = repo.all
#     #     expect(all_users.length).to eq 1
#     # end
# end