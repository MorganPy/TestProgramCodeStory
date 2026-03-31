

using JSON3

const SAMPLE_JSON = 
[
    {"name":"Homework", "minutes":45},
    {"name":"Workout", "minutes":30},
    {"name":"Reading", "minutes":20}
]
function parse_tasks(json_text::String)
    return JSON3.read(json_text)
end

function task_count(tasks)
    return length(tasks)
end


function total_minutes(tasks)
    total = 0
    for task in tasks
        total += task.minutes
    end
    return total
end
#<step explain="Note that print_tasks does not return, it is a printing only function">
function print_tasks(tasks)
    println("Task List:")
    for (i, task) in enumerate(tasks)
        println("$(i). $(task.name) - $(task.minutes) minutes")
    end
end
#</step>

function average_minutes(tasks)
    count = task_count(tasks)
    if count == 0
        return 0.0
    end
    return total_minutes(tasks) / count
end
#<step explain="So main() parses the tasks">
function main()
    tasks = parse_tasks(SAMPLE_JSON)

    print_tasks(tasks)
    println()
#</step>
#<step explain="now we can see how function main() calls the needed functions for this program here using the parsed tasks">
    println("Number of tasks: ", task_count(tasks))
    println("Total minutes: ", total_minutes(tasks))
    println("Average minutes per task: ", average_minutes(tasks))
end

main()
#</step>