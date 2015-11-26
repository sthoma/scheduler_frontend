Scheduler Frontend
======

##Project Description
The frontend application for our scheduler app, connecting via api to the backend application for data storage.

###Setup:
Install node, then run:
``` bash
  $ npm install && bower install
```

###Run Server:
``` bash
  $ gulp #development mode
  $ gulp --production #production mode
```

###Build files only:
``` bash
  $ gulp --build #builds dev environment
  $ gulp --production --build #builds production enviornment
```

###Test Build:
``` bash
  $ gulp unit #runs all unit tests
```

###Workflow
  1. Pull remote changes
    - Use naming convention feature/<featurename> for creating feature branches, chore/<chorename> for chores
  2. Do development in feature branch
  3. Push the feature branch to github (git push origin feature/<featurename>)
  5. Make a Pull request to merge back into development branch.

###Coding Style:
  1. "Make everything as simple as possible, but not simpler."
  2. Try to stay consistent in coding styles
  3. Use 2 spaces for tabbing
  4. Align characters when possible.
  5. Naming conventions:
    - Modules: lowerCamelCase
    - Controllers: UpperCamelCase (eg: "MainController")
    - Directives: lowerCamel Case
    - Services: UpperCamelCase (singular)
  6. Comment about WHAT your code does, not HOW.
