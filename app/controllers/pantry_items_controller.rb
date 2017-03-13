class PantryItemsController < ApplicationController
  def index
    @pantry_items = PantryItem.all

    render("pantry_items/index.html.erb")
  end

  def show
    @pantry_item = PantryItem.find(params[:id])

    render("pantry_items/show.html.erb")
  end

  def new
    @pantry_item = PantryItem.new

    render("pantry_items/new.html.erb")
  end

  def create
    @pantry_item = PantryItem.new

    @pantry_item.userid = params[:userid]
    @pantry_item.food_id = params[:food_id]

    save_status = @pantry_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantry_items/new", "/create_pantry_item"
        redirect_to("/pantry_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantry item created successfully.")
      end
    else
      render("pantry_items/new.html.erb")
    end
  end

  def edit
    @pantry_item = PantryItem.find(params[:id])

    render("pantry_items/edit.html.erb")
  end

  def update
    @pantry_item = PantryItem.find(params[:id])

    @pantry_item.userid = params[:userid]
    @pantry_item.food_id = params[:food_id]

    save_status = @pantry_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/pantry_items/#{@pantry_item.id}/edit", "/update_pantry_item"
        redirect_to("/pantry_items/#{@pantry_item.id}", :notice => "Pantry item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pantry item updated successfully.")
      end
    else
      render("pantry_items/edit.html.erb")
    end
  end

  def destroy
    @pantry_item = PantryItem.find(params[:id])

    @pantry_item.destroy

    if URI(request.referer).path == "/pantry_items/#{@pantry_item.id}"
      redirect_to("/", :notice => "Pantry item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pantry item deleted.")
    end
  end
end
