class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :comprobe_admin

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    get_survey_chart
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    require "open-uri"
    excelPath = 'answers.xlsx'

    download = open('https://docs.google.com/feeds/download/spreadsheets/Export?key=' + survey_params[:spreadsheet_key] + '&exportFormat=xlsx')
    IO.copy_stream(download, excelPath)

    xlsx = Roo::Spreadsheet.open(excelPath)
    sheet1 = xlsx.sheet(0)

    respuestas = []
    sheet1.each.with_index do |row, row_index|
      respuesta = Response.new
      if row_index > 1
        questions = []
        row.each.with_index do |cell, cell_index|
          question = Question.new
          question.response = respuesta
          question.text = xlsx.excelx_value(1, cell_index+1).to_s
          question.answer = cell.to_s
          questions.push(question)
        end
        respuesta.number = row_index + 1
        respuesta.questions = questions
        respuestas.push(respuesta)
      end
    end

    Survey.destroy_all

    @survey = Survey.new
    @survey.name = survey_params[:name]
    @survey.responses = respuestas
    @survey.spreadsheet_key = survey_params[:spreadsheet_key]
    @survey.answers_key = survey_params[:answers_key]

    File.delete(excelPath) if File.exist?(excelPath)


    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name, :spreadsheet_key, :answers_key)
    end

    def get_survey_chart
      categories = []
      @survey.responses.first.questions.each do |question |
        categories << question.text
      end
      question_num = @survey.responses.first.questions.count
      groups_answers = []
      @survey.responses.each do |response|
        groups_answers << response.questions.pluck(:answer)
      end

      @chart = LazyHighCharts::HighChart.new('container') do |f|
        f.chart(
            type: 'column'
        )

        f.title(
            text: 'Resumen'
        )

        f.subtitle(
            text: 'Respuestas sobresalientes'
        )

        f.xAxis(
            categories: categories,
            crosshair: true
        )

        f.yAxis(
            min: 0
        )


        f.plotOptions(
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        )

        #
        # groups_answers.each do |group_answers|
        #   (0..question_num-1).each do |index|
        #     f.series(
        #         # name: group_answers[index].to_s,
        #         data: group_answers[index]
        #     )
        #   end
        #
        # end
      end
    end
end
