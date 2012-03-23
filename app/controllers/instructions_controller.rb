class InstructionsController < ApplicationController
  before_filter :load_instruction, :only => [:destroy]
  
  def create
    @instruction = Instruction.new params[:instruction]
    @instruction.save
    redirect_to recipe_path(@instruction.recipe)
  end
  
  def destroy
    @recipe = @instruction.recipe
    @instruction.destroy
    
    respond_to do |format|
      format.js{
        render :update do |page|
          page.replace_html "instructions", :partial => 'recipes/instructions'
        end
      }
    end
  end
  
  private
  def load_instruction
    @instruction = Instruction.find params[:id]
  end
end