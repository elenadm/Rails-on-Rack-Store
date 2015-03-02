require "erb"

module Layout
  def layout
    content = "<!DOCTYPE HTML> \n"
    content << "<html> \n"
    content << "<head> \n"
    content << "<title>Store</title> \n"
    content << "<link rel='stylesheet' type = 'text/css' href='/css/style.css'> \n"
    content << "</head> \n"
    content << "<body> \n"
    content << yield
    content << "</body> \n"
    content << "</html> \n"
  end

  def render(layout, template, context)
    ERB.new(File.read(layout)).result(context.get_binding do
                                        ERB.new(File.read(template)).result(context.get_binding)
                                      end)
  end
end
