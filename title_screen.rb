#!/usr/bin/env ruby

class TitleScreen
  def initialize(ui, options)
    @ui = ui
    @options = options
    @messages = Messages[:title]
  end

  def render
    ui.msg(YX.new(0, 0), messages[:name])
    ui.msg(YX.new(1, 7), messages[:by])
    handle_choice(prompt)
  end

  private

  attr_reader :ui, :options, :messages

  def prompt
    ui.choice_prompt(YX.new(3, 0), messages[:pick_random], "ynq")
  end

  def handle_choice choice
    case choice
    when 'q' then options[:quit] = true
    when 'y' then options[:randall] = true
    end
  end
end
