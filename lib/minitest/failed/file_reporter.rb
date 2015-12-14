module Minitest
  module Failed
    class FileReporter < Minitest::StatisticsReporter

      def report
        super
        failing_results = results.reject(&:skipped?)

        if failing_results.any?
          replay_commands = failing_results.map { |result| display_replay_command(result) }
        end
        IO.write_to_file(replay_commands || [])

      end

      private

      def indent(text)
        text.gsub(/^/, '      ')
      end

      def display_replay_command(result)
        location = find_test_file(result)
        return if location.empty?

        %[rake TEST=#{location} TESTOPTS="--name=#{result.name}"]
      end

      def find_test_file(result)
        filter_backtrace(result.failure.backtrace)
          .find {|line| line.match(%r((test|spec)/.*?_(test|spec).rb)) }
          .to_s
          .gsub(/:\d+.*?$/, '')
      end

      def backtrace(backtrace)
        backtrace = filter_backtrace(backtrace).map {|line| location(line, true) }
        return if backtrace.empty?
        indent(backtrace.join("\n")).gsub(/^(\s+)/, "\\1# ")
      end

      def location(location, include_line_number = false)
        regex = include_line_number ? /^([^:]+:\d+)/ : /^([^:]+)/
        location = File.expand_path(location[regex, 1])

        return location unless location.start_with?(Dir.pwd)

        location.gsub(%r[^#{Regexp.escape(Dir.pwd)}/], '')
      end

      def filter_backtrace(backtrace)
        Minitest.backtrace_filter.filter(backtrace)
      end

    end
  end
end
