class IngredientsController < ApplicationController
  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(:distinct => true).includes(:food, :recipe).page(params[:page]).per(10)

    render("ingredients/index.html.erb")
  end

  def show
    @ingredient = Ingredient.find(params[:id])

    render("ingredients/show.html.erb")
  end

  def new
    @ingredient = Ingredient.new

    render("ingredients/new.html.erb")
  end

  def create
    @ingredient = Ingredient.new

    @ingredient.food_id = params[:food_id]
    @ingredient.recipe_id = params[:recipe_id]

    save_status = @ingredient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ingredients/new", "/create_ingredient"
        redirect_to("/ingredients")
      else
        redirect_back(:fallback_location => "/", :notice => "Ingredient created successfully.")
      end
    else
      render("ingredients/new.html.erb")
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])

    render("ingredients/edit.html.erb")
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    @ingredient.food_id = params[:food_id]
    @ingredient.recipe_id = params[:recipe_id]

    save_status = @ingredient.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/ingredients/#{@ingredient.id}/edit", "/update_ingredient"
        redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Ingredient updated successfully.")
      end
    else
      render("ingredients/edit.html.erb")
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    @ingredient.destroy

    if URI(request.referer).path == "/ingredients/#{@ingredient.id}"
      redirect_to("/", :notice => "Ingredient deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Ingredient deleted.")
    end
  end
end
