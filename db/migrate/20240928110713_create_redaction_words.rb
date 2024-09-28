class CreateRedactionWords < ActiveRecord::Migration[7.1]
  def change
    create_table :redaction_words do |t|
      t.string :word

      t.timestamps
    end
  end
end
