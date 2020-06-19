#### Syllabus

Here is a suggested schedule. Typically, the information in the first five
chapters needs to be covered, along with a focus on any one or all of the
remaining six chapters.

```shell
make schedule
```

Using calcurse the workflow is something like this

```
     ,------.          ,---------.          ,-----.             ,-----.          ,----.
     |github|          |container|          |notes|             |event|          |todo|
     `--+---'          `----+----'          `--+--'             `--+--'          `-+--'
        |       push        |                  |                   |               |   
        | <-----------------|                  |                   |               |   
        |                   |                  |                   |               |   
        |                   |       run        |                   |               |   
        |                   |<-----------------|                   |               |   
        |                   |                  |                   |               |   
        |                   |                  |capture + schedule |               |   
        |                   |                  |<----------------->|               |   
        |                   |                  |                   |               |   
        |                   |                  |              select               |   
        |                   |                  |---------------------------------->|   
        |                   |                  |                   |               |   
        |                   |                  |              ipynb|               |   
        |                   |                  |<----------------------------------|   
     ,--+---.          ,----+----.          ,--+--.             ,--+--.          ,-+--.
     |github|          |container|          |notes|             |event|          |todo|
     `------'          `---------'          `-----'             `-----'          `----'
```

#### TODO

- [X] compile this doc to generate schedule
- [ ] integrate with calcurse
