module ApplicationHelper

  def site_title
    @config ||= AppConfig.where(key: 'title').first
    if @config
      @config.value
    else
      'AgentK'
    end
  end
end
