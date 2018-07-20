module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection :images, 
      locator: '.js-image-collection', 
      item_locator: '.js-image-card', 
      contains: ImageCard do
        def view!
          #TODO
          puts "what's on the view, eh?"
        end
      end

      def add_new_image!
        node.click_on('New Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        #TODO
      end

      def clear_tag_filter!
        #TODO
      end
    end
  end
end
