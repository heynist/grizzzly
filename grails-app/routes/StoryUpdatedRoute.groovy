

class StoryUpdatedRoute {
    def configure = {
        // example:
        // from('seda:input').to('stream:out')
        from('activemq:grizzzly.internal.story.queue').to('stream:out')
    }
}
