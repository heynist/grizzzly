package grizzzly

import org.springframework.web.util.JavaScriptUtils

class GrizzzlyTagLib {
    /**
     * Captures the given body's text and returns it as a String
     *
     * @param body the body Closure as provided to a tag
     */
    static captureBody(body) {
		def sw = new StringWriter()
		def saveOut = body.delegate.out
		try {
			body.delegate.out = new PrintWriter(sw)
            body()
		}
		finally {
			body.delegate.out = saveOut
		}
		return sw.toString()
    }

    /**
     * Escape the body text for use in a Javascript string context
     *
     * Useful for Ajax stuff
     */
    def escapeBody = { attrs, body ->
        // TODO maybe support more formats
        assert attrs.javaScriptEscape, "'javaScriptEscape' attribute was not provided, but it's the only supported escaping mechanism right now!?"
        out << JavaScriptUtils.javaScriptEscape(captureBody(body))
    }
}
