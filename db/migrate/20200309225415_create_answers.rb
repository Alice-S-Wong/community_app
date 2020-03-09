class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end