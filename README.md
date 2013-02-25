# RubyOnRailsGenerator
---

<br>

## Overview


[to complete]

## Requirements

To run the project you should [download Eclipse modeling Tools](http://www.eclipse.org/downloads/packages/eclipse-modeling-tools/indigosr2) and install the one that matched your operating system.
Then, install Acceleo by opening eclipse and follow in the menu bar **Help > Install Modeling Components**.


###### Windows OS
[ToDo :p]

###### Unix Operating system (Linux/ Mac OSX)

* Install **rvm** and **Ruby 1.9.3**

```
$ rvm install 1.9.3  # To install ruby 1.9.3 lastest version 
$ rvm default 1.9.3  # To set this version of ruby as the default one 
```
* Installing **rails 3.2** 

```
$ gem install rails  # Install Ruby On Rails and Rake commandline tool
```


## Naming conventions 
Naming conventions you must stick into to make your generated project as good as possible.


## Features

That the list of features the rubyOnRails generator is able to take into consideration in the generating process.

### UML2 specification
According to the specification, that's the list of elements 

###### Class
* [✔] name
* [✔] type: *Class, Enumeration* 
* [✔] Inheritence

###### property
* [✔] name
* [✔] type: *Primitive types (String, Integer, Boolean)* 

###### Association
* [✔] One to one:
* [✔] One to many:
* [✔] Many to Many:

### Rails
Rails features that the generator can handle.

* [✔] ~~Generating models from UML Classes~~
* [✔] ~~Generating controllers~~
* [✔] ~~Generating views~~
* [✔] ~~Generating application routes~~
* [✔] ~~Migration files for every entities and their related associations~~
* [✘] Handling models associations in views (pending)


## Tutorial: Generate Task Manager Rails Application

In this tutorial we will follow all step to generate the project using the Acceleo generator project.
  As an example will take a simple model describing a task manager system. It's composed of 2 classes and some basic UML elements as the below UML diagram shows:

![Task manager UML diagram][3]

We will use the generator to create a CRUD Rails application from this UML model.


###### Step 1: Cloning the Acceleo generator project
---
To clone the project use the command-line app and enter the following code:

	$ git clone https://github.com/genmymodel/rubyonrailsGenerator.git
	$ cd rubyonrailsGenerator
	$ git checkout dev 

You should have been switched to the 'dev' branch which contains the whole project. After that you need to run eclipse and import that project to your workspace (see: [import a project into eclipse](http://agile.csc.ncsu.edu/SEMaterials/tutorials/import_export/) ). 

###### Step 2: Create a Run Configuration
---
Go to **Run > Run Configurations …** in the menu bar and a a new run configuration for an Acceleo project. Make sure your configurations matched those shown in the the picture below.

![Running configuration for the bootstrap script][1]

> If you want to generate the script (Rakefile) in a directory different from the default one, change the `Target:`field and add the path to your directory. Note that the default directory is the root directory of the Acceleo project generator (rubyonrailsGenerator).

###### Step 3: Generate the bootstrap script (Rakefile)
---
After creating the running configuration, you have to run it. Then, a new file named **Rakefile** will be created in the **Target directory**. 
Open the command line app, go to the target directory by `cd`ing into it, and run the following command:  

	$ rake                  # If you have a version of rake installed
	$ ruby -Ilib bin/rake   # If you do not have a version of rake installed.

This command will generate the entire structure of your application. In our case, we will find inside your current directory, a newly created director named `task_manager`[^1]. At this point, you got a bootstrap Ruby On Rails application without any model added.

[^1]: The name of the UML model set when creating the UML diagram, seperated by and '_' if needed.

###### Step 4: Import the rails application into your eclipse workspace
---
Before generating all thoses stuffs, you need to create a new eclipse project. 

1. Go to **File > New > Project** 
2. Select **General > Project** and click **Next**
3. Enter the same name of your rails application, and unchecked **Use default location** and change the location to the right location of the generated rails application.
4. Click on **Finish**

you we have a new project into your workspace named `task_manager`.

###### Step 5: Generate Rails models, migrations, controllers, views, routes, assets for your UML model
---
Once the rails project is present inside your workspace, you have to right click onto the `generator.mtl` file inside the `rubyonrailsGenerator.main`package of the generator project, and go to  **Run > Run Configurations …**. Then, create a new Acceleo running configuration as shown in the picture below:

![Configuration to run the Entities/Associations/Migrations/Controllers…etc generator ][2]

> Make sure that you have the `Runner` set as a **Java Application(Advanced)**

When the generator finished to run, you will noticeed that you got some Directories and files created. 
I'll try to details all then now.

 - For every Class inside your UML model:
 	* A ruby file has been created inside the `app/models/`directory. For instance, for the `User` Class, a `user.rb` ruby file has been created.
 	* A ruby file has been created inside the `app/controllers/`directory. For instance, for the `User` Class, a `users_controller.rb` ruby file has been created.
 	* Some views (`{ìndex, _form, edit, show, new}.html.erb`) have been created inside the views directory related to the class. For instance, for the `User` Class, a `users/` directory has been created with some views files inside.
 	
 - Some migrations files have been created inside the `db/migrate` directory. These files will be used to created all model entities in the database, including association tables.
 
 - Another ruby file named `routes.rb` has been created inside the `config/`directory. This file handle all routes of your application.
 
 - A stylesheet [Sass](http://sass-lang.com/) file `task_manager.scss` has been generated to setup some default styles for your application.
 
###### Step 6 (final): Run migration and Launch the application
---
At this point we have all the rails application setup. However, we need first to run our migrations to effectively create all enties and related associations. Use this command:
	
	$ rake db:migrate

And finally run the server to launch our application and have fun with it: 

	$ rails s
	
## Feedback
  
  We would appreciate your feedback and your suggestions about this code generation
  and GenMyModel. Tell us about the generator you always dream of and the one which would
  help you.
  
  We are happy to answer any questions you may have, let us know if you have any time to talk. 

  
## Links

What?			| Links
------------ | ------------
Home Page    | http://www.genmymodel.com
Contact      | team@genmymodel.com  

	         

[1]: assets/run_config.png
[2]: assets/task_manager.png
[3]: assets/task_manager_uml.png


