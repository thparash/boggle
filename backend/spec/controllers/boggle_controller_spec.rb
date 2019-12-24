require 'rails_helper'

RSpec.describe Api::V1::BoggleController, type: :controller do
    let(:response_json) { JSON.parse(response.body) }

    describe "GET new" do
        it "should returns http success and status message" do
            get :new
            expect(response_json['status']).to eq('SUCCESS')
            expect(response.status).to eq(200)
        end

        it "should respond as JSON" do
            get :new
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end

        it "JSON body response contains expected attributes" do
            get :new
            expect(response_json.keys).to match_array(["words", "board", "message", "status"])
        end
    end
end
