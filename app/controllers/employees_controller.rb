# frozen_string_literal: true
class EmployeesController < ApplicationController
  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
    1.times { @employee.emp_addresses.build }
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save!
      flash[:notice] = "Employee successfully created"
      redirect_to employees_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      flash[:notice] = "Employee Updateed sucessfully"
      redirect_to employees_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  def search
  end

  private

  def employee_params
    params.require(:employee).permit(:employee_name, :email, :password, :birth_date, :gender, { hobbies: [] }, :address, :mobile_number, :document, emp_addresses_attributes: [:house_name, :street_name, :road])
  end

  def find_employee
    @employee = Employee.find(params[:id])
  end
end
