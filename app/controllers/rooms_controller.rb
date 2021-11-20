class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @room = Room.all
  end
  
  def search
    @rooms = Room.paginate(page: params[:page], per_page: 5).search(params[:search])
    @rooms_count = Room.paginate(page: params[:page], per_page: 5).search(params[:search]).count
  end
  
  def register
    @user = current_user.id
    
    @reservations = Reservation.where(user_id: @user)
    @rooms = Room.where(id: @reservations.room_id)
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

  def show
    @room = Room.find(params[:id]) 
    @reservation = Reservation.new
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
