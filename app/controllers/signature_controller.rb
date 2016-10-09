class SignatureController < ApplicationController
  def create
  	@signature = Signature.new(signature_params)

  	respond_to do |format|
  	  if @signature.save
  	    format.html { redirect_to @signature, notice: 'Individual review was successfully created.' }
  	    format.json { render :show, status: :created, location: @signature }
  	  else
  	    format.html { render :new }
  	    format.json { render json: @signature.errors, status: :unprocessable_entity }
  	  end
  	end
  end

  def update
  end

  def destroy
  end
end
