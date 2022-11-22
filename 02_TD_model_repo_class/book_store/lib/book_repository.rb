require_relative './book' 

class BookRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql, [])
    # SELECT id, name, cohort_name FROM students;
    books = []

    result_set.each do |record|
      book = Book.new 
      book.id = record['id']
      book.title = record['title']
      book.author_name = record['author_name']
      books << book
    end 
    # Returns an array of Student objects.
    return books
  end
end



    