package grizzzly

class InternalRoute {
    def configure = {
		from('vm:story').to('bean:storyManagerService?method=notify')
    }
}
