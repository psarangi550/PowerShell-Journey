### How to Handle Task Scheduler Using the PowerShell command ####

- The `Task Scheduler tool` included with windows `that allow predefined action` to be `automatically executed ` whenever` certain condition being matched`
- it help us creating the `Routin Task` on a `choosen computer`
- The `Task Scheduler` monitor the `criteria` we have puty to ` start the Task` and `trigger that whenever the condition being Met`
- we can open task-scheduler by using it as `Win+R` &rarr; `taskschd.msc` or search for the `Task Scheduler` Over Here 
- we can see what are the different Task Already Schedule by click on the `Task Schedule Library`

##### How to Create A Task Using the Task Scheduler 
- we can create either a `Basic Task or Task`
- when we create the `Basic Task` then it will only ask `important details`
- we can modify after creating the `Basic Task ` we have `all the field to use`
- we can create a `Basic Task` and Provide `Frequency` as `Daily or Weekly` and `What Time we want to Run the Task` & `we can also set the re-occurance as well` and `We can select the Program or Send an Email or Display a Message` & `we need to select the Program to start` and `finish`
- while selecting the `Program` we can select the `Script we want to run and what we args need to pass to the Script as well`
- Once we add our Task its available in the `Task Scheduler Library` with all the `Details`
- we can see what `Program` we choose to run on `Action` field
- we can also see the `Triggers` which tell us when the `Task Scheduled to be performed and what the re-occurance`
- we can also run the task manually by clicking on the `Task on the Task Schedule Library --> Right Click --->Run`