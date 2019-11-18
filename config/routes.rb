Rails.application.routes.draw do
	root 'billboards#index'
	resources :billboards do
		get 'populate', on: :member
		resources :songs
	end

	# get 'billboards/populate/:id' => 'billboards#populate'
	resources :artists do
		resources :songs
	end
end

