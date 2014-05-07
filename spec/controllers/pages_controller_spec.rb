require 'spec_helper'

describe PagesController do

  describe "GET 'rules'" do
    it "returns http success" do
      get 'rules'
      response.should be_success
    end
  end

end
