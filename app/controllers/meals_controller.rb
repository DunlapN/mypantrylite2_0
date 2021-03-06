class MealsController < ApplicationController

  before_filter :require_permission, only: [:edit, :update, :destroy]


  def require_permission
    if current_user != Meal.find(params[:id]).user
      redirect_back(:fallback_location => "/", :notice => "Thou cannot alter another's meal.")
    end
  end


  def index
    allmeals = Meal.where(user_id: current_user.id)
    @meals = allmeals.where("scheduled_date >= ?", Date.today)
    @pastmeals = allmeals - @meals
    @meals = @meals.order('meals.scheduled_date ASC')

    render("meals/index.html.erb")
  end

  def show
    @meal = Meal.find(params[:id])

    render("meals/show.html.erb")
  end

  def new
    @meal = Meal.new

    render("meals/new.html.erb")
  end

  def create
    @meal = Meal.new

    @meal.recipe_id = params[:recipe_id]
    @meal.scheduled_date = params[:scheduled_date]
    @meal.user_id = params[:user_id]

    save_status = @meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meals/new", "/create_meal"
        redirect_to("/meals")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal created successfully.")
      end
    else
      render("meals/new.html.erb")
    end
  end

  def edit
    @meal = Meal.find(params[:id])

    render("meals/edit.html.erb")
  end

  def update
    @meal = Meal.find(params[:id])

    @meal.recipe_id = params[:recipe_id]
    @meal.scheduled_date = params[:scheduled_date]
    @meal.user_id = params[:user_id]

    save_status = @meal.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/meals/#{@meal.id}/edit", "/update_meal"
        redirect_to("/meals/#{@meal.id}", :notice => "Meal updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Meal updated successfully.")
      end
    else
      render("meals/edit.html.erb")
    end
  end

  def destroy
    @meal = Meal.find(params[:id])

    @meal.destroy

    if URI(request.referer).path == "/meals/#{@meal.id}"
      redirect_to("/", :notice => "Meal deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Meal deleted.")
    end
  end
end
