

class StoryUpdatedRoute {
    def configure = {
        // example:
        // from('seda:input').to('stream:out')
        from('grizzzly.internal.story.queue').to('stream:out')
    }
}
