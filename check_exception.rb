class Check_exception
  def initialize(app)
    @app = app
  end

  def call(env)
    begin
      @app.call(env)
    rescue
      [500, {"Content-Type" => "text/html"}, ["Error"]]
    end
  end
end
