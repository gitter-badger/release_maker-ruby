class GithubWebhooksController < ActionController::API
  include GithubWebhook::Processor

  rescue_from ::GithubWebhook::Processor::SignatureError, with: :signature_error

  def github_push(payload)
    PushHandler.new(payload).handle!
  end

  def signature_error
    render plain: "Signature mismatch", status: :forbidden
  end

  private

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end
