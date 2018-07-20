module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path "/images"

      form_for :image do
        # TO DO something here?
      end

      def create_image!(url: nil, tags: nil)
        #TODO
      end
    end
  end
end
