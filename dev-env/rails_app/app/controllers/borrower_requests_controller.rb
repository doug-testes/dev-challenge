class BorrowerRequestsController < ApplicationController
  before_action :set_borrower_request, only: [:show, :edit, :update, :destroy, :review, :approve]

  # GET /borrower_requests
  # GET /borrower_requests.json
  def index
    @borrower_requests = BorrowerRequest.all
  end

  # GET /borrower_requests/1
  # GET /borrower_requests/1.json
  def show
  end

  # GET /review/1
  def review
  end

  def approve
    result = BorrowerService.new.approve(@borrower_request)
    if (result.key?(:result))
      redirect_to borrower_request_path(@borrower_request)
    else
      redirect_to(root_path,  notice: "Erro na aprovação do emprestimo.")
    end
  end

  # GET /borrower_requests/new
  def new
    @borrower_request = BorrowerRequest.new
  end

  # GET /borrower_requests/1/edit
  def edit
  end

  # POST /borrower_requests
  # POST /borrower_requests.json
  def create
    @borrower_request = BorrowerRequest.new(borrower_request_params)

    respond_to do |format|
      if @borrower_request.save
        format.html { redirect_to new_borrower_request_company_path(@borrower_request), notice: "Borrower request was successfully created." }
        format.json { render :show, status: :created, location: @borrower_request }
      else
        format.html { render :new }
        format.json { render json: @borrower_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrower_requests/1
  # PATCH/PUT /borrower_requests/1.json
  def update
    respond_to do |format|
      if @borrower_request.update(borrower_request_params)
        format.html { redirect_to @borrower_request, notice: "Borrower request was successfully updated." }
        format.json { render :show, status: :ok, location: @borrower_request }
      else
        format.html { render :edit }
        format.json { render json: @borrower_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrower_requests/1
  # DELETE /borrower_requests/1.json
  def destroy
    @borrower_request.destroy
    respond_to do |format|
      format.html { redirect_to borrower_requests_url, notice: "Borrower request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_borrower_request
    @borrower_request = BorrowerRequest.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def borrower_request_params
    params.require(:borrower_request).permit(:status, :loan_amount_in_cents, :rate, :installments, :start_date, :end_date, :company_references)
  end
end
