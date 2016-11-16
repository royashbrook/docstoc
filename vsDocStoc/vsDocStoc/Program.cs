using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Net;

namespace vsDocStoc
{
    class Program
    {
        static void Main(string[] args)
        {
            // some urls to get keywords from
            //string u1 = @"http://www.google.com/trends/hottrends/atom/hourly";
            //string u2 = @"http://www.gmodules.com/ig/ifr?url=http%3A%2F%2Fwww.google.com%2Fig%2Fmodules%2Fgoogle_insightsforsearch_relatedsearches.xml&amp;up__results_type=RISING&amp;up__property=empty&amp;up__search_term=&amp;up__location=US&amp;up__category=0&amp;up__time_range=7-d&amp;up__max_results=10&amp;synd=open&amp;w=320&amp;h=350&amp;lang=en-US&amp;title=Google+Insights+for+Search&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js";
            //string u2 = @"http://tweetmeme.com/";
            //string u3 = @"http://rss.news.yahoo.com/rss/mostemailed";

            string u1 = @"http://en.wikipedia.org/wiki/Special:Random";

            // start up a client
            using(WebClient w = new WebClient())
                foreach (string u in new string[] {u1}) // for every url
                {
                    string s = w.DownloadString(u); // get the html as a string

                    Console.WriteLine(s);
                    /*
                    foreach (LinkItem i in LinkFinder.Find(s)) // user our linkfinder to get the text
                    {
                        Console.WriteLine(i.Text + " " + i.gURL()); //write it out
                        string ss = w.DownloadString(i.gURL());
                        foreach (LinkItem ii in LinkFinder.Find(ss))
                        {
                            if (!ii.Href.Contains(@"google"))
                                Console.WriteLine("\t\t" + ii.Href);
                        }
                    }*/
                }
            Console.Read();
        }
    }

    public struct LinkItem
    {
        public string Href;
        public string Text;
        
        public override string ToString()
        {
            return Href + "\n\t" + Text;
        }

        public string gURL()
        {
            return string.Format(@"http://www.google.com/#q={0}&tbm=nws", Text);
        }

    }

    static class LinkFinder
    {
        public static List<LinkItem> Find(string file)
        {
            List<LinkItem> list = new List<LinkItem>();

            // 1.
            // Find all matches in file.
            MatchCollection m1 = Regex.Matches(file, @"(<a.*?>.*?</a>)",
                RegexOptions.Singleline);

            // 2.
            // Loop over each match.
            foreach (Match m in m1)
            {
                string value = m.Groups[1].Value;
                LinkItem i = new LinkItem();

                // 3.
                // Get href attribute.
                Match m2 = Regex.Match(value, @"href=\""(.*?)\""",
                RegexOptions.Singleline);
                if (m2.Success)
                {
                    i.Href = m2.Groups[1].Value;
                }

                // 4.
                // Remove inner tags from text.
                string t = Regex.Replace(value, @"\s*<.*?>\s*", "",
                RegexOptions.Singleline);
                i.Text = t;

                list.Add(i);
            }
            return list;
        }
    }

}
