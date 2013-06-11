class PostsController < ApplicationController
  
  #check user is admin authenticated for these controller actions
  before_filter :verify_is_admin, :except => [:show]  
  
  # GET /posts
  # GET /posts.json
  def index
    #create post instance with will_paginate plugin applied 
    @posts = Post.paginate(:page => params[:page], :order => "created_at DESC")
    
    #create new contact instance  
    @contact = Contact.new
    
    #response
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    #create post and comments instance, individual post
    @post = Post.find(params[:id])
    @comment = @post.comments.new(params[:comment])
    
    #create post instance grouped into each month
    @category_by_month = Post.all.group_by { |post| post.created_at.strftime("%B") }
    
    #create new contact instance 
    @contact = Contact.new
    
    #response
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    #create new post instance
    @post = Post.new
    
    #create new contact instance 
    @contact = Contact.new
    
    #response
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    #create post instance - find requested post 
    @post = Post.find(params[:id])
    #create new contact instance 
    @contact = Contact.new
  end

  # POST /posts
  # POST /posts.json
  def create
    #create new post instance from parameters
    @post = Post.new(params[:post])
    
    #create new contact instance 
    @contact = Contact.new
    
    #response
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    
    #create new post instance from parameter
    @post = Post.find(params[:id])
    
    #create new contact instance  
    @contact = Contact.new
    
    #response
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    
    #create new post instance from parameter
    @post = Post.find(params[:id])
    
    #destory instance of object
    @post.destroy
    
    #response
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
