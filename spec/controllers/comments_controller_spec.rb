require 'rails_helper'


RSpec.describe CommentsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  let(:board) { FactoryGirl.create(:board) }

  let(:list) { FactoryGirl.create(:list, board: board) }

  let(:card) { FactoryGirl.create(:card, list: list, user: user) }

  let(:valid_session) { {} }

  let(:valid_attributes) {
    {body: 'コメント', card: card, user: user}
  }

  let(:invalid_attributes) {
    {body: ''}
  }

  before(:each) do
    user.boards << board
    board.lists << list
    list.cards << card
    login_user user
  end

  let(:valid_session) { {} }


  describe "POST #create" do
    context "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, params: {board_id: board.id, list_id: list.id, card_id: card.id, comment: valid_attributes, format: :js}, session: valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, params: {board_id: board.id, list_id: list.id, card_id: card.id, comment: valid_attributes, format: :js}, session: valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, params: {board_id: board.id, list_id: list.id, card_id: card.id, comment: invalid_attributes, format: :js}, session: valid_session
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, params: {board_id: board.id, list_id: list.id, card_id: card.id, comment: invalid_attributes, format: :js}, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }


      it "assigns the requested comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, comment: valid_attributes, format: :js}, session: valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "redirects to the comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, comment: valid_attributes, format: :js}, session: valid_session
        expect(response).to have_http_status(201)
      end
    end

    context "with invalid params" do
      it "assigns the comment as @comment" do
        comment = Comment.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, comment: invalid_attributes, format: :js}, session: valid_session
        expect(assigns(:comment)).to eq(comment)
      end

      it "re-renders the 'edit' template" do
        comment = Comment.create! valid_attributes
        put :update, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, comment: invalid_attributes, format: :js}, session: valid_session
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested comment" do
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, format: :js}, session: valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      comment = Comment.create! valid_attributes
      delete :destroy, params: {board_id: board.id, list_id: list.id, card_id: card.id, id: comment.to_param, format: :js}, session: valid_session
      expect(response).to have_http_status(200)
    end
  end

end
