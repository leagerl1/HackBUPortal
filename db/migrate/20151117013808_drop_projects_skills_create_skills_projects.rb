class DropProjectsSkillsCreateSkillsProjects < ActiveRecord::Migration
  def change
    drop_table :skills_projects
    create_table :projects_skills, :id => false do |t|
      t.integer :skill_id
      t.integer :project_id
    end
  end
end
