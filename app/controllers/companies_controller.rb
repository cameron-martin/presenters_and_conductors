class CompaniesController < ApplicationController
  def index
    @companies = Company.find(:all)
  end

  def new
    @company = Company.new
    @company_conductor = CompanyConductor.new(@company)
  end

  def edit
    @company = Company.find(params[:id])
    @company_conductor = CompanyConductor.new(@company)
  end

  def create
    @company = Company.new
    @company_conductor = CompanyConductor.new(@company, params[:company_conductor])
    
    if @company_conductor.save
      flash[:notice] = 'Company was successfully created.'
      redirect_to companies_url
    else
      render :action => 'new'
    end
  end

  def update
    @company = Company.find(params[:id])
    @company_conductor = CompanyConductor.new(@company, params[:company_conductor])
    
    if @company_conductor.save
      flash[:notice] = 'Company was successfully updated.'
      redirect_to companies_url
    else
      render :action => 'edit'
    end
  end
end
