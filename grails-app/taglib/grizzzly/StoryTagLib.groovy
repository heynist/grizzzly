package grizzzly

class StoryTagLib {
	def editInPlace = { attrs, body ->
		def rows = attrs.rows ? attrs.rows : 0
		def cols = attrs.cols ? attrs.cols : 0
		def id = attrs.remove('id')
		
		out << "<span id='${id}'>"
		out << body()
			out << "</span>"
			out << "<script type='text/javascript'>"
			out << "new Ajax.InPlaceEditor('${id}', '"
			out << createLink(attrs.url)
			out << "',{"
			
			if (rows)
				out << "rows:${rows},"
			
			if (cols)
				out << "cols:${cols},"
				
			if (attrs.paramName) {
				out << "callback: " +
					"function(form, value) { " +
						"return '${attrs.paramName}=' + escape(value) " +
					"}"
			}
			
			out << "});"
			out << "</script>"
	}
}
