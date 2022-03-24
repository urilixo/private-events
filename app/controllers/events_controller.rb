class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, only: %i[ show edit update destroy set_private set_public validate_creator delete_image]
  before_action :validate_creator, only: %i[edit update destroy set_private set_public delete_image]


  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  def set_private
    @event.update(is_private: true)
    flash[:notice] = 'This event has been set to private'
    redirect_back(fallback_location: root_path)
  end

  def set_public
    @event.update(is_private: false)
    flash[:notice] = 'This event has been set to public'
    redirect_back(fallback_location: root_path)
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit

  # POST /events or /events.json
  def create
    @event = current_user.created_events.build(event_params)
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    image.purge
    redirect_back(fallback_location: root_path)
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def validate_creator
      render json: 'Only the creator of this event is allowed to do that.' unless @event.creator == current_user
    end
    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:title, :location, :description, :date, :is_private, :event_image)
    end
end
