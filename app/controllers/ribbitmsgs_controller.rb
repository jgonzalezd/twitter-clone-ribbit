class RibbitmsgsController < ApplicationController
  before_action :set_ribbitmsg, only: [:show, :edit, :update, :destroy]

  # GET /ribbitmsgs
  # GET /ribbitmsgs.json
  def index
    debugger
    @ribbitmsgs = Ribbitmsg.all include: :user
    @ribbitmsg = Ribbitmsg.new 
  end

  # GET /ribbitmsgs/new
  def new
    @ribbitmsg = Ribbitmsg.new
  end

  # POST /ribbitmsgs
  # POST /ribbitmsgs.json
  def create
    @ribbitmsg = Ribbitmsg.new(ribbitmsg_params)
    user = User.find(session[:user_id])
    @ribbitmsg.user = user
    respond_to do |format|
      if @ribbitmsg.save
        format.html { redirect_to ribbitmsgs_path, notice: 'Ribbitmsg was successfully created.' }
      else
        format.html { render action: 'new' }
        format.json { render json: @ribbitmsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ribbitmsgs/1
  # PATCH/PUT /ribbitmsgs/1.json
  def update
    respond_to do |format|
      if @ribbitmsg.update(ribbitmsg_params)
        format.html { redirect_to @ribbitmsg, notice: 'Ribbitmsg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ribbitmsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ribbitmsgs/1
  # DELETE /ribbitmsgs/1.json
  def destroy
    @ribbitmsg.destroy
    respond_to do |format|
      format.html { redirect_to ribbitmsgs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ribbitmsg
      @ribbitmsg = Ribbitmsg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ribbitmsg_params
      params.require(:ribbitmsg).permit(:content, :references)
    end
end
