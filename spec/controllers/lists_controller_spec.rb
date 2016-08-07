require 'rails_helper'


RSpec.describe ListsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # List. As you add validations to List, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'test', board: board}
  }

  let(:invalid_attributes) {
    {name: '', board: board}
  }

  let(:user) { FactoryGirl.create(:user) }

  let(:board) { FactoryGirl.build(:board) }

  let(:valid_session) { {} }

  before(:each) do
    user.boards << board
    login_user user
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new List" do
        expect {
          post :create, params: {board_id: board.id, list: valid_attributes}, session: valid_session
        }.to change(List, :count).by(1)
      end

      it "assigns a newly created list as @list" do
        post :create, params: {board_id: board.id, list: valid_attributes}, session: valid_session
        expect(assigns(:list)).to be_a(List)
        expect(assigns(:list)).to be_persisted
      end

      it "redirects to the created list" do
        post :create, params: {board_id: board.id, list: valid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved list as @list" do
        post :create, params: {board_id: board.id, list: invalid_attributes}, session: valid_session
        expect(assigns(:list)).to be_a_new(List)
      end

      it "re-renders the 'new' template" do
        post :create, params: {board_id: board.id, list: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {name: 'new_name'}
      }

      it "updates the requested list" do
        list = List.create! valid_attributes
        put :update, params: {board_id: board.id, id: list.to_param, list: new_attributes}, session: valid_session
        list.reload
        expect(list.name).to eq 'new_name'
      end

      it "assigns the requested list as @list" do
        list = List.create! valid_attributes
        put :update, params: {board_id: board.id, id: list.to_param, list: valid_attributes}, session: valid_session
        expect(assigns(:list)).to eq(list)
      end

      it "redirects to the list" do
        list = List.create! valid_attributes
        put :update, params: {board_id: board.id, id: list.to_param, list: valid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested list" do
      list = List.create! valid_attributes
      expect {
        delete :destroy, params: {board_id: board.id, id: list.to_param}, session: valid_session
      }.to change(List, :count).by(-1)
    end

    it "redirects to the lists list" do
      list = List.create! valid_attributes
      delete :destroy, params: {board_id: board.id, id: list.to_param}, session: valid_session
      expect(response).to redirect_to(board_path(board))
    end
  end

end
