# bartender
api for bartender android app for geting recipe drinks
# Example
```nim
import asyncdispatch, bartender, json, strutils

let data = waitFor get_recipe_categories()
let categories = data["data"]
for category in categories:
  echo $category["id"] & ":" & category["title"].getStr()
  echo ".".repeat(40)
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
