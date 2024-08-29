module Jekyll
    class ImagePathPreprocessor < Generator
      safe true
  
      def generate(site)
        site.posts.docs.each do |post|
          # Use gsub to find and replace image paths
          post.content.gsub!(/!\[([^\]]*)\]\((\.\.\/[^\)]+)\)/) do |match|
            alt_text = $1
            img_src = $2
            # Just add Liquid's relative_url filter
            new_img_src = "{{'#{img_src}' | relative_url}}"
            # Return the new markdown image tag with the correct Liquid code
            "![#{alt_text}](#{new_img_src})"
          end
        end
      end
    end
  end
  