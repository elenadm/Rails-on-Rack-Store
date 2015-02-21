class Session
  def initialize(app)
    @app = app
  end

  def call(env)
    value = Time.now
    array = @app.call(env)
    [array[0], array[1].merge("Set-Session" => "time=#{value}; path=/"), array[2]]
  end
end
