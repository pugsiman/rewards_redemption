# !/usr/bin/env ruby

# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

BASE_URL = 'http://localhost:3000/api'

def rewards
  uri = URI("#{BASE_URL}/rewards")
  response = Net::HTTP.get(uri)
  rewards = JSON.parse(response)
  rewards.each do |reward|
    puts JSON.pretty_generate(reward)
  end
end

def user_info
  print 'Enter user_id: '
  user_id = gets.chomp
  uri = URI("#{BASE_URL}/users/#{user_id}")
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    user = JSON.parse(response.body)
    puts JSON.pretty_generate(user)
  else
    puts "Error: #{response.message}"
  end
end

def user_redemptions
  print 'Enter user_id: '
  user_id = gets.chomp
  uri = URI("#{BASE_URL}/users/#{user_id}/redemptions")
  response = Net::HTTP.get_response(uri)

  if response.is_a?(Net::HTTPSuccess)
    redemptions = JSON.parse(response.body)
    redemptions.each do |redemption|
      puts JSON.pretty_generate(redemption)
    end
  else
    puts "Error: #{response.message}"
  end
end

def create_user_redemption
  print 'Enter user_id: '
  user_id = gets.chomp
  print 'Enter reward_id: '
  reward_id = gets.chomp

  uri = URI("#{BASE_URL}/users/#{user_id}/redemptions")
  request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
  request.body = { reward_id: reward_id }.to_json

  response = Net::HTTP.start(uri.hostname, uri.port) do |http|
    http.request(request)
  end

  if response.is_a?(Net::HTTPSuccess)
    redemption = JSON.parse(response.body)
    puts 'Redeemed!'
    puts JSON.pretty_generate(redemption)
  else
    puts "Error: #{response.message}"
  end
end

def main
  loop do
    puts "\nSelect API action:"
    puts '1) Get list of rewards'
    puts '2) Get user data'
    puts "3) Get user's redemptions"
    puts '4) Create a redemption'
    puts '5) Exit'
    choice = gets.chomp.to_i
    case choice
    when 1
      rewards
    when 2
      user_info
    when 3
      user_redemptions
    when 4
      create_user_redemption
    when 5
      break
    else
      puts 'Please only select out of offered actions, specifying a digit only'
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
