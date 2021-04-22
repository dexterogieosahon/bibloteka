require 'rails_helper'

RSpec.describe "books", type: :request do

  describe "GET /index" do
    context "with library filter" do
      it "renders a shortened successful response" do
        get books_url, params: { library: 'Woodend library' }
        data = JSON.parse(response.body)
        expect(data['data'].length).to be 5
      end
    end

    context "without library filter" do
      it "renders a full successful response" do
        get books_url
        data = JSON.parse(response.body)
        expect(data['data'].length).to be 8
      end
    end
  end
end
