class CardFilesController < ApplicationController
  before_action :set_card_file, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @card_file = CardFile.new
  end

  def edit
  end

  # POST /card_files
  # POST /card_files.json
  def create
    @card_file = CardFile.new(card_file_params)

    respond_to do |format|
      if @card_file.save
        format.html { redirect_to @card_file, notice: 'Card file was successfully created.' }
        format.json { render :show, status: :created, location: @card_file }
      else
        format.html { render :new }
        format.json { render json: @card_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /card_files/1
  # PATCH/PUT /card_files/1.json
  def update
    respond_to do |format|
      if @card_file.update(card_file_params)
        format.html { redirect_to @card_file, notice: 'Card file was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_file }
      else
        format.html { render :edit }
        format.json { render json: @card_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /card_files/1
  # DELETE /card_files/1.json
  def destroy
    @card_file.destroy
    respond_to do |format|
      format.html { redirect_to card_files_url, notice: 'Card file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_file
      @card_file = CardFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_file_params
      params.require(:card_file).permit(:card_id, :title, :file)
    end
end
