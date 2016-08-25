require "rails_helper"

RSpec.describe CardFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/card_files").to route_to("card_files#index")
    end

    it "routes to #new" do
      expect(:get => "/card_files/new").to route_to("card_files#new")
    end

    it "routes to #show" do
      expect(:get => "/card_files/1").to route_to("card_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/card_files/1/edit").to route_to("card_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/card_files").to route_to("card_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/card_files/1").to route_to("card_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/card_files/1").to route_to("card_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/card_files/1").to route_to("card_files#destroy", :id => "1")
    end

  end
end
