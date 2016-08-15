require "rubygems"
require "active_record"

class Get::VideosController < ApplicationController
   def show
      
      @category = params[:id]
      sql = ("select allInfo.cg_name,allInfo.tag_id,allInfo.tag_name,allInfo.vi_id,allInfo.vi_name from (select cg_taginfo.cg_name cg_name,cg_taginfo.tag_id tag_id,cg_taginfo.tag_name tag_name,cg_viinfo.vi_id vi_id,cg_viinfo.vi_name vi_name from (select cg.name cg_name,ta.id tag_id,ta.name tag_name from categories_tags ct,categories cg,tags ta where ct.tag_id=ta.id and ct.category_id=cg.id and cg.id= :category) as cg_taginfo,(select cg.name cg_name,vi.id vi_id,vi.name vi_name from categories_tags ct RIGHT JOIN videos_tags vt on ct.tag_id=vt.tag_id,categories cg,videos vi,tags ta where cg.id=ct.category_id and vi.id=vt.video_id and cg.id= :category GROUP BY vi.name ORDER BY vi.id asc) as cg_viinfo) as allInfo")

      value = Hash.new  
      value[:category] = @category  
      @as = Categorie.find_by_sql [sql,value]  
      puts @category     
      render :json=> @as
   end
end
