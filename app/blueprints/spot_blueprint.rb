class SpotBlueprint < Blueprinter::Base
    identifier :id
  
    fields :title, :description, :price

    field :images do |spot|
      paths= []
        spot.images.each do |image|
          paths.push(Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true))
        end
      paths
    end
  end 