class CreateSkillsProjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :skills_projects, id: false do |t|
      t.integer :skill_id
      t.integer :project_id
    end
  end
end
