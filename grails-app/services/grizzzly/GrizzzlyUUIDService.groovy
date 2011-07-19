package grizzzly

import java.util.UUID

class GrizzzlyUUIDService {

    static transactional = true

    def generate() {
		UUID uuid = UUID.randomUUID()
		return uuid.toString()
    }
}
