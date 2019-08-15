# Title: Static ID Permalinks plugin for Jekyll
# Description: Rewrite permalinks to include static IDs
# Authors:
#  - Joey Hoer (@joeyhoer | https://joeyhoer.com)

# require 'hashids'
module Jekyll
    module Drops
        class UrlDrop
            def static_id
                @obj.static_id
            end
        end
    end

    class Document
        def static_id
          @static_id ||= Digest::MD5.hexdigest(date.to_s)[0..7]
        end

        # The full path to the output file.
        #
        # base_directory - the base path of the output directory
        #
        # Returns the full path to the output file of this document.
        def destination(base_directory)
          # Uncomment to create redirect map
          # puts "> #{static_id} #{URL.unescape_path(url)}"
          dest = site.in_dest_dir(base_directory)
          path = site.in_dest_dir(dest, URL.unescape_path(static_id)) + '/'
          if path.end_with? "/"
            path = File.join(path, "index.html")
          else
            path << output_ext unless path.end_with? output_ext
          end
          path
        end
    end
end
