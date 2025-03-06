# tilda-profile
a bash script wrapper for saving and changing configurations for tilda terminal, inspired by: https://github.com/lanoxx/tilda/issues/429

1. save tilda-profile.sh in a directory like ~/.scripts/ and make it executable, and create ~/.config/tilda/profiles directory exists
2. in your .bashrc or .bash_aliases file add something like:

```
tilda-profile() {
    nohup ~/.scripts/tilda-profile.sh "$1" "$2" > ~/.config/tilda/profiles/output.log 2>&1 & 
}
```

3. source your .bashrc
4. make some manual tilda preferences edits - assuming you're only using laptop screen
5. then save with command:
    ```
    tilda-profile --save laptop-only        # saves it in ~/.config/tilda/profiles
    ```
7. plug in a monitor, make more manual tilda preferences edits to fit tilda in your new setup 
8. save your new tilda profile:
   ```
   tilda-profile --save extend-left-1080p  # saves it in ~/.config/tilda/profiles
   ```
10. ~/.config/tilda/profiles will now contain configurations for your separate monitor set up
11. load either with:

```
tilda-profile --load laptop-only                # sets to "laptop-only" profile
tilda-profile --load extend-left-1080p    # sets to "extend-left-1080p" profile
```
