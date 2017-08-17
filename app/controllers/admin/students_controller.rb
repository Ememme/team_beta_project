module Admin
  class StudentsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Student.
    #     page(params[:page]).
    #     per(10)
    # end

    def create
      # binding.pry

      student = Student.new(student_params)
      # student.build_tenancy_contract(tenancy_contract_params)
      # binding.pry
      student.room = Room.find(tenancy_contract_params[:room_id])
      # binding.pry
      if student.save # && student.tenancy_contract.save
        student.tenancy_contract = TenancyContract.create(tenancy_contract_params)
        # binding.pry
        redirect_to(
          [namespace, student],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, student),
        }
      end
    end

    private

    def tenancy_contract_params
      params.require(:student)
        .require(:tenancy_contract)
        .permit(:room_id, :rent)
    end

    def student_params
      params.require(:student).
        permit(dashboard.permitted_attributes)
    end

  end
end
