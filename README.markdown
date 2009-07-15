sprout-extensions
=============

Purpose
========
Sprout-extensions is a set of little extensions monkey-patched into Sprout. It adds:

* the ability to use gems/tools on github

    mxmlc "app.swf" do |t|
      t.gem_name = 'jerryvos-sprout-flexsystemsdk-tool'
    end

* the ability to easily alias your sprout task to a simpler, namespaced version

    namespace :build do
      desc "Compile the main swf"
      mxmlc "app.swf" do |t|
        t.task_alias = 'main' # the alias
      end
    end
    
    # rake -T
    rake app.swf    # Compile the main swf
    rake build:main # Compile the main swf

* smarter tracking of when a rebuild actually has to happen when your task isn't named the same as your output file
    * For the following task, sprout/rake will always rebuild the file, even if it already exists and the dependencies are up-to-date. With sprout-extension this doesn't happen

        mxmlc "my_task_name" do |t|
          t.output = "my_app.swf"
        end