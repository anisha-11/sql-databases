require 'recipe_repository'
require 'recipe'

RSpec.describe RecipeRepository do 
  
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
  end

  describe RecipeRepository do
    before(:each) do 
      reset_recipes_table
    end

    it "returns whole table" do 
      repo = RecipeRepository.new
      recipes = repo.all

      expect(recipes.length).to eq 2
      expect(recipes[0].id).to eq '2'
      expect(recipes[0].name).to eq 'pizza' 
      expect(recipes[0].cooking_time).to eq '30'
      expect(recipes[0].rating).to eq '4'
      expect(recipes[1].id).to eq '1'
      expect(recipes[1].name).to eq 'pasta'
      expect(recipes[1].cooking_time).to eq '20'
      expect(recipes[1].rating).to eq '5'
    end

    it 'returns a single recipe Pizza' do 
      repo = RecipeRepository.new
      recipe = repo.find(2)

      expect(recipe.id).to eq '2'
      expect(recipe.name).to eq 'pizza'
      expect(recipe.cooking_time).to eq '30'
      expect(recipe.rating).to eq '4'
    end 

    it 'returns a single recipe Pasta' do 
      repo = RecipeRepository.new
      recipe = repo.find(2)

      expect(recipe.id).to eq '2'
      expect(recipe.name).to eq 'pizza'
      expect(recipe.cooking_time).to eq '30'
      expect(recipe.rating).to eq '4'
    end
  end 
end 