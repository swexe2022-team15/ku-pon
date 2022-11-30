class PostsController < ApplicationController
    require 'date'
    def new
        @post=Post.new
    end
    def index3
        @posts=Post.all.order(end_on: :asc)
        @corporate=Corporate.find_by(params[:name])
        special_post_ids=Post.where.not(start_on: nil).pluck(:id)
        @special_posts=Post.where(id: special_post_ids).where('start_on <= ?', Date.today).where('end_on >= ?', Date.today)
    end
    def create
        @posts=Post.all
        post = Post.new(post_params)
        if post.save!
            redirect_to :action => "index3"
        else
            redirect_to :action => "new"
        end
        
        #@date=Date.today
        #@start_on=Date.to_param[:start_on]
        
        #sabun=(@start_on - @date)
        #unless sabun>=1
        #    flash[:error]="開始日は明日以降で！"
        #    render 'new'
        #    return
        #end
        
        #sabun=(@posts.end_on-@posts.start_on).to_i
        #unless sabun<=10
        #    flash[:error]="期日は最長10日間まで！"
        #    render 'new'
        #    return
        #end
        
        #unless sabun>=0
        #    flash[:error]="終了日は開始日以降で！"
        #    render 'new'
        #    return
        #end
        
    end
    
    def edit
        @post=Post.find(params[:id])
    end
    
    def update
        post=Post.find(params[:id])
        if post.update(post_params)
            redirect_to :action =>"index3"
        else
            redirect_to :action =>"new"
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body, :start_on, :end_on)
    end
    def corporate_params
      params.require(:corporate).permit(:name)
    end
end
