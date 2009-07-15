require 'sprout'
sprout 'as3'

# enable github as a source
Sprout::Sprout.gem_sources += ['http://gems.github.com']

Sprout::Sprout.class_eval do
  # overriding this to allow sprout to be anywhere in the name, supporting github style aliases
  # ie (jerryvos-sprout-flexsystemsdk-tool)
  def self.sprout_to_gem_name(name)
    if(!name.match(/sprout-/))
      name = "sprout-#{name}-bundle"
    end
    return name
  end
end

Sprout::ToolTask.class_eval do
  # namespace respecting alias for this task.
  # ToolTask is a file_task which generally doesn't respect namespacing.
  # Since we DO want to namespace these commands, we're going to create the non-namespaced version
  # and then build a task which is namespaced that just invokes the real one.
  # Feels shady, but less shady than other solutions.
  def task_alias=(task_alias)
    desc name
    task task_alias => name
  end
end

# make the task a little smarter about how it determines when it needs to rebuild. Normally it bases
# this on the name of the task, but since these sprout tasks explicitly have an output file, use that
# instead.
[Sprout::COMPCTask, Sprout::MXMLCTask].each do |task_class|
  task_class.class_eval do
    def self.needed?()
      ! File.exist?(output) || out_of_date?(timestamp)
    end

    def timestamp
      if File.exist?(output)
        File.mtime(output.to_s)
      else
        Rake::EARLY
      end
    end
  end
end