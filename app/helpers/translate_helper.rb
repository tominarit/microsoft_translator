require 'rexml/document'

module TranslateHelper
  def getTranslate(token = nil, text="")
    token = getToken if token.nil?
    
    response = RestClient.get 'https://api.microsofttranslator.com/v2/http.svc/Translate',
      {
        params: {
          appid: 'Bearer' + ' ' + token,
          text: text,
          to: 'en' 
        },
        'Accept' => 'application/xml'
      }
  
  REXML::Document.new(response.body).elements['string'].text
end

private

def getToken
  response = RestClient.post 'https://api.cognitive.microsoft.com/sts/v1.0/issueToken',
    {},
    {
      'Ocp-Apim-Subscription-Key' => Rails.application.secrets.translator_key,
      'Accept' => 'application/jwt'
    }
    response.body
  end
end
