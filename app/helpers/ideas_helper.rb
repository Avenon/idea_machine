module IdeasHelper
  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ")
  end

  def tag_cloud(tags, classes, userid)
    ideas = current_user.ideas
    idea_ids = []
    ideas.map do |i|
      idea_ids << i.id
    end
    #user_tags = Tagging.select("tag_id").where(idea_id: idea_ids)

    user_tags = Tag.counts.group("tags.name").where("taggings.idea_id": idea_ids)

    max = user_tags.sort_by(&:count).last

    user_tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end
end
