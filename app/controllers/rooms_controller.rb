class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @room = Room.all
  end
  
  def search
    if params[:search_area].present?
      @rooms= Room.paginate(page: params[:page], per_page: 100).search_area(params[:search_area])
    else 
      @rooms= Room.paginate(page: params[:page], per_page: 100).search_key(params[:search_key])
    end
    
    if params[:search_area].present?
      @rooms_count = Room.paginate(page: params[:page], per_page: 5).search_area(params[:search_area]).count
    else
      @rooms_count = Room.paginate(page: params[:page], per_page: 5).search_key(params[:search_key]).count
    end
  end
  
  def register
    @user = current_user.id
    @rooms = Room.where(user_id: @user)
  end
  
  
  
  def new
    @room = Room.new
  end
  
  def create
  @user = current_user.id
  @room = Room.new(params.require(:room).permit(:image,:name,:introduction,:price,:address,:user_id))
    if @room.save
      flash[:notice]="スケジュールを登録しました"
      redirect_to :rooms
    else
      render"new"
    end
  end


  def edit
    @room = Room.find(params[:id]) 
  end

  def update
    @room = Room.find(params[:id])
    @room.update params.require(:room).permit(:image,:name,:introduction,:price,:address) # POINT
    redirect_to @room
  end
  
 
  
end
