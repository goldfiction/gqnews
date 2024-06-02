process = require 'process'
process.chdir __dirname

googleNewsAPI = require 'google-news-json'
convert = require 'html-to-text'

googleNewsAPI.getNews googleNewsAPI.TOP_NEWS,null,"en-GB",(err,response)->
  for article in response.items
    console.log article.title
    console.log convert.convert article.description,
      wordwrap:80,
      selectors:[{selector:'a',options:{ignoreHref:true}}]
