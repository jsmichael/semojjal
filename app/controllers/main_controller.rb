class MainController < ApplicationController
  
  def index
  end
  
  
  def write
    new_jjal = Image.new
    new_jjal.jjalbang = params[:file]
    new_jjal.save
    
    if user_signed_in?
      new_connection = ImageOfUser.new
      new_connection.user_id = current_user.id
      new_connection.image_id = Image.last.id
      new_connection.save
    end  
    
    head :ok, content_type: "text/html"
  end
  
  def new_tag
    uploaded_jjal = Image.find(params[:id])
    uploaded_jjal.tag_list.add(params[:tag], parse: true)
    uploaded_jjal.save
    redirect_to :back
  end

  def save_image
    if user_signed_in?
      
      same_check = current_user.images
      same_check_flag = false
      same_check.each do |x|
        if x.id == params[:id].to_i
          same_check_flag = true
        end
      end
      
      if same_check_flag == true
        redirect_to :controller => 'main',
                    :action => 'view',
                    :error => 'same'
      elsif same_check_flag == false
      save_image = ImageOfUser.new
      save_image.user_id = current_user.id
      save_image.image_id = Image.find(params[:id]).id
      save_image.save
      redirect_to :back
      end
    else
      redirect_to :controller => 'main',
                  :action => 'view',
                  :error => 'sign_in_needed'
    end
  end
              
  def view
    @jjal=Image.all
    @total_jjal=@jjal.count
    @jjal_tag = @jjal.tagged_with("수화")
    
    famous_jjals = Hash.new
    @jjal.each do |image|
      famous_jjals[image] = image.users.count
    end
    
    famous_jjals = famous_jjals.sort_by {|image, count| count}
    @famous_jjal = famous_jjals.reverse!.first(8)
    
    @tagofjjal = ActsAsTaggableOn::Tag.all
    
    @color = ["red", "orange", "yellow", "olive", "green", "teal", "blue" "violet" "purple" "pink" "brown" "grey" "black"]

  end
  
  def tag_view
  end
  
  def tag_search
    jjal = Image.all
    if params[:search_type] == "match_all"
    @search_result = jjal.tagged_with(params[:tag], :match_all => true)
    elsif params[:search_type] == "any"
    @search_result = jjal.tagged_with(params[:tag], :any => true)
    @keyword = params[:tag]
    end
  end

  def tag_click
    jjal = Image.all
    tag = ActsAsTaggableOn::Tag.find(params[:id])
    @keyword = tag.name
    @click_result = jjal.tagged_with(tag.name, :any => true)
  end
  
  def image_detail
    @detail = Image.find(params[:id])
  end
  
  def test
    @jjal=Image.find(params[:id])
  end
  
end
