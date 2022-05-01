class Mutations::CreatePost < Mutations::BaseMutation
    argument :id, ID, required:true 
    argument :title, String, required:true 
    argument :body, String, required:true 
    
    field :post, Types::PostType, null:false 
    field :errors, [String], null:false 

    def resolve(id:, title:, body:)
        user = User.find(id)
        post = Post.new(title: title, body: body, user: user) 
        if post.save
            {
                post: post, 
                errors: []
            }
        else 
            {
                post: nil, 
                errors: post.errors.full_messages 
            }
        end
    end

end