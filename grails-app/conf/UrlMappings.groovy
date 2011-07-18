class UrlMappings {

	static mappings = {
		"/rest/story/$id?"(controller:"storyRest",action:"index")
		
		"/rss/$controller"(action:"rss")

		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
