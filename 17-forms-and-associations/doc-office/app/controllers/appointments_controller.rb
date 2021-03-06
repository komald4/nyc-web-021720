class AppointmentsController < ApplicationController
  # resources :appointments, only: [:edit, :update, :destroy]
  def edit

  end

  def update

  end

  def new
    @appointment = Appointment.new()

    @doctors = Doctor.all
    @patients = Patient.all
  end 

  def create
    appointment = Appointment.create(appointment_params)

    redirect_to patient_path(appointment.patient.id)
  end
  

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy

    redirect_to patient_path(appointment.patient)
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id)
  end 
end
