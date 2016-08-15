require "rubygems"
require "active_record"
class GET::Categories::TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @CateVideo = Categorie.find_by_sql("select cg.id,cg.name,subTableNum.videoNum from categories cg,(select ct.category_id ,count(ct.category_id) as videoNum from categories_tags ct RIGHT JOIN videos_tags vt on ct.tag_id=vt.tag_id GROUP BY ct.category_id) as subTableNum where cg.id=subTableNum.category_id")
    render :json=>@CateVideo
   # render :json=>@tag
 end  
end
