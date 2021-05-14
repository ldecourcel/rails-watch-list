class DeletePosterFromMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :poster
  end
end
