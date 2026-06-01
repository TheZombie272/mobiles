package website.impulsadigital

import androidx.compose.runtime.*
import website.impulsadigital.ui.AddPlaceScreen
import website.impulsadigital.ui.HomeScreen

@Composable
fun AppRare() {
    var currentScreen by remember { mutableStateOf("home") }

    if (currentScreen == "home") {
        HomeScreen(onAdd = { currentScreen = "add" })
    } else {
        AddPlaceScreen(onBack = { currentScreen = "home" })
    }
}