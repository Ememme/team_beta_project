module ApplicationHelper
  def rent(student)
    rent = student.tenancy_contract.rent
    "%.2f" % (rent / 100.0)
  end

 def rent_euro(student)
    rent = student.tenancy_contract.rent * 0.23
    "%.2f" % (rent / 100.0)
  end

 def date_display(date)
    date.strftime("%d.%m.%Y, %H:%M")
  end
end
