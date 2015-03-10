require "erb"

class Template
  def initialize(context)
    @context = context
  end

  def render(template, layout = nil)
    path_location = __dir__ + '/views/'
    view = ERB.new(File.read(path_location + template)).result(@context.get_binding)
    if layout
      ERB.new(File.read(path_location + layout)).result(@context.get_binding { view })
    else
      view
    end
  end
end
