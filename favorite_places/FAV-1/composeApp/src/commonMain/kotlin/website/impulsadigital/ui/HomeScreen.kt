package website.impulsadigital.ui

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import website.impulsadigital.data.PlaceStore

@Composable
fun HomeScreen(onAdd: () -> Unit) {

    val places by PlaceStore.places.collectAsState()

    Column(modifier = Modifier.padding(16.dp)) {

        Text(
            "Favorite Places",
            style = MaterialTheme.typography.headlineMedium
        )

        Spacer(modifier = Modifier.height(16.dp))

        LazyColumn(
            modifier = Modifier.weight(1f),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(places) { place ->
                PlaceCard(place)
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onAdd,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Add Place")
        }
    }
}