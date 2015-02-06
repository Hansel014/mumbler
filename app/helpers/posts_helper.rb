module PostsHelper

	def set_comment
    @comment = Comment.find(params[:id])
  	end

	def timestamp
		time_ago_in_words(set_comment.created_at) 
	end
end
