class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  def index
    @item = Item.find(params[:item_id])
    @orders = @item.orders.all
    @ordersbyChapter = @orders.group_by { |obj| obj.chapter_id }
    @ordersbySize = @orders.group_by { |obj| obj.size }
    @totalsbySize = Hash.new
    @ordersbySize.each do |size_id, orders|
      sum=0
      orders.each do |order|
        sum+= order.quantity
      end
      @totalsbySize[size_id] = sum

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @item = Item.find(params[:item_id])
    @order = Order.find(params[:id])




    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @item = Item.find(params[:item_id])
    @order = @item.orders.new
    @price = @item.preorderdate && Date.today < @item.preorderdate ? @item.preorderprice : @item.price

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @item = Item.find(params[:item_id])

    @order = @item.orders.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to item_order_path(@item, @order), notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def confirm
    @item = Item.find(params[:item_id])
    @order = Order.new(params[:order])
    
    @price = @item.preorderdate && Date.today < @item.preorderdate ? @item.preorderprice : @item.price
    @total = @price * @order.quantity

  end

end
