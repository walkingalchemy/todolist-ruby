=begin
organize this code!


#user stories
# List Class $
Create a list $
Add task to list $
Show all tasks $
save a task item $
update a task item $
complete a task item

###Timing functionality {
as a user i can see when i added a task
as a user i can see when i updated a task
as a user i can see when i completed a task
as a user i can see how long a task took me to complete
as a user i can see my average task completion time for my list
}

append list to task as subtasks
=end


class List
	def initialize(name)
		@name = name
		@all_tasks = []
	end

	def add_task(task)
		@all_tasks << task
	end

	def update_task(position, task)
		position -= 1
		@all_tasks[position] = task
	end
		

	def show_all_tasks
		@all_tasks
	end

	def delete(position)
		position -= 1
		@all_tasks.delete_at(position)
	end

	def save
		list_file = File.open("todo_list.txt", "w")
		@all_tasks.each { |task| 
			list_file.puts task.description}
	end
	


end

class Task
	attr_reader :description
	def initialize(description)
		@description = description
	end
end





=begin
# Task Class
create a task item
=end


# test center
#create ne list object and name it first_list
first_list = List.new("First List")

File.open("todo_list.txt").each { |line|
	first_list.add_task(Task.new(line)) }

command, *task_description = ARGV
task_string = task_description.join (" ")


#if command == "add"
#	task_obj = Task.new (task_string)
#	first_list.add_task(task_obj)
#else puts "I don't know that command yet."
#end
### replaced by case command below
case command
	when "help"
		case ARGV[1]		
			when "add" then
				puts "Write your task after 'add' to append it to the end of the todo list."
			when "update" then
				puts "Write your updated task after 'update' then specify which task
number you want to replace when prompted."
			when "delete" then
				puts "Write the number of the task you want to delete after 'delete'."
			when "print" then
				puts "Shows your list, no arguments needed!"
			else puts "Commands after todo are: add, update, delete, print or help.
Specify command after help for specific command help."	
		end

	when "add" then
		task_obj = Task.new (task_string)
		first_list.add_task(task_obj)
		first_list.save

	when "print" then
		index = 0
		first_list.show_all_tasks.each { |task|  
			index += 1
			print index.to_s + ") "
			puts task.description}

	when "update" then
		puts "Which task number would you like to replace?"
		p = STDIN.gets.chomp.to_i
		task_obj = Task.new(task_string)
		first_list.update_task(p, task_obj)
		first_list.save

	when "delete" then
		puts "Which task number would you like to delete?"
		p = STDIN.gets.chomp.to_i
		first_list.delete(p)
		first_list.save
		#as a user i can delete multiple tasks at once
		#change to "Which task number(s)..."
		#add multiple number deletion in one call

	else puts "Use 'todo help' for a list of commands."

end


#create a new Task object and name it replace_filter
#replace_filter = Task.new("Replace water filter")
#walk_cat = Task.new("Walk the cat")
#paint_chimney = Task.new("Paint the chimney")
#build_robot = Task.new("Build my robot")

#use list method add_task to add replace_filter to the list's @all_task array
#first_list.add_task(replace_filter)
#first_list.add_task(walk_cat)
#first_list.add_task(paint_chimney)
#first_list.add_task(build_robot)

#use inspect method to puts the inside of first_list's show_all_tasks array
#puts first_list.show_all_tasks.inspect

