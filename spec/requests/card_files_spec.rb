require 'rails_helper'

RSpec.describe "CardFiles", type: :request do
  describe "GET /card_files" do
    it "works! (now write some real specs)" do
      get card_files_path
      expect(response).to have_http_status(200)
    end
  end
end
