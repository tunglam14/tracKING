class SeedController < ApplicationController
  def index
    puts params

    data = {}
    # client id
    data[:client_id] = params[:u]

    # referer
    data[:referrer] = params[:r]

    # resolution
    data[:resolution] = random_referrer #params[:res]

    # location
    data[:location] = params[:l]

    # IP
    data[:ip] = random_ip #request.remote_ip

    # user agent
    data[:useragent] = random_useragent #request.env['HTTP_USER_AGENT']
    
    new_data = Req.new(data)
    new_data.save

    puts data
    # No template for this
    render nothing: true
  end

  private
    def random_ip
      return [203, 221, 222, 123].sample.to_s + '.' \
           + [162, 210, 132, 160, 252].sample.to_s + '.' \
           + (1..255).to_a.sample.to_s + '.' \
           + (1..255).to_a.sample.to_s
    end

    def random_useragent
      return [ 
              "Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36", \
              "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36" \
              "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) Gecko/20100101 Firefox/25.0", \
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0", \
              "Mozilla/5.0 (iPad; CPU OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5355d Safari/8536.25", \
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2", \
              "Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14", \
              "Mozilla/5.0 (Windows NT 6.0; rv:2.0) Gecko/20100101 Firefox/4.0 Opera 12.14", \
              "Opera/9.80 (J2ME/MIDP; Opera Mini/9.80 (S60; SymbOS; Opera Mobi/23.348; U; en) Presto/2.5.25 Version/10.54", \
              "Opera/9.80 (J2ME/MIDP; Opera Mini/9.80 (J2ME/23.377; U; en) Presto/2.5.25 Version/10.54", \
              "Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)", \
              "Mozilla/5.0 (BlackBerry; U; BlackBerry 9900; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.346 Mobile Safari/534.11+", \
              "Mozilla/5.0 (BlackBerry; U; BlackBerry 9860; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.254 Mobile Safari/534.11+", \
              "Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0", \
              "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)", \
              "Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))", \
              "Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)", \
              "Mozilla/5.0 (Linux; U; Android 4.0.3; ko-kr; LG-L160L Build/IML74K) AppleWebkit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30", \
              "Mozilla/5.0 (Linux; U; Android 4.0.3; de-ch; HTC Sensation Build/IML74K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30"  \
            ].sample.to_s
    end

    def random_referrer
      return [
              "http://facebook.com", \
              "http://m.facebook.com", \
              "http://plus.google.com", \
              "http://linkhay.com", \
              "http://pinterest.com" \
            ].sample.to_s
    end
end
