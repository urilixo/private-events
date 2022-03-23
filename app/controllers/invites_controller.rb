class InvitesController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_invite, only: %i[ show edit update ]
  

  # GET /invites or /invites.json
  def index
    @invites = Invite.all
  end

 
  # GET /invites/new
  def new
    @invite = Invite.new
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites or /invites.json
  def create
    @invite = Invite.new(invite_params)
    #@invite = current_user.invites.build(invite_params)
    

    respond_to do |format|
      if @invite.save
        format.html { redirect_to root_path, notice: "Invite was successfully created." }
        format.json { render :show, status: :created, location: @invite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invites/1 or /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to invite_url(@invite), notice: "Invite was successfully updated." }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1 or /invites/1.json
  def destroy
    @invite = Invite.find_by(invite_params)
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Invite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invite_params
      params.require(:invite).permit(:event_id, :attendee_id)
    end
end
