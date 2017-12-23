require 'thor'

module BlockSci
  class CLI < Thor

    desc 'update', 'Update all BlockSci data'
    option :output_directory, required: true
    option :coin_directory, required: true
    def update
      configuration = BlockSci::Parser::Configuration.new(options[:output_directory], options[:coin_directory])
      parser = BlockSci::Parser::BlockParser.new(configuration)
      parser.update_chain
    end

  end
end
