module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image

      form_for :image do
        element :url
        element :tag_list
      end

      def create_image!(url: nil, tags: nil)
        #TODO
        puts "helP!"
      end
    end
  end
end
