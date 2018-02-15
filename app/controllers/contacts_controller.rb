class ContactsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "home", :root_path
  add_breadcrumb "contacts", :contacts_path

  # GET /contacts
  # GET /contacts.json
  def index
     add_breadcrumb "index", contacts_path
      @a=Contact.order(:firstName)
    @contacts = if params[:term]
    @a=@a.where('contacts.firstname LIKE ?', "%#{params[:term]}%") or  @a.where('contacts.lastname LIKE ?', "%#{params[:term]}%")
   
   @contacts=@a.paginate(page: params[:page])
  else
    
    @contacts = @a.all
    @contacts= @a.paginate(page: params[:page])
  end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    add_breadcrumb "Show", contact_path
  end

  # GET /contacts/new
  def new
    add_breadcrumb "new", new_contact_path
    @contact = Contact.new
    @namestring='New Contact'
  end

  # GET /contacts/1/edit
  def edit
    @namestring='Editing '+@contact.firstname+' '+@contact.lastname

  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

  @contact = Contact.create(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:firstname, :lastname, :phone, :email, :address,:term,:avatar)
    end
end
