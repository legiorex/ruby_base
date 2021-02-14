module Company
  def init_company(name)
    self.company_name = name
  end

  def print_company
    self.company_name
  end

  private

  attr_accessor :company_name
end
