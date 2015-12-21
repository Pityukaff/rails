class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all

    names_table = ["Pera", "Mika", "Zika", "Sanja", "Tanja", "Vanja", "Rasa", "Ceca", "Jaca", "Mica", "Steva"]
        @pupils = Hash.new
        @st_count = rand(90..110)
        for i in 0..@st_count
            rand_name = names_table[rand(0..names_table.length-1)]
            rand_surname = names_table[rand(0..names_table.length-1)][0..-2] + "ic"
            rand(0..1) == 1 ? is_girl = "girl" : is_girl = "boy"
            @pupils["name"] = rand_name+" "+rand_surname
            if(is_girl == "girl")
              @pupils["is_girl"] = true
            else
              @pupils["is_girl"] = false
            end
            @pupils["is_special"] = false
            @student = Student.new(@pupils)
            @student.save
            puts @pupils
        end 
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :is_girl, :is_special)
    end
end
