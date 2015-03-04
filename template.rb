require "erb"

class Template
  def initialize(context)
    @context = context
  end

  def render(template, layout = nil)
    view = ERB.new(File.read(template)).result(@context.get_binding)
    if layout
      ERB.new(File.read(layout)).result(@context.get_binding{view})
    else
      view
    end
  end
end
