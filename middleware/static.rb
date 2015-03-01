class Static
  def initialize (app, name_path_public)
    @app = app
    @name_path_public = name_path_public
  end

  def detect_type(file_name)
    case file_name
      when /\/(\w+.css)$/
        return "text/css"
      when /\/(\w+.jpg)$/
        return "image/jpeg"
      else
        return "application/octet-stream"
    end
  end

  def read_file(file_name)
    data = File.open(file_name).read
    [200, {'Content-Type' => detect_type(file_name)}, [data]]
  end

  def call(env)
    name = @name_path_public + env['PATH_INFO']
    if File.file?(name)
      read_file(name)
    else
      @app.call(env)
    end
  end
end
