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
      student = Student.new(student_params)
      student.room = Room.find(tenancy_contract_params[:room_id])
      student.skip_password_validation = true
      if student.save && student.invite!
        student.tenancy_contract = TenancyContract.create(tenancy_contract_params)
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
