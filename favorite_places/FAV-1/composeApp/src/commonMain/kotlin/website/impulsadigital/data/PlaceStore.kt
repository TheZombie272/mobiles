package website.impulsadigital.data

import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import website.impulsadigital.model.Place
object PlaceStore {
    private val _places = MutableStateFlow(
        listOf(
            Place(1, "Mount Fuji", "Iconic volcano in Japan"),
            Place(2, "Eiffel Tower", "Famous landmark in Paris"),
            Place(3, "Grand Canyon", "Impressive natural formation in the USA")
        )
    )

    val places: StateFlow<List<Place>> = _places

    fun addPlace(name: String, description: String) {
        val current = _places.value
        val newPlace = Place(
            id = (current.maxOfOrNull { it.id } ?: 0) + 1,
            name = name,
            description = description
        )
        _places.value = current + newPlace
    }

    fun getPlacesSnapshot(): List<Place> = places.value
}