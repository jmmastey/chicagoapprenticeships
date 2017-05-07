require "bundler"
Bundler.require


class ChicagoApprenticeships < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :environment, Sprockets::Environment.new

  use Rack::Deflater

  environment.append_path "assets/css"
  environment.append_path "assets/js"
  environment.append_path "assets/img"
  environment.append_path "assets/fonts"

  # don't allow www
  before do
    redirect request.url.sub(/www\./, ''), 301 if request.host =~ /^www/
  end

  # the only page!
  get '/' do
    erb :index, locals: { programs: programs }
  end

  # get assets
  get "/assets/*" do
    env["PATH_INFO"].sub!("/assets", "")
    settings.environment.call(env)
  end

  def programs
    data = File.read('./apprenticeships.json')
    data = JSON.parse(data)
    data.select { |program| program["active"] }
  end

  helpers do
    def search_tags(program)
      program = program.dup
      program.delete("image_url")
      program["benefit_tag"] = "with benefits" if program["benefits"] == "Yes"
      program["mentor_tag"] = "mentor program" if program["mentor_buddy"] == "Yes"

      program.values.join(" ").downcase.gsub(/[^a-zA-Z0-9 ]+/, ' ')
    end
  end

  run! if app_file == $0
end
