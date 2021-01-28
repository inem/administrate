require "rails/generators/base"
require "administrate/generator_helpers"

module Administrate
  class ViewGenerator < Rails::Generators::Base
    include Administrate::GeneratorHelpers

    def self.template_source_path
      File.expand_path(
        "../../../app/views/administrate/application",
        __FILE__,
      )
    end

    private

    def copy_resource_template(template_name)
      template_file = "#{template_name}.html.erb"

      copy_file(
        template_file,
        "app/views/console/#{resource_path}/#{template_file}",
      )
    end

    def resource_path
      args.first.try(:underscore).try(:pluralize) || BaseResourcePath.new
    end

    class BaseResourcePath
      def to_s
        "application"
      end
    end
  end
end
