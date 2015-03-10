require './template.rb'

class Controller
  def initialize
    @code = 200
    @headers = {"Content-Type" => "text/html"}
    @body = ''
    @layout = './application.html.erb'
  end

  def call(env)
    @request = Rack::Request.new(env)
    @env = env # alternative request.params
    send env['action']
    [@code, @headers, [@body]]
  end

  def session
    @env['session']
  end

  def params
    @request.params.merge(@env['url_params'] || {})
  end

  def render(view)
    @body = Template.new(self).render(view, @layout)
  end

  def get_binding
    binding
  end

  def redirect_to(uri)
    @code = 302
    @headers['Location'] = uri
  end
end
