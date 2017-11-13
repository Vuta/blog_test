module ApplicationHelper
  def bootstrap_message_for(flash_type)
    hash_class = {success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info"}
    hash_class[flash_type.to_sym] || flash_type.to_s
  end
end
