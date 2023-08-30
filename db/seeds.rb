puts '⚡ Starting seed...'

puts '🗑️ Deleting existing data...'
User.destroy_all
puts '🗑️ Existing data deleted!'

puts '🌱 Creating users...'
User.create!(first_name: 'Aimeric',
             last_name: 'Marchau',
             email: 'marchauaimeric@gmail.com',
             password: 'azerty')

User.create!(first_name: 'Stéphanie',
             last_name: 'Maley',
             email: 'mariestephanie.maley@gmail.com',
             password: 'azerty')

puts '🌱 Users created!'

puts '💼 Creating workspaces...'
Workspace.create!(name: 'Freelance', owner: User.first)
Workspace.create!(name: 'Customers', owner: User.first)
Workspace.create!(name: 'Personal', owner: User.second)
Workspace.create!(name: 'Tutorials', owner: User.second)
puts '💼 Workspaces created!'

puts '📝 Creating checklists...'
Checklist.create!(name: 'Checklist for a successful project',
                  workspace: User.first.workspaces.first,
                  description: 'This checklist is a reminder of all the steps to follow to ensure the success of a project.',
                  start_date: Date.new(2023, 9, 1),
                  estimated_end_date: Date.new(2023, 9, 30))

Checklist.create!(name: 'Malt onboarding',
                  workspace: User.first.workspaces.first,
                  description: 'All the steps to create a Malt account and start working as a freelancer.',
                  start_date: Date.new(2023, 9, 6),
                  estimated_end_date: Date.new(2023, 9, 22))

Checklist.create!(name: 'Project onboarding',
                  workspace: User.first.workspaces.second,
                  description: 'The steps you must follow so I can start working on your project.',
                  start_date: Date.new(2023, 8, 15),
                  estimated_end_date: Date.new(2023, 8, 31))

Checklist.create!(name: 'Flat search',
                  workspace: User.second.workspaces.first,
                  description: 'To do to find a flat',
                  start_date: Date.new(2023, 8, 20),
                  estimated_end_date: Date.new(2023, 9, 12))

Checklist.create!(name: 'Webflow tutorial',
                  workspace: User.second.workspaces.second,
                  description: 'How to create a website with Webflow',
                  start_date: Date.new(2023, 9, 15),
                  estimated_end_date: Date.new(2023, 10, 15))

Checklist.create!(name: 'Slack tutorial',
                  workspace: User.second.workspaces.second,
                  description: 'How to create a Slack channel',
                  start_date: Date.new(2023, 10, 1),
                  estimated_end_date: Date.new(2023, 10, 15))

puts '📝 Checklists created!'

puts '🚩 Creating sections...'
Checklist.all.each do |checklist|
  Section.create!(title: 'First section', checklist: checklist, position: 1)
  Section.create!(title: 'Second section', checklist: checklist, position: 2)
end
puts '🚩 Sections created!'

puts '📌 Creating steps...'
Section.all.each do |section|
  Step.create!(title: 'First step', section: section, completed: true, position: 1)
  Step.create!(title: 'Second step', section: section, completed: false, position: 2)
end
puts '📌 Steps created!'
