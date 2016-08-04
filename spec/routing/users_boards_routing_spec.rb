require "rails_helper"

RSpec.describe UsersBoardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users_boards").to route_to("users_boards#index")
    end

    it "routes to #new" do
      expect(:get => "/users_boards/new").to route_to("users_boards#new")
    end

    it "routes to #show" do
      expect(:get => "/users_boards/1").to route_to("users_boards#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/users_boards/1/edit").to route_to("users_boards#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/users_boards").to route_to("users_boards#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users_boards/1").to route_to("users_boards#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users_boards/1").to route_to("users_boards#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users_boards/1").to route_to("users_boards#destroy", :id => "1")
    end

  end
end
