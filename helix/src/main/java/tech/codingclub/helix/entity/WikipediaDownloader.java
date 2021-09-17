package tech.codingclub.helix.entity;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
//import com.sun.xml.internal.ws.spi.db.DatabindingException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import tech.codingclub.helix.global.HttpsURLConnectionExample;

import java.util.Date;

public class WikipediaDownloader  {
    //private static TaskManager taskManager = new TaskManager(20);
    private String keyword;
    //private String result;

    public WikipediaDownloader(String keyword) {
        this.keyword = keyword;
    }


    public wikiResults getResult(){
        //1.Get clean keyword;
        //2.Get the Url for the wikipedia;
        //3.Make a GET request to the wikipedia;
        //4.Parsing the useful results using the jsoup;
        //5.showing results;
        if(this.keyword==null || this.keyword.length() ==0){
            return null;
        }
        // STEP 1
        this.keyword = this.keyword.replace("[ ]+","_");

        //STEP 2
        String wikiUrl = getWikipediaUrlForQuery(this.keyword);
        String response ="";
        String imageUrl = null;
        try {
            //STEP 3
            String  wikipediaResponseHtml = HttpsURLConnectionExample.sendGet(wikiUrl);// Ctr + p
            //System.out.println(wikipediaResponseHtml);

            //STEP 4
            Document document = Jsoup.parse(wikipediaResponseHtml,"https://en.wikipedia.org");
            Elements childElements = document.body().select(".mw-parser-output > *");
            int state = 0;

            for(Element childElement:childElements){
                if(state==0) {
                    if (childElement.tagName().equals("table")) {
                        state = 1;
                    }
                }else if(state==1){
                        if(childElement.tagName().equals("p")){
                            state  = 2;
                            response = childElement.text();
                            break; // break the for loop bcs task is done ;
                        }
                    }
                }
                //System.out.println(childElement.tagName());

            try {
                imageUrl = document.body().select(".infobox img").get(0).attr("src");
            }catch (Exception e){

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        wikiResults wikiResult = new wikiResults(this.keyword,response,imageUrl);
        //PUSH RESULT INTO DATABASE;
        return wikiResult;


    }

    private String getWikipediaUrlForQuery( String cleanKeyword) {
        return "https://en.wikipedia.org/wiki/"+cleanKeyword;
    }



}
