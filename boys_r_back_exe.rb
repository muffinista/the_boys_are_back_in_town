#!/usr/bin/env ruby
# coding: utf-8

require 'rubygems'
require 'chatterbot/dsl'

#
# this is the script for the twitter bot boys_r_back_exe
# generated on 2016-11-07 10:03:57 -0500
#


# Enabling **debug_mode** prevents the bot from actually sending
# tweets. Keep this active while you are developing your bot. Once you
# are ready to send out tweets, you can remove this line.
#debug_mode

# Chatterbot will keep track of the most recent tweets your bot has
# handled so you don't need to worry about that yourself. While
# testing, you can use the **no_update** directive to prevent
# chatterbot from updating those values. This directive can also be
# handy if you are doing something advanced where you want to track
# which tweet you saw last on your own.
#no_update

# remove this to get less output when running your bot
verbose

@flair = File.read("flair.txt").split(/\n/)

if ENV["RESET"]
  bot.config[:index] = 0
else
  bot.config[:index] ||= 0
end

index = bot.config[:index].to_i

lines = File.read("lyrics.txt").split(/\n/)
line = lines[index]

line = "#{line} #{@flair.sample}"

tweet line

bot.config[:index] = index + 1


