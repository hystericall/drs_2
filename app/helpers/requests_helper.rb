module RequestsHelper
  def request_date request
    case request.request_type
    when "dateoff"
      t ".dayoff"
    when "il"
      t ".dayil"
    else
      t ".dayle"
    end
  end
end
