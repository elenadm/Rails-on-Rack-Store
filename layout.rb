module Layout
  def layout
    content = "<!DOCTYPE HTML> \n"
    content << "<html> \n"
    content << "<head> \n"
    content << "<title>Store</title> \n"
    content << "<link rel='stylesheet' type = 'text/css' href='style.css'> \n"
    content << "</head> \n"
    content << "<body> \n"
    content << yield
    content << "</body> \n"
    content << "</html> \n"
  end
end
