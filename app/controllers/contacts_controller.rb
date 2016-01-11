class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all.order('last_name asc, first_name asc')
  end

  def show

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact created successfully.'
    else
      render 'new', alert: 'Errors occured while saving'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact updated'
    else
      render 'edit', alert: 'Errors occurred updating.'
    end
  end

  def destroy
    @contact.destroy

    redirect_to contacts_path, notice: 'Contact successfully deleted.'
  end

  private

    def find_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, details_attributes: [:label, :value])
    end
end
