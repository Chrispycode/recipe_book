require 'rails_helper'

RSpec.describe "Homepages", type: :request do
  describe "GET /" do
    it "renders a successful response" do
      get "/"

      expect(response).to be_successful
    end
  end
end
