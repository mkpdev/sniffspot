require 'rails_helper'

RSpec.describe "SpotsControllers", type: :request do

  describe "GET /index" do
    let!(:spot) {create(:spot)}
    it "renders a successful response" do
      get spots_url
      expect(response).to be_successful
    end
  end
     
  describe "GET /show" do
    let!(:spot) {create(:spot)}
    it "renders a successful response" do
      get spot_url(spot)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Spot" do
        expect {
          post spots_url, params: { spot: {title:"random title",description:"random description",price:55} }
        }.to change(Spot, :count).by(1)
      end
    end
  

    context "with invalid parameters" do
      it "does not create a new Spot" do
        expect { post spots_url, params: { spot: {title:"random title",description:"",price:"55"} }
        }.to change(Spot, :count).by(0)    
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let!(:spot) {create(:spot)}
      it "updates the requested spot" do
        patch spot_url(spot), params: { spot: {title:"new title",description:"new description",price:77} }
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
      let!(:spot) {create(:spot)}
      it "renders a unsuccessful response " do
        patch spot_url(spot), params: { spot: {title:"random title",description:"",price:"55"} }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:spot) {create(:spot)}
    it "destroys the requested spot" do
      expect {
        delete spot_url(spot)
      }.to change(Spot, :count).by(-1)
    end
  end

end