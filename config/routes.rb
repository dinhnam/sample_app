Rails.application.routes.draw do
  get 'user/login'
  get 'user/register'
  get 'static_pages/home'
  get 'static_pages/help'
  root 'application#hello'
end
