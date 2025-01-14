require "sinatra"
require "sinatra/reloader"
require "http"
require "json"
require 'uri'
require 'net/http'
require 'openssl'
require "sinatra/cookies"



get("/") do
  
  @spells_API = HTTP.get("https://www.dnd5eapi.co/api/spells/")
  @spells = JSON.parse(@spells_API)
  @the_spell_index = @spells.fetch("results")
  @spell_list = @the_spell_index
  @random_spell = rand(0..@spell_list.length)
  #@spell_names = @spell_hash.fetch("name")
  
  erb(:home)
end

get("/:description") do
  @described = params.fetch("description")
  @spell_description_API = HTTP.get("https://www.dnd5eapi.co/api/spells/#{@described}")
  @the_description = JSON.parse(@spell_description_API)
 

  erb(:description)
end


