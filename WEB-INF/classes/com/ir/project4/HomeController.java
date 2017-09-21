package com.ir.project4;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws IOException 
	 * @throws SolrServerException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws IOException, SolrServerException {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "solrUI";
	}
	
	@RequestMapping(value = "/statistics", method = RequestMethod.GET)
	public String reshome(Locale locale, Model model) throws IOException, SolrServerException {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "statistics";
	}
	
	
	@RequestMapping(value = "/ajaxcontroller" , method = RequestMethod.POST)
	public @ResponseBody String performFunction(HttpServletRequest request, @RequestParam("searchVal")String search,@RequestParam(value="checked[]")String[] checked) throws SolrServerException, IOException {
		logger.info("search query "+search);
		logger.info(checked[0]);
		//logger.info("english"+english);
		//String url = "http://52.38.192.110:8984/solr/BM25";
		String url = "http://54.186.7.246:8983/solr/testp4";
		SolrClient solr = new HttpSolrClient.Builder(url).build();
		SolrQuery query = new SolrQuery();
		SolrQuery query1 = new SolrQuery();
		
		
		boolean hash=false;
		//Translate search query
		Pattern p = Pattern.compile("#");
    	Matcher m = p.matcher(search);
    	if (m.find()) 
    		hash=true;
		search = search.replaceAll("#", ""); //hashtags
		String[] langs_set={"en","es","fr","it","de"};
		search = search.toLowerCase();
		logger.info(search);
		String source = TranslateAPI.detectLanguage(search);
		String trQuery= "";
		for(int i=0;i<langs_set.length;i++)
		{
			String target = langs_set[i];
			String output = TranslateAPI.translate(search, source, target);
			if(trQuery.equals(""))
					trQuery=output;
			else
					trQuery=trQuery+" OR "+output;
		}
		logger.info(URLDecoder.decode(trQuery,"UTF-8"));
		query.setQuery(trQuery);
		query1.setQuery(trQuery);
		logger.info("Detected lang: " + source);
		logger.info("Output: " + trQuery);
		logger.info("query"+query);
		
		
		
		//Author- Sid
		query.setParam("defType", "dismax");
		if (source.equals("en")){
			if (hash == true){
				query.set("qf", "text_en^10 text_es^1 text_de^1 text_fr^1 text_it^1 tweet_text^2 hashtags^10");
			}
			else
			{
		query.set("qf", "text_en^10 text_es^1 text_de^1 text_fr^1 text_it^1 tweet_text^2");}}

		if (source.equals("es")){
			if (hash == true){
				query.set("qf", "text_en^1 text_es^10 text_de^1 text_fr^1 text_it^1 tweet_text^2 hashtags^10");}

else{
			query.set("qf", "text_en^1 text_es^10 text_de^1 text_fr^1 text_it^1 tweet_text^2");}}
		if (source.equals("fr")){
			if (hash == true){
				query.set("qf", "text_en^1 text_es^1 text_de^1 text_fr^10 text_it^1 tweet_text^2 hashtags^10");}

else{
			query.set("qf", "text_en^1 text_es^1 text_de^1 text_fr^10 text_it^1 tweet_text^2");}}
		if (source.equals("de")){
			if (hash == true){
				query.set("qf", "text_en^1 text_es^1 text_de^10 text_fr^1 text_it^1 tweet_text^2 hashtags^10");}
else{
			query.set("qf", "text_en^1 text_es^1 text_de^10 text_fr^1 text_it^1 tweet_text^2");}}
		if (source.equals("it")){
			if (hash == true){
				query.set("qf", "text_en^1 text_es^1 text_de^1 text_fr^1 text_it^10 tweet_text^2 hashtags^10");}

else{
			query.set("qf", "text_en^1 text_es^1 text_de^1 text_fr^1 text_it^10 tweet_text^2");}}

		query.set("bq","user_verified:true^10.0 OR user_verified:false^1.0 user_folcount:[10000 TO *]^5 ");
		query.set("pf","tweet_text^5.0");
		//query.set("mm","2");
		if(search.toLowerCase().contains("trump"))
				query.set("mm","4");
		
		//Author- Niki
		query.addFacetField("tweet_lang");
		query1.addFacetField("hashtags");
		query1.set("facet.limit", "40");
		query.setRows(1000);
		String langs="";
		if(checked!=null)
		{
		if(checked.length>0)
		{
			if(checked[0].equals("en"))
			     langs=langs+"tweet_lang:en";
			if(checked[1].equals("es"))
				 if(langs.equals(""))
					 langs=langs+"tweet_lang:es";
				 else
					 langs=langs+" OR tweet_lang:es";
			if(checked[2].equals("fr"))
				if(langs.equals(""))
					 langs=langs+"tweet_lang:fr";
				 else
					 langs=langs+" OR tweet_lang:fr";
			if(checked[3].equals("de"))
				if(langs.equals(""))
					 langs=langs+"tweet_lang:de";
				 else
					 langs=langs+" OR tweet_lang:de";
			if(checked[4].equals("it"))
				if(langs.equals(""))
					 langs=langs+"tweet_lang:it";
				 else
					 langs=langs+" OR tweet_lang:it";
			query.set("fq",langs);
		}
		
		}
		//Query response
		logger.info("actual query"+query);
		QueryResponse response = solr.query(query);
		QueryResponse response1 = solr.query(query1);
		SolrDocumentList list = response.getResults();
		
		JSONObject wholedata = new JSONObject();
		JSONArray tweets = new JSONArray();
		for(int i=0;i<list.size();i++){
			JSONObject doc = new JSONObject();
			doc.put("tweet_text", list.get(i).getFieldValue("tweet_text"));
			doc.put("user_screenname", list.get(i).getFieldValue("user_screenname"));
			List datelist= (List) list.get(i).getFieldValue("tweet_date");
			Date date=(Date) datelist.get(0);
			String datestring =date.toString();
			String tweetdate= datestring.substring(4,19);
			doc.put("tweet_date", tweetdate);
			
			doc.put("user_img", list.get(i).getFieldValue("user_img"));
			doc.put("user_name", list.get(i).getFieldValue("user_name"));
			tweets.put(doc);
		}
		long en_count=0,fr_count=0,es_count=0,de_count=0,it_count=0; 
		FacetField ff= response.getFacetFields().get(0);
		List<Count> counts = ff.getValues();
		for(Count c : counts){
			if(c.getName().equals("en"))
				en_count=c.getCount();
			if(c.getName().equals("fr"))
				fr_count=c.getCount();
			if(c.getName().equals("es"))
				es_count=c.getCount();
			if(c.getName().equals("it"))
				it_count=c.getCount();
			if(c.getName().equals("de"))
				de_count=c.getCount();
	       // logger.info("facet"+c.getName()+"count"+c.getCount());
		}
		JSONArray hashtags = new JSONArray();
		FacetField ff1= response1.getFacetFields().get(0);
		List<Count> counts1 = ff1.getValues();
		for(Count c : counts1){
			JSONObject doc = new JSONObject();
			doc.put("text", c.getName());
			doc.put("weight", c.getCount());
			hashtags.put(doc);
	        //logger.info("facet "+c.getName()+"count"+c.getCount());
		}
		wholedata.put("tweets", tweets);
		wholedata.put("en_count", en_count);
		wholedata.put("es_count", es_count);
		wholedata.put("fr_count", fr_count);
		wholedata.put("it_count", it_count);
		wholedata.put("de_count", de_count);
		wholedata.put("hashtags", hashtags);
		wholedata.put("numFound", list.getNumFound());
		return wholedata.toString();
	}
}
