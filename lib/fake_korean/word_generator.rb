
module WordGenerator
  
  WORDS = %w(alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat)


    def generate_sentense_of(sentenses,words)
      length=WORDS.length
      story=''
      sentenses.times do
        paragraph=''
        words.times do
          paragraph<< WORDS[rand(length)]
          paragraph<< " "
        end
        paragraph<< WORDS[rand(length)]
        paragraph<< "\n"
        story<< paragraph
      end
     story
    end

    def generate_news_article
      news_article=[]
      news_article<<["Title",generate_sentense_of(1,3).capitalize]
      news_article<<["Subtitle",generate_sentense_of(1,7).capitalize]
      news_article<<["Author",generate_sentense_of(1,1).capitalize]
      news_article<<["Body",generate_sentense_of(20,60)]
    end

    def generate_news_body(sentenses,words)
      generate_sentense_of(sentenses, words)
    end

    def generate_body_text (number_of_heading)
      @body_text=[]
      number_of_heading.times do
        @body_text<<["head",generate_sentense_of(1,7).capitalize]
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["head",generate_sentense_of(1,7).capitalize]
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["body",generate_sentense_of(20,20)]
      end
      @body_text
    end

    def generate_body_text_with_image (number_of_heading)
      @body_text=[]
      count=1
      number_of_heading.times do
        @body_text<<["head",generate_sentense_of(1,7).capitalize]
        @body_text<<["image_a", {:filename=>"image-#{count}", :corner=>"top_left"}]
        count+=1
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["head",generate_sentense_of(1,7).capitalize]
        @body_text<<["body",generate_sentense_of(20,20)]
        @body_text<<["body",generate_sentense_of(20,20)]
      end
      @body_text
    end

    def megazine_article

    end
    
    def news_article

    end
    
    def book_chapter
      chapter={}
      title=generate_sentense_of(1,5).capitalize
      chapter['title']=title
      subtitle=generate_sentense_of(1,5).capitalize
      chapter['subtitle']=subtitle
      quote=generate_sentense_of(1,15).capitalize
      chapter['quote']=quote
      chapter['body']=generate_body_text(10)
      chapter
    end

end
