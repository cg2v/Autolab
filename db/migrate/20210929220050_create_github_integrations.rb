class CreateGithubIntegrations < ActiveRecord::Migration[5.0]
  def change
    create_table :github_integrations do |t|
      t.string :oauth_state
      t.text :access_token_ciphertext
      t.references :user, index: { unique: true }
      t.timestamps
    end
    add_index :github_integrations, :oauth_state, unique: true
    add_foreign_key(
      :github_integrations,
      :users,
      column: :user_id
    )
  end
end
