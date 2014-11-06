module Admin::Controllers::Users
  include Admin::Controller

  action "Index" do
    expose :users

    def call(params)
      @users = UserRepository.all
    end
  end

  action "Show" do
    expose :user

    def call(params)
      @user = UserRepository.find(params[:id])
    end
  end

  action "New" do
    def call(params)
    end
  end

  action "Create" do
    def call(params)
      user = User.new(params[:user])
      if UserRepository.create(user)
        redirect_to "http://localhost:2300/admin/users/#{user.id}"
      else
        status 500, "sucker"
      end
    end
  end

  action "Edit" do
    expose :user
    def call(params)
      @user = UserRepository.find(params[:id])
    end
  end

  action "Update" do
    def call(params)
      # [g] I feel this could be better..?
      user = UserRepository.find(params[:id])
      user.name = params[:user][:name]

      if UserRepository.update(user)
        self.status = 200
        self.body = "updated"
        self.headers.merge!({ "Location" => "http://localhost:2300/admin/users/#{user.id}" })
      else
        redirect_to "http://localhost:2300/admin/users/#{user.id}/edit"
      end
    end
  end

  action "Destroy" do
    def call(params)
      # [g] I feel this could be better..?
      user = UserRepository.find(params[:id])
      UserRepository.delete(user)
      self.status = 200
      self.body = "destroyed"
      self.headers.merge!({ "Location" => "http://localhost:2300/admin/users" })
    end
  end
end

