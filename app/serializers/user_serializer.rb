class UserSerializer
    def initialize(user_object)
        @user = user_object
    end

    def to_serialized_json
        @user.to_json(:include => {
            :congregation => {:only => [:id, :name, :api_access]}
        },
        :only => [:id, :name, :role, :email, :account_access])
    end
end