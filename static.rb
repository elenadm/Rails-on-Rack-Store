class Static
  def initialize (app)
    @app = app
  end

  def read_file(file_name, type)
    begin
      data = File.open("public/"+ file_name).read
      [200, {'Content-Type' => type}, [data]]
    rescue
      [401, {'Content-Type' => 'text/html'}, ["No such file #{file_name}"]]
    end
  end

  def call(env)
    request = Rack::Request.new(env)
    case request.path
      when /\/(\w+.css)$/
        read_file("/css/#{$1}", "text/css")
      when /\/(\w+.jpg)$/
        read_file("img/#{$1}", "image/jpeg")
      else
        @app.call(env)
    end
  end
end
