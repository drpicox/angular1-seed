Angular1 Seed
=============

This is the seed of a frontend app.
Clone it to quickly create angular apps using browserify.


Using it
--------

1. Create a Git repository and clone locally

   ```bash
   $ git clone https://github.com/you/your-app.git
   $ cd your-app
   ```

2. Synchronize the seed

   ```bash
   $ git remote add seed https://github.com/drpicox/angular1-seed.git
   $ git pull seed master
   $ git remote remove seed
   ```

3. Personalize files

   - `package.json`
       - update "name"
       - update "description"
       - update "repository"/"url"
       - update "author"
   - `Gruntfile.coffee`
       - update `appCodename`
       - update `styles`
       - update `portServe` (from 9000 to 9999)
   - `src/index.html`
   	   - update `[ng-app]`
   	   - update `title`
   	   - update `.navbar-brand`
   - `src/index.js`
       - update `angular.module` name
       - remove example modules and replace with yours
   - `src/index.spec.js`
       - update `angular.module` name
   - `README.md`
       - update Title
       - update Project description
       - remove this section
    

Quickstart
----------

```bash
$ npm start
```

Setup
-----

Once yo have cloned the repository, install node modules:

```bash
$ npm run setup
```


Build
-----

Build app to deploy:

```bash
$ npm run build
```


Developer environment
---------------------

Start developer environment:

```bash
$ npm run serve
```

Re-Synchronize the seed
---------------------------

If seed improves, you can update your project as follows:

   ```bash
   $ git remote add seed https://github.com/drpicox/angular1-seed.git
   $ git pull seed master
   $ git remote remove seed
   ```
