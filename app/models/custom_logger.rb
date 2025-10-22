class CustomLogger
  def self.after_save
    Rails.logger.info("Custom Logger Initialized")
  end
end
