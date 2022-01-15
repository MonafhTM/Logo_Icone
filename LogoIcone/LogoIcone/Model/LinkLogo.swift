//
//  File.swift
//  LogoIcone
//
//  Created by Monafh on 12/06/1443 AH.
//

import Foundation

enum LinkURL : String {
    
    case urlBrandfetch = "https://api.brandfetch.io/v2/brands/brandfetch.com"
    case urlSpotify =   "https://api.brandfetch.io/v2/brands/spotify.com"
    case urlSsalesforce =   "https://api.brandfetch.io/v2/brands/salesforce.com"
    case urlNetflix =  "https://api.brandfetch.io/v2/brands/netflix.com"
    case urlGithub =   "https://api.brandfetch.io/v2/brands/github.com"
    case urlAirbnb =   "https://api.brandfetch.io/v2/brands/airbnb.com"
    case urlMmailchimp =   "https://api.brandfetch.io/v2/brands/mailchimp.com"
    case urlFfigma =   "https://api.brandfetch.io/v2/brands/figma.com"
    case urlReddit =   "https://api.brandfetch.io/v2/brands/reddit.com"
    case urlInvision =    "https://api.brandfetch.io/v2/brands/invision.com"
    case urlBitcoin =    "https://api.brandfetch.io/v2/brands/bitcoin.com"
    case urlUber =    "https://api.brandfetch.io/v2/brands/uber.com"
    case urlZendesk =    "https://api.brandfetch.io/v2/brands/zendesk.com"
    case urlWebflow =    "https://api.brandfetch.io/v2/brands/webflow.com"
    case urlAsana =    "https://api.brandfetch.io/v2/brands/asana.com"
    case urlStripe =    "https://api.brandfetch.io/v2/brands/stripe.com"
    case urlIntercom =    "https://api.brandfetch.io/v2/brands/intercom.com"

}


struct LinkLogo {
    
    let linkLogoURL : [LinkURL] = [ .urlBrandfetch, .urlUber , .urlAsana , .urlAirbnb , .urlFfigma , .urlGithub, .urlReddit , .urlStripe , .urlBitcoin , .urlNetflix , .urlSpotify , .urlWebflow , .urlZendesk , .urlIntercom , .urlMmailchimp ,.urlSsalesforce ]
}
//    var urlBrandfetch = "https://api.brandfetch.io/v2/brands/brandfetch.com"
//    var urlSpotify =   "https://api.brandfetch.io/v2/brands/spotify.com"
//    var urlSsalesforce =   "https://api.brandfetch.io/v2/brands/salesforce.com"
//    var urlNetflix =  "https://api.brandfetch.io/v2/brands/netflix.com"
//    var urlGithub =   "https://api.brandfetch.io/v2/brands/github.com"
//    var urlAirbnb =   "https://api.brandfetch.io/v2/brands/airbnb.com"
//    var urlMmailchimp =   "https://api.brandfetch.io/v2/brands/mailchimp.com"
//    var urlFfigma =   "https://api.brandfetch.io/v2/brands/figma.com"
//    var urlReddit =   "https://api.brandfetch.io/v2/brands/reddit.com"
//    var urlInvision =    "https://api.brandfetch.io/v2/brands/invision.com"
//    var urlBitcoin =    "https://api.brandfetch.io/v2/brands/bitcoin.com"
//    var urlUber =    "https://api.brandfetch.io/v2/brands/uber.com"
//    var urlZendesk =    "https://api.brandfetch.io/v2/brands/zendesk.com"
//    var urlWebflow =    "https://api.brandfetch.io/v2/brands/webflow.com"
//    var urlAsana =    "https://api.brandfetch.io/v2/brands/asana.com"
//    var urlStripe =    "https://api.brandfetch.io/v2/brands/stripe.com"
//    var urlIntercom =    "https://api.brandfetch.io/v2/brands/intercom.com"
//

    var urlBrandfetch : String = ""
    var urlSpotify : String = ""
    var urlSsalesforce : String = ""
    var urlNetflix : String = ""
    var urlGithub : String = ""
    var urlAirbnb : String = ""
    var urlMmailchimp : String = ""
    var urlFfigma : String = ""
    var urlReddit : String = ""
    var urlInvision : String = ""
    var urlBitcoin : String = ""
    var urlUber : String = ""
    var urlZendesk : String = ""
    var urlWebflow : String = ""
    var urlAsana : String = ""
    var urlStripe : String = ""
    var urlIntercom : String = ""
    

}
  
    
    
    //    var link : [String]
    //    var linkArray = [
    //        "https://api.brandfetch.io/v2/brands/brandfetch.com",
    //        "https://api.brandfetch.io/v2/brands/spotify.com",
    //        "https://api.brandfetch.io/v2/brands/salesforce.com",
    //        "https://api.brandfetch.io/v2/brands/netflix.com",
    //        "https://api.brandfetch.io/v2/brands/github.com",
    //        "https://api.brandfetch.io/v2/brands/airbnb.com",
    //        "https://api.brandfetch.io/v2/brands/mailchimp.com",
    //        "https://api.brandfetch.io/v2/brands/figma.com",
    //        "https://api.brandfetch.io/v2/brands/reddit.com",
    //        "https://api.brandfetch.io/v2/brands/invision.com",
    //        "https://api.brandfetch.io/v2/brands/bitcoin.com",
    //        "https://api.brandfetch.io/v2/brands/uber.com",
    //        "https://api.brandfetch.io/v2/brands/zendesk.com",
    //        "https://api.brandfetch.io/v2/brands/webflow.com",
    //        "https://api.brandfetch.io/v2/brands/asana.com",
    //        "https://api.brandfetch.io/v2/brands/stripe.com",
    //        "https://api.brandfetch.io/v2/brands/intercom.com"
    //    ]
}
    //    static func getLink() -> LinkLogo {
    //
    //        return self.init(link: [
    //                "https://api.brandfetch.io/v2/brands/brandfetch.com",
    //                "https://api.brandfetch.io/v2/brands/spotify.com",
    //                "https://api.brandfetch.io/v2/brands/salesforce.com",
    //                "https://api.brandfetch.io/v2/brands/netflix.com",
    //                "https://api.brandfetch.io/v2/brands/github.com",
    //                "https://api.brandfetch.io/v2/brands/airbnb.com",
    //                "https://api.brandfetch.io/v2/brands/mailchimp.com",
    //                "https://api.brandfetch.io/v2/brands/figma.com",
    //                "https://api.brandfetch.io/v2/brands/reddit.com",
    //                "https://api.brandfetch.io/v2/brands/invision.com",
    //                "https://api.brandfetch.io/v2/brands/bitcoin.com",
    //                "https://api.brandfetch.io/v2/brands/uber.com",
    //                "https://api.brandfetch.io/v2/brands/zendesk.com",
    //                "https://api.brandfetch.io/v2/brands/webflow.com",
    //                "https://api.brandfetch.io/v2/brands/asana.com",
    //                "https://api.brandfetch.io/v2/brands/stripe.com",
    //                "https://api.brandfetch.io/v2/brands/intercom.com"
    //            ])
    //    }
    
//    func getLink () -> LinkLogo {
//        let linkLogo = LinkLogo(urlBrandfetch: "https://api.brandfetch.io/v2/brands/intercom.com", urlSpotify: "https://api.brandfetch.io/v2/brands/intercom.com", urlSsalesforce: "https://api.brandfetch.io/v2/brands/intercom.com", urlNetflix: "https://api.brandfetch.io/v2/brands/intercom.com", urlGithub: "https://api.brandfetch.io/v2/brands/intercom.com", urlAirbnb: "https://api.brandfetch.io/v2/brands/intercom.com", urlMmailchimp: "https://api.brandfetch.io/v2/brands/intercom.com", urlFfigma: "https://api.brandfetch.io/v2/brands/intercom.com", urlReddit: "https://api.brandfetch.io/v2/brands/intercom.com", urlInvision: "https://api.brandfetch.io/v2/brands/intercom.com", urlBitcoin: "https://api.brandfetch.io/v2/brands/intercom.com", urlUber: "https://api.brandfetch.io/v2/brands/intercom.com", urlZendesk: "https://api.brandfetch.io/v2/brands/intercom.com", urlWebflow: "https://api.brandfetch.io/v2/brands/intercom.com", urlAsana: "https://api.brandfetch.io/v2/brands/intercom.com", urlStripe: "https://api.brandfetch.io/v2/brands/intercom.com", urlIntercom: "https://api.brandfetch.io/v2/brands/intercom.com")
//
//        linkLogo.init(urlBrandfetch: "https://api.brandfetch.io/v2/brands/intercom.com", urlSpotify: "https://api.brandfetch.io/v2/brands/intercom.com", urlSsalesforce: "https://api.brandfetch.io/v2/brands/intercom.com", urlNetflix: "https://api.brandfetch.io/v2/brands/intercom.com", urlGithub: "https://api.brandfetch.io/v2/brands/intercom.com", urlAirbnb: "https://api.brandfetch.io/v2/brands/intercom.com", urlMmailchimp: "https://api.brandfetch.io/v2/brands/intercom.com", urlFfigma: "https://api.brandfetch.io/v2/brands/intercom.com", urlReddit: "https://api.brandfetch.io/v2/brands/intercom.com", urlInvision: "https://api.brandfetch.io/v2/brands/intercom.com", urlBitcoin: "https://api.brandfetch.io/v2/brands/intercom.com", urlUber: "https://api.brandfetch.io/v2/brands/intercom.com", urlZendesk: "https://api.brandfetch.io/v2/brands/intercom.com", urlWebflow: "https://api.brandfetch.io/v2/brands/intercom.com", urlAsana: "https://api.brandfetch.io/v2/brands/intercom.com", urlStripe: "https://api.brandfetch.io/v2/brands/intercom.com", urlIntercom: "https://api.brandfetch.io/v2/brands/intercom.com")
//        return linkLogo
//        self.init(urlBrandfetch: "https://api.brandfetch.io/v2/brands/intercom.com", urlSpotify: "https://api.brandfetch.io/v2/brands/intercom.com", urlSsalesforce: "https://api.brandfetch.io/v2/brands/intercom.com", urlNetflix: "https://api.brandfetch.io/v2/brands/intercom.com", urlGithub: "https://api.brandfetch.io/v2/brands/intercom.com", urlAirbnb: "https://api.brandfetch.io/v2/brands/intercom.com", urlMmailchimp: "https://api.brandfetch.io/v2/brands/intercom.com", urlFfigma: "https://api.brandfetch.io/v2/brands/intercom.com", urlReddit: "https://api.brandfetch.io/v2/brands/intercom.com", urlInvision: "https://api.brandfetch.io/v2/brands/intercom.com", urlBitcoin: "https://api.brandfetch.io/v2/brands/intercom.com", urlUber: "https://api.brandfetch.io/v2/brands/intercom.com", urlZendesk: "https://api.brandfetch.io/v2/brands/intercom.com", urlWebflow: "https://api.brandfetch.io/v2/brands/intercom.com", urlAsana: "https://api.brandfetch.io/v2/brands/intercom.com", urlStripe: "https://api.brandfetch.io/v2/brands/intercom.com", urlIntercom: "https://api.brandfetch.io/v2/brands/intercom.com")
//
        
    
//}

//}

