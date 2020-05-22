makefiles
---

this should work

```
SECTIONS=tmp/ch00.txt DOMAIN=ntlk.org make
jq -Msce < tmp/*.txt
```

this project aims to be a starting point for this workflow

the idea is to create a set of tasks from text scraped from the web

tasks are generated and added to a backlog to be prioritised. sprints are
created from the backlog using project management software. tasks are assigned to
people who mark the task as finished and/or add new tasks to the backlog.
Project managers accept the changes to the backlog based on the criteria agreed
upon when the task was added to the backlog.

```
     ,----.          ,-------.          ,------.          ,------.
     |Task|          |Backlog|          |Sprint|          |Person|
     `-+--'          `---+---'          `--+---'          `--+---'
       | accept criteria |                 |                 |    
       | --------------->|                 |                 |    
       |                 |                 |                 |    
       |                 | schedule tasks  |                 |    
       |                 |---------------->|                 |    
       |                 |                 |                 |    
       |                 |                 |   assign task   |    
       |                 |                 | ---------------->    
       |                 |                 |                 |    
       |                 |  complete work  |                 |    
       | <----------------------------------------------------    
     ,-+--.          ,---+---.          ,--+---.          ,--+---.
     |Task|          |Backlog|          |Sprint|          |Person|
     `----'          `-------'          `------'          `------'

```
