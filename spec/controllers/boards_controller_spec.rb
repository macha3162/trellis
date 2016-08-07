require 'rails_helper'


RSpec.describe BoardsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Board. As you add validations to Board, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: 'テストボード'}
  }

  let(:invalid_attributes) {
    {scope: 'hoge'}
  }

  let(:user) { FactoryGirl.create(:user) }
  let(:board) { FactoryGirl.create(:board) }

  let(:valid_session) { {} }

  before(:each) do
    user.boards << board
    login_user user
  end

  let(:valid_session) { {} }



  describe "GET #show" do
    it "assigns the requested board as @board" do
      get :show, params: {id: board.to_param}, session: valid_session
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "GET #new" do
    it "assigns a new board as @board" do
      get :new, params: {}, session: valid_session
      expect(assigns(:board)).to be_a_new(Board)
    end
  end

  describe "GET #edit" do
    it "assigns the requested board as @board" do
      get :edit, params: {id: board.to_param}, session: valid_session
      expect(assigns(:board)).to eq(board)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Board" do
        expect {
          post :create, params: {board: valid_attributes}, session: valid_session
        }.to change(Board, :count).by(1)
      end

      it "assigns a newly created board as @board" do
        post :create, params: {board: valid_attributes}, session: valid_session
        expect(assigns(:board)).to be_a(Board)
        expect(assigns(:board)).to be_persisted
      end

      it "redirects to the created board" do
        post :create, params: {board: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Board.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved board as @board" do
        post :create, params: {board: invalid_attributes}, session: valid_session
        expect(assigns(:board)).to be_a_new(Board)
      end

      it "re-renders the 'new' template" do
        post :create, params: {board: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }


      it "assigns the requested board as @board" do
        put :update, params: {id: board.to_param, board: valid_attributes}, session: valid_session
        expect(assigns(:board)).to eq(board)
      end

      it "redirects to the board" do
        put :update, params: {id: board.to_param, board: valid_attributes}, session: valid_session
        expect(response).to redirect_to(board)
      end
    end

    context "with invalid params" do
      it "assigns the board as @board" do
        put :update, params: {id: board.to_param, board: invalid_attributes}, session: valid_session
        expect(assigns(:board)).to eq(board)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: board.to_param, board: invalid_attributes}, session: valid_session
        expect(response).to redirect_to(board_url(board))
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested board" do
      expect {
        delete :destroy, params: {id: board.to_param}, session: valid_session
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      delete :destroy, params: {id: board.to_param}, session: valid_session
      expect(response).to redirect_to(boards_url)
    end
  end

end
