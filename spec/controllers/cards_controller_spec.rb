require 'rails_helper'


RSpec.describe CardsController, type: :controller do


  let(:user) { FactoryGirl.create(:user) }

  let(:board) { FactoryGirl.create(:board) }

  let(:list) { FactoryGirl.create(:list, board: board) }

  let(:valid_session) { {} }

  let(:valid_attributes) {
    {title: 'カード', list: list, user: user}
  }

  let(:invalid_attributes) {
    {title: ''}
  }


  before(:each) do
    user.boards << board
    board.lists << list
    login_user user
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all cards as @cards" do
      card = Card.create! valid_attributes
      get :index, params: {board_id: board.id, list_id: list.id}, session: valid_session
      expect(response).to redirect_to(board_path(board))
    end
  end

  describe "GET #show" do
    it "assigns the requested card as @card" do
      card = Card.create! valid_attributes
      get :show, params: {board_id: board.id, list_id: list.id, id: card.to_param}, session: valid_session
      expect(assigns(:card)).to eq(card)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Card" do
        expect {
          post :create, params: {board_id: board.id, list_id: list.id, card: valid_attributes}, session: valid_session
        }.to change(Card, :count).by(1)
      end

      it "assigns a newly created card as @card" do
        post :create, params: {board_id: board.id, list_id: list.id, card: valid_attributes}, session: valid_session
        expect(assigns(:card)).to be_a(Card)
        expect(assigns(:card)).to be_persisted
      end

      it "redirects to the created card" do
        post :create, params: {board_id: board.id, list_id: list.id, card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved card as @card" do
        post :create, params: {board_id: board.id, list_id: list.id, card: invalid_attributes}, session: valid_session
        expect(assigns(:card)).to be_a_new(Card)
      end

      it "re-renders the 'new' template" do
        post :create, params: {board_id: board.id, list_id: list.id, card: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "assigns the requested card as @card" do
        card = Card.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, id: card.to_param, card: valid_attributes}, session: valid_session
        expect(assigns(:card)).to eq(card)
      end

      it "redirects to the card" do
        card = Card.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, id: card.to_param, card: valid_attributes}, session: valid_session
        expect(response).to redirect_to(board_path(board))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested card" do
      card = Card.create! valid_attributes
      expect {
        delete :destroy, params: {board_id: board.id, list_id: list.id, id: card.to_param}, session: valid_session
      }.to change(Card, :count).by(-1)
    end

    it "redirects to the cards list" do
      card = Card.create! valid_attributes
      delete :destroy, params: {board_id: board.id, list_id: list.id, id: card.to_param}, session: valid_session
      expect(response).to redirect_to(board_path(board))
    end
  end

end
