Rails.application.routes.draw do
  get 'api/v1/boggle/new', to: "api/v1/boggle#new"
end
