module Lita
  module Handlers
    class Bot < Handler
      VERSION = '1.0.0'

      route(/^echo\s+(.+)$/, :echo, command: true, help: { "echo TEXT" => "Replies back with TEXT." })

      def echo(response)
        data = response.match_data[1]
        if !data.nil?
          response.reply("You said: #{data}.")
        else
          response.reply("I did not recognize: #{data}")
        end
      end

    end
  end
  Lita.register_handler(Lita::Handlers::Bot)
end