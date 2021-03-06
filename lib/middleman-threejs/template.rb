require 'middleman-core/templates'

module Middleman
  module Three

    class Template < Middleman::Templates::Base
      class_option 'css_dir',
        default: 'stylesheets',
        desc: 'The path to the css files'
      class_option 'js_dir',
        default: 'javascripts',
        desc: 'The path to the javascript files'
      class_option 'images_dir',
        default: 'images',
        desc: 'The path to the image files'

      def self.source_root
        File.join(File.dirname(__FILE__), 'template')
      end

      def build_scaffold!
        template 'shared/Gemfile.tt', File.join(location, 'Gemfile')
        template 'shared/config.tt', File.join(location, 'config.rb')
        copy_file 'source/index.html.slim', File.join(location, 'source/index.html.slim')
        copy_file 'source/layouts/layout.slim', File.join(location, 'source/layouts/layout.slim')

        empty_directory File.join(location, 'source', options[:css_dir])
        copy_file 'source/stylesheets/all.css', File.join(location, 'source', options[:css_dir], 'all.css')
        copy_file 'source/stylesheets/normalize.css', File.join(location, 'source', options[:css_dir], 'normalize.css')
        replace_images_dir

        empty_directory File.join(location, 'source', options[:js_dir])
        copy_file 'source/javascripts/all.js', File.join(location, 'source', options[:js_dir], 'all.js')
        copy_file 'source/javascripts/jquery-1.11.0.min.js', File.join(location, 'source', options[:js_dir], 'jquery-1.11.0.min.js')
        copy_file 'source/javascripts/main.coffee', File.join(location, 'source', options[:js_dir], 'main.coffee')
        copy_file 'source/javascripts/three.min.js', File.join(location, 'source', options[:js_dir], 'three.min.js')
        copy_file 'source/javascripts/TrackballControls.js', File.join(location, 'source', options[:js_dir], 'TrackballControls.js')
        copy_file 'source/javascripts/tween.min.js', File.join(location, 'source', options[:js_dir], 'tween.min.js')

        empty_directory File.join(location, 'source', options[:images_dir])
        copy_file 'source/images/background.png', File.join(location, 'source', options[:images_dir], 'background.png')
        copy_file 'source/images/middleman.png', File.join(location, 'source', options[:images_dir], 'middleman.png')
      end

      private
      def replace_images_dir
        if options[:images_dir] == 'images'
          return
        end

        open(File.join(location, 'source', options[:css_dir], 'all.css'), 'r+') {|f|
          f.flock(File::LOCK_EX)
          body = f.read
          body = body.gsub(/images/, options[:images_dir])
          f.rewind
          f.puts body
          f.truncate(f.tell)
        }
      end
    end
  end
end

Middleman::Templates.register :three, Middleman::Three::Template