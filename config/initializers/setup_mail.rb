ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "google.com",
  :user_name            => "maktabtyapp",
  :password             => "123456ahmed",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
