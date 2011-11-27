class MemosController < ApplicationController
  # GET /memos
  # GET /memos.json
  def index
    @memos = Memo.all
    @new_memo = Memo.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memos }
    end
  end

  # POST /memos
  # POST /memos.json
  def create
    @memo = Memo.new(params[:memo])

    if @memo.update_attributes(params[:memo])
      status = 'success'
      html = render_to_string partial: 'show', locals: { memo: @memo }
    else
      status = 'error'
    end

    render json: { status: status, data: @memo, html: html }
  end

  # PUT /memos/1
  # PUT /memos/1.json
  def update
    @memo = Memo.find(params[:id])

    if @memo.update_attributes(params[:memo])
      status = 'success'
    else
      status = 'error'
    end

    render json: { status: status, data: @memo }
  end

  # DELETE /memos/1
  # DELETE /memos/1.json
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy

    render json: { status: 'success', data: @memo }
  end
end
