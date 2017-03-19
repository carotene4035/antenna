namespace :entry_update do

  desc "記事を更新する" #=> 説明
  task :get_rss => :environment do

    # module読み込み #
    # rssパーサを読み込む
    # unix timestampの変換を読み込む
    require 'rss'
    require 'date'

    # 全ブログを取得
    blogs = Blog.all

    # 全ブログについてRSSを取得し、
    # 最新記事のみをDBに登録する
    blogs.each do |blog|
      p blog.name
      p 'について登録作業を行います。'
      rss_link = blog.rss_link
      rss = RSS::Parser.parse(rss_link)
      if rss.nil?
        p 'rssが取得できませんでした。'
        next
      end


      # 記事の掲載時刻を取得する配列
      published_at_all = []

      rss.items.each do |item|
        # 記事モデルの作成
        entry = Entry.new
        # 日付の生成
        published_at_str = item.dc_date.to_s
        published_at_int = DateTime.parse(published_at_str).to_i

        # ブログの更新有無の確認
        if blog.latest_entry_published_at >= published_at_int then 
          p '記事は登録されませんでした。'
          next
        end
        published_at_all << published_at_int

        # 記事情報の登録
        entry.attributes = {
          title:        item.title,
          blog_id:      blog.id,
          link:         item.link,
          description:  item.description,
          published_at: published_at_int
        }
        entry.save!
        p '記事が登録されました'
      end


      if published_at_all.empty? then
        p 'このブログの記事は登録されませんでした。'
      else
        # ブログが持つ最新記事の掲載時刻を
        # 「最終更新日時」としてブログmodelに登録する
        blog.latest_entry_published_at = published_at_all.max
        blog.save!
        p blog.latest_entry_published_at
      end
    end
  end
end
