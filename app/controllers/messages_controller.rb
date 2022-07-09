class MessagesController < ApplicationController
  before_action :set_message, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :check_auth

  # GET /messages or /messages.json
  def index
    user_id = current_user.id
    listings = Listing.where(user_id:).all

    listing_ids = listings.map { |item| item.id }

    recived_message = Message.where(listing_id: listing_ids).all

    @recived_message_grouped = recived_message.group_by { |item| item.listing_id.to_s + '-' + item.user_id.to_s }

    sent_message = Message.where(user_id:).all
    @sent_message_grouped = sent_message.group_by { |item| item.listing_id.to_s + '-' + item.user_id.to_s }
  end

  # GET /messages/1 or /messages/1.json
  def show; end

  # GET /messages/new
  def new
    @listing_id = request.query_parameters && request.query_parameters['listing']
    @user_id = request.query_parameters && request.query_parameters['user']

    # redirect_to messages_path if @listing_id && @user_id

    @listing = Listing.find(@listing_id)
    @is_response = @listing && @listing.user_id == current_user.id

    @histroy_messages = Message.where(listing_id: @listing_id, user_id: @user_id).all

    @message = Message.new
  end

  # GET /messages/1/edit
  def edit; end

  # POST /messages or /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:text, :is_response, :user_id, :listing_id)
  end

  def check_auth
    authorize Message
  end
end
