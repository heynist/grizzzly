

class StoryUpdatedRoute {
    def configure = {
        // example:
        // from('seda:input').to('stream:out')
        from('activemq:input.queue').to('stream:out')
    }
}
