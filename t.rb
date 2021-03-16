require 'csv'
require 'byebug'
CSV.open('test1.csv','w') do |csv|
  a = [{:title=>"গুপ্তচর ও সিরিয়াল কিলার", :author=>"আগাথা ক্রিস্টি", :original_price=>"TK. 136", :discounted_price=>"TK. 120", :url=>"https://rokomari.com//book/174449/guptochor-o-serial-killer--duti-boi-ektre-", :summary=>"\"গুপ্তচর ও সিরিয়াল কিলার\" বইয়ের পেছনের কভারে লেখা:গুপ্তচর দ্বিতীয় বিশ্বযুদ্ধ চলছে। ইংল্যাণ্ডে নিজেদের জাল বিছিয়েছে নাৎসি মদদপুষ্ট। দুর্ধর্ষ সিক্রেট সার্ভিস ফিফথ কলাম’। সংগঠনের দুই ‘মাথার খোঁজ পেয়ে গিয়েছিল লােকটা। একটা ট্রাক তাকে চাপা দিয়ে চলে গেল। মরার আগে শুধু দুটো শব্দ উচ্চারণ করতে পারল সে: সং সুসি। মনের মতাে কাজ পেয়ে গেল। ইন্টেলিজেন্স ডিপার্টমেন্টের দুই প্রাক্তন এজেন্ট টমি আর ওর স্ত্রী টাপেন্স। কিন্তু কোথাও কোনও ব্লু নেই। টমিটাপেন্স ভুলে গিয়েছিল, গুপ্তচরবৃত্তিতে সন্দেহ করতে হয় সবাইকেই। তাই টের পেল না, কোন্ ফাকে পা দিয়ে। ফেলেছে শত্রুপক্ষের নিচ্ছিদ্র ফাঁদে সিরিয়াল কিলার। পুলিসের নাকের ডগায় একের পর এক খুন করে চলেছে এক দুর্ধর্ষ খুনি! রহস্যময় এই ঘাতক, শিকার বেছে নেয়ার ক্ষেত্রে মেনে চলছে অদ্ভুত এক। সিরিয়াল-ইংরেজি বর্ণমালা! খুনের স্থান-কাল অগ্রিম জানিয়ে চ্যালেঞ্জ জানানাে হলাে পুঁদে গােয়েন্দা এরকুল পােয়ারােকে, ‘পারলে ঠেকাও আমাকে…স্কটল্যান্ড ইয়ার্ডকে সাথে নিয়ে কোমর বেঁধে লড়াইয়ে নামল। পােয়ারাে; কিন্তু মহা ধুরন্ধর আর বেপরােয়া খুনিটার সঙ্গে এঁটে ওঠা যে বড্ড কঠিন! ধীর লয়ে ‘এ’ থেকে ‘জেড’-এর দিকে এগিয়ে চলেছে লােকটা। কে সে? কী চায়? কিছুই জানা নেই!", "Title"=>"গুপ্তচর ও সিরিয়াল কিলার", "Author"=>"আগাথা ক্রিস্টি", "Translator"=>"সায়েম সোলায়মান,তৌফির হাসান উর রাকিব,মোঃ ফুয়াদ আল ফিদাহ", "Publisher"=>"সেবা প্রকাশনী", "ISBN"=>"9841633051", "Edition"=>"1st Published,2018", "Number of Pages"=>"360", "Country"=>"বাংলাদেশ", "Language"=>"বাংলা"},
    {:title=>"আত্ম উন্নয়ন আধুনিক নিয়মে লেখাপড়া ", :author=>"ডা. রেজা আহমদ ", :original_price=>"TK. 59", :discounted_price=>"TK. 53", :url=>"https://rokomari.com//book/48368/atmo-unnoyon-adhunik-niyome-lekhapora", :summary=>"আত্ম-উন্নয়ন আধুনিক নিয়মে লেখাপড়া ডা. রেজা আহমদ বদলে যাচ্ছে পৃথিবী। এ পরিবর্তনের সঙ্গে তাল মিলিয়ে চলতে না পারলে পিছিয়ে পড়তে হবে অচিরেই। একবিংশ শতাব্দীতে সামরিক শক্তি কিংবা খনিজ সম্পদের চেয়েও মানুষের মেধাকে অনেক বেশি মূল্যবান বিবেচনা করা হচ্ছে। মানুষ জন্মসূত্রেই মেধাবী। কিন্তু তা কাজে লাগানাের কৌশলের অভাবে অকালমৃত্যু হচ্ছে অনেক সম্ভাবনার। এ বইটি বিশ্বের উন্নত দেশগুলাের পড়ার পদ্ধতিকে কাজে লাগিয়ে একজন ছাত্রের মেধার যথাযথ বিকাশের সহায়ক হিসেবে লেখা হয়েছে। এ ছাড়া, বইটিতে সময় নিয়ন্ত্রণ আর গুরুত্বানুযায়ী পড়া চিহ্নিত করা এবং তা মনে রাখার নানা কৌশল সন্নিবিষ্ট হয়েছে। ফলে, বইটি পড়ে ছাত্রদের পাশাপাশি শিক্ষক ও অভিভাবকরাও উপকত হবেন। তারা দিতে পারবেন নিজেদের উত্তরসুরিদের যথাযথ দিকনির্দেশনা। তাই ব্যক্তিগত, সামাজিক ও জাতিগতভাবে ভবিষ্যতের ‘মেধাবী বাংলাদেশ’-এর অংশ হতে চাইলে অবশ্যই পড়ে দেখুন ডা. রেজা আহমদের ‘আধুনিক নিয়মে লেখাপড়া। -বিদ্যুৎ মিত্র", "Title"=>"আত্ম উন্নয়ন আধুনিক নিয়মে লেখাপড়া", "Author"=>"ডা. রেজা আহমদ", "Publisher"=>"সেবা প্রকাশনী", "ISBN"=>"9841660415", "Edition"=>"Reprint,2014", "Number of Pages"=>"144", "Country"=>"বাংলাদেশ", "Language"=>"বাংলা"}
]
 # temp = {a: "", b: "", c: "", d: ""}
 temp = {
      title: " ",
      author: "",
      original_price: " ",
      discounted_price: " ",
      url: " ",
      summary: " ",
      "Title" => " ",
      "Author"=>" ",
      "Translator"=>" ",
      "Editor" => " ",
      "Publisher"=>" ",
      "ISBN"=>" ",
      "Edition"=>" ",
      "Number of Pages"=>" ",
      "Country"=>" ",
      "Language"=>" "}
  row1 =['Title','Author','Original Price','Discounted Price','URL','Summary','Book_Title','Book_Author','Translator','Editor','Publisher','ISBN','Edition','Number Of Pages','Country','Language']
  csv << row1

  a.each do |h1|
    s= []
    h1= temp.merge(h1)
    puts h1
    #byebug
    h1.each do |key,value|
        s << value
    end

    csv << s
  end
end