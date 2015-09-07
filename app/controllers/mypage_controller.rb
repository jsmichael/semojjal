class MypageController < ApplicationController

  def home
    if user_signed_in?
      @my_jjal = current_user.images
    end
  end
  
  def folder
    @folder_list = Folder.where("user_id = ?", current_user.id)
  end
  
  def folder_detail
    @folder_content = Folder.find(params[:id])
  end
  
  def folder_edit
    @my_jjal = current_user.images
    @color = ["red", "orange", "yellow", "olive", "green", "teal", "blue" "violet" "purple" "pink" "brown" "grey" "black"]
    @folder_list = Folder.where("user_id = ?", current_user.id)
    
    @test = TestDb.all
  end
  
  def move_folder
    number_of_selected_items = params[:selected].length
    
    for i in 0..number_of_selected_items-1
      move_folder = Imagefolder.new
      move_folder.folder_id = params[:folder_id]
      move_folder.image_id = params[:selected][i]
      move_folder.save
    end
    redirect_to :back
  end
  
  def new_folder
    new = Folder.new
    new.folder_name = params[:folder_name]
    new.user_id = current_user.id
    new.save
    redirect_to :back
  end
  
  def delete_folder
    delete = Folder.find(params[:folder_id])
    delete.destroy
    redirect_to :back
  end
  
  
  def mypage_tag
   
  end
  
  def delete_user
    delete_user = Image.find(params[:id])
    delete_user.users.delete(User.find(current_user.id))
    redirect_to :back
  end

end
