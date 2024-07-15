class AuditJob < ApplicationJob
    queue_as :default
  
    def perform(news_id)
      news = News.find(news_id)
      puts "A news has been added recently, title: #{news.title}"
    end
  end