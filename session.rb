require "securerandom"

class Session
  @@sessions = {}

  def initialize(app)
    @app = app
  end

  def call(env)
    token = env['HTTP_COOKIE']
    unless @@sessions[token]
      token = generate_token
      value = Time.now
      @@sessions[token] = {'time_visit' => "#{value}", 'counter' => "#{0}"}
    end
    @@sessions[token]['counter'] = @@sessions[token]['counter'].to_i+1
    env['session'] = @@sessions[token]
    status, headers, body = @app.call(env)
    [status, headers.merge({"Set-Cookie" => "#{token}; path=/"}), body]
  end

  private

  def generate_token
    SecureRandom.hex
  end
end
