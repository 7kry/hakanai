class IssueController < ApplicationController
  def create
    login_required or return
    first, second = params[:first] || "", params[:second] || ""
    if first.empty? or second.empty?
      render json: {error: "Both `first' and `second' are required."}, status: 400
      return
    end
    if issue = Issue.find_by(first: first, second: second)
      render json: {error: "You have already created the same issue.", ref: issue.attributes}, status: 403
      return
    end
    issue = Issue.new(user_id: session[:user_id], first: first, second: second, deleted: false)
    issue.save
    render json: issue.attributes
  end

  def show
    begin
      @issue = Issue.find(params[:id])
      if @issue.deleted
        @message = "その投稿は削除されました。"
        render 'error/not_found', status: 410
        return
      end
      if params[:format] == "json"
        render json: @issue.attributes
        return
      end
      @issued_by = @issue.user
    rescue ActiveRecord::RecordNotFound
      @message = "その投稿は存在しません。"
      render 'error/not_found', status: 404
      return
    end
  end
end
