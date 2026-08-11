import 'package:flutter/material.dart';

void main() {
  runApp(const CPMApp());
}

class CPMApp extends StatelessWidget {
  const CPMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CPM Gear & Tune Guide',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          surface: Color(0xFF1E1E1E),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Tümü';
  String searchQuery = '';

  final List<Map<String, dynamic>> carData = [
    {
      "name": "Toyota Supra (A90)",
      "category": "Drag",
      "finalDrive": "3.20",
      "gears": {"1st": "2.80", "2nd": "1.90", "3rd": "1.40", "4th": "1.10", "5th": "0.85", "6th": "0.70", "7th": "0.55"},
      "cog": "Noktayı tam ortanın biraz aşağısına (Yere yakın) çekin.",
      "suspension": "Sertlik: Maksimum | Kamber: Front 0, Rear 0 | Yükseklik: En Alt",
      "notes": "AWD kalkış yapın. İlk vitesi uzun tutarak sarmayı engelleyin."
    },
    {
      "name": "BMW M5 E60",
      "category": "Drift",
      "finalDrive": "3.70",
      "gears": {"1st": "3.10", "2nd": "2.20", "3rd": "1.60", "4th": "1.25", "5th": "0.95", "6th": "0.75", "7th": "0.60"},
      "cog": "Noktayı arka aksa yakın yerleştirin.",
      "suspension": "Sertlik: Orta | Kamber: Front -5.0, Rear -2.0 | Yükseklik: Orta",
      "notes": "RWD modunda kullanın. Yanlarken devri yüksek tutun."
    },
    {
      "name": "Nissan GT-R R35",
      "category": "Drag",
      "finalDrive": "2.95",
      "gears": {"1st": "2.65", "2nd": "1.80", "3rd": "1.35", "4th": "1.05", "5th": "0.80", "6th": "0.65", "7th": "0.50"},
      "cog": "Noktayı tam merkeze yerleştirin.",
      "suspension": "Sertlik: %80 Sert | Kamber: 0 | Yükseklik: En Alt",
      "notes": "AWD açık, ESP kapalı. Vitesleri tam kırmızı çizgide atın."
    },
    {
      "name": "Mercedes-AMG E63",
      "category": "Hız",
      "finalDrive": "2.50",
      "gears": {"1st": "2.40", "2nd": "1.65", "3rd": "1.20", "4th": "0.95", "5th": "0.75", "6th": "0.58", "7th": "0.45"},
      "cog": "Noktayı ön kaputa biraz yakın tutun.",
      "suspension": "Sertlik: Yumuşak | Kamber: Front -1.0 | Yükseklik: En Alt",
      "notes": "Otobanda top-speed denemeleri için idealdir."
    },
    {
      "name": "Bugatti Chiron",
      "category": "Hız",
      "finalDrive": "2.10",
      "gears": {"1st": "2.20", "2nd": "1.50", "3rd": "1.10", "4th": "0.85", "5th": "0.65", "6th": "0.50", "7th": "0.40"},
      "cog": "Noktayı tam ortada tutun.",
      "suspension": "Sertlik: %90 Sert | Kamber: 0 | Yükseklik: En Alt",
      "notes": "500 km/h üzeri hızlar için vitesleri uzun tutun."
    },
    {
      "name": "Mazda RX-7",
      "category": "Drift",
      "finalDrive": "4.10",
      "gears": {"1st": "3.30", "2nd": "2.40", "3rd": "1.75", "4th": "1.30", "5th": "1.00", "6th": "0.80", "7th": "0.65"},
      "cog": "Noktayı arka tekerleklere yakın ayarlayın.",
      "suspension": "Sertlik: Yumuşak-Orta | Kamber: Front -6.0, Rear -1.5",
      "notes": "Hafif yapısı sayesinde dar virajlarda mükemmel kayar."
    },
    {
      "name": "Toyota Supra Mk4 (A80)",
      "category": "Drag",
      "finalDrive": "3.10",
      "gears": {"1st": "2.75", "2nd": "1.85", "3rd": "1.38", "4th": "1.08", "5th": "0.82", "6th": "0.68", "7th": "0.52"},
      "cog": "Noktayı arabanın tabanına yaklaştırın.",
      "suspension": "Sertlik: Maksimum | Kamber: 0 | Yükseklik: En Alt",
      "notes": "Efsanevi 2JZ tarzı yüksek tork ayarı."
    },
    {
      "name": "BMW M3 E46",
      "category": "Drift",
      "finalDrive": "3.85",
      "gears": {"1st": "3.15", "2nd": "2.25", "3rd": "1.65", "4th": "1.28", "5th": "0.98", "6th": "0.78", "7th": "0.62"},
      "cog": "Noktayı ortanın az gerisine kaydırın.",
      "suspension": "Sertlik: Orta | Kamber: Front -4.5, Rear -2.0",
      "notes": "Açı verirken gaz kontrolü kolaydır."
    },
    {
      "name": "Lamborghini Aventador",
      "category": "Drag",
      "finalDrive": "2.85",
      "gears": {"1st": "2.55", "2nd": "1.75", "3rd": "1.30", "4th": "1.00", "5th": "0.78", "6th": "0.62", "7th": "0.48"},
      "cog": "Noktayı tam ortada tutun.",
      "suspension": "Sertlik: Tam Sert | Kamber: 0 | Yükseklik: En Alt",
      "notes": "AWD ile ilk 100 metrede çok hızlı fırlar."
    },
    {
      "name": "Audi RS6 Avant",
      "category": "Drag",
      "finalDrive": "3.05",
      "gears": {"1st": "2.70", "2nd": "1.82", "3rd": "1.36", "4th": "1.05", "5th": "0.82", "6th": "0.66", "7th": "0.52"},
      "cog": "Noktayı merkezin biraz önüne koyun.",
      "suspension": "Sertlik: %85 Sert | Kamber: 0",
      "notes": "AWD sistemi sayesinde hiç patinaja kalmaz."
    },
    {
      "name": "Ford Mustang GT",
      "category": "Drift",
      "finalDrive": "3.55",
      "gears": {"1st": "3.00", "2nd": "2.10", "3rd": "1.55", "4th": "1.20", "5th": "0.90", "6th": "0.72", "7th": "0.58"},
      "cog": "Noktayı ön kaput tarafına yakın koyun.",
      "suspension": "Sertlik: Yumuşak | Kamber: Front -5.0, Rear -1.0",
      "notes": "Güçlü torku ile geniş drift açıları yakalar."
    },
    {
      "name": "Nissan Silvia S15",
      "category": "Drift",
      "finalDrive": "4.10",
      "gears": {"1st": "3.25", "2nd": "2.35", "3rd": "1.70", "4th": "1.28", "5th": "0.98", "6th": "0.78", "7th": "0.62"},
      "cog": "Noktayı arka tekerleklere odaklayın.",
      "suspension": "Sertlik: Yumuşak | Kamber: Front -6.5, Rear -2.0",
      "notes": "Profesyonel drift pistleri için en iyi tercihtir."
    },
    {
      "name": "Dodge Charger SRT",
      "category": "Drag",
      "finalDrive": "3.09",
      "gears": {"1st": "2.70", "2nd": "1.80", "3rd": "1.35", "4th": "1.05", "5th": "0.82", "6th": "0.65", "7th": "0.50"},
      "cog": "Noktayı öne kaydırın.",
      "suspension": "Sertlik: Sert | Kamber: 0",
      "notes": "Ağır kasadır, kalkışta düz çizgi kontrolüne dikkat edin."
    },
    {
      "name": "Mercedes-Benz G63 AMG",
      "category": "Drag",
      "finalDrive": "3.30",
      "gears": {"1st": "2.85", "2nd": "1.90", "3rd": "1.40", "4th": "1.10", "5th": "0.85", "6th": "0.68", "7th": "0.52"},
      "cog": "Noktayı en alta çekin (Devrilmemesi için).",
      "suspension": "Sertlik: Tam Sert | Kamber: Front -1.0, Rear -1.0",
      "notes": "Yüksek yapısı nedeniyle ağırlık merkezini en alta çekmek şarttır."
    },
    {
      "name": "Subaru Impreza WRX STI",
      "category": "Drag",
      "finalDrive": "3.45",
      "gears": {"1st": "2.95", "2nd": "2.00", "3rd": "1.48", "4th": "1.15", "5th": "0.88", "6th": "0.72", "7th": "0.58"},
      "cog": "Noktayı merkeze hizalayın.",
      "suspension": "Sertlik: Sert | Kamber: 0",
      "notes": "Rally ve drag için harika AWD dengesi sunar."
    },
    {
      "name": "Mitsubishi Lancer Evo X",
      "category": "Drag",
      "finalDrive": "3.50",
      "gears": {"1st": "3.00", "2nd": "2.05", "3rd": "1.50", "4th": "1.18", "5th": "0.90", "6th": "0.74", "7th": "0.60"},
      "cog": "Noktayı ortada tutun.",
      "suspension": "Sertlik: Sert | Kamber: 0",
      "notes": "Kısa vites oranları ile hızlı ivmelenir."
    },
    {
      "name": "BMW M4 G82",
      "category": "Drift",
      "finalDrive": "3.60",
      "gears": {"1st": "3.05", "2nd": "2.15", "3rd": "1.58", "4th": "1.22", "5th": "0.92", "6th": "0.74", "7th": "0.59"},
      "cog": "Noktayı arka tekerleklere yakın tutun.",
      "suspension": "Sertlik: Orta-Sert | Kamber: Front -5.5, Rear -1.5",
      "notes": "Yüksek hızda stabil drift yapar."
    },
    {
      "name": "Lamborghini Huracan",
      "category": "Drag",
      "finalDrive": "2.80",
      "gears": {"1st": "2.50", "2nd": "1.70", "3rd": "1.26", "4th": "0.96", "5th": "0.74", "6th": "0.58", "7th": "0.45"},
      "cog": "Noktayı tam ortada tutun.",
      "suspension": "Sertlik: Tam Sert | Kamber: 0",
      "notes": "4x4 yapısı ile fırlama hızı mükemmeldir."
    },
    {
      "name": "Volkswagen Golf R",
      "category": "Drag",
      "finalDrive": "3.35",
      "gears": {"1st": "2.85", "2nd": "1.92", "3rd": "1.42", "4th": "1.10", "5th": "0.85", "6th": "0.68", "7th": "0.54"},
      "cog": "Noktayı ortada tutun.",
      "suspension": "Sertlik: Sert | Kamber: 0",
      "notes": "Şehir içi drag yarışlarının favorisidir."
    },
    {
      "name": "BMW E30 M3",
      "category": "Drift",
      "finalDrive": "4.20",
      "gears": {"1st": "3.35", "2nd": "2.40", "3rd": "1.75", "4th": "1.32", "5th": "1.00", "6th": "0.80", "7th": "0.65"},
      "cog": "Noktayı arka aksta tutun.",
      "suspension": "Sertlik: Yumuşak | Kamber: Front -6.0, Rear -2.5",
      "notes": "Dar alanlarda hızlı yön değiştirebilir."
    },
    {
      "name": "Koenigsegg Agera RS",
      "category": "Hız",
      "finalDrive": "1.95",
      "gears": {"1st": "2.10", "2nd": "1.45", "3rd": "1.05", "4th": "0.80", "5th": "0.60", "6th": "0.46", "7th": "0.35"},
      "cog": "Noktayı tabana sıfırlayın.",
      "suspension": "Sertlik: Tam Sert | Kamber: 0",
      "notes": "Oyundaki en yüksek son hıza ulaşan oranlardan biridir."
    },
    {
      "name": "Toyota AE86 Trueno",
      "category": "Drift",
      "finalDrive": "4.30",
      "gears": {"1st": "3.40", "2nd": "2.45", "3rd": "1.80", "4th": "1.35", "5th": "1.02", "6th": "0.82", "7th": "0.68"},
      "cog": "Noktayı arka tekerlere yakın ayarlayın.",
      "suspension": "Sertlik: Yumuşak | Kamber: Front -7.0, Rear -2.0",
      "notes": "Dar dağ yollarında ve touge driftlerinde idealdir."
    },
    {
      "name": "Jeep Grand Cherokee Trackhawk",
      "category": "Drag",
      "finalDrive": "3.25",
      "gears": {"1st": "2.80", "2nd": "1.88", "3rd": "1.38", "4th": "1.08", "5th": "0.84", "6th": "0.66", "7th": "0.51"},
      "cog": "Noktayı en alt seviyeye indirin.",
      "suspension": "Sertlik: Tam Sert | Kamber: 0",
      "notes": "Kalkışta ön kaldırmaması için ağırlığı alta çekin."
    },
    {
      "name": "Honda S2000",
      "category": "Drift",
      "finalDrive": "4.15",
      "gears": {"1st": "3.30", "2nd": "2.38", "3rd": "1.72", "4th": "1.30", "5th": "0.99", "6th": "0.79", "7th": "0.63"},
      "cog": "Noktayı arka tekerleklere yakın tutun.",
      "suspension": "Sertlik: Yumuşak-Orta | Kamber: Front -6.0, Rear -1.8",
      "notes": "Yüksek devir çevirdiği için vites geçişlerini serice yapın."
    },
    {
      "name": "Honda Civic Type R (EK9)",
      "category": "Hız",
      "finalDrive": "3.40",
      "gears": {"1st": "2.90", "2nd": "1.95", "3rd": "1.45", "4th": "1.12", "5th": "0.88", "6th": "0.70", "7th": "0.56"},
      "cog": "Noktayı ön aks üzerine getirin.",
      "suspension": "Sertlik: Orta-Sert | Kamber: Front -2.5, Rear -0.5",
      "notes": "Önden çekişte kaymayı önlemek için sert süspansiyon seçin."
    }
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCars = carData.where((car) {
      bool matchesCategory = selectedCategory == 'Tümü' || car['category'].toString().contains(selectedCategory);
      bool matchesSearch = car['name'].toString().toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('CPM Guide (${carData.length} Araba)', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
        backgroundColor: const Color(0xFF1E1E1E),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Araba ara (Örn: Supra, M5)...',
                prefixIcon: const Icon(Icons.search, color: Colors.amber),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: ['Tümü', 'Drag', 'Drift', 'Hız'].map((cat) {
                bool isSelected = selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: Colors.amber,
                    labelStyle: TextStyle(color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.bold),
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = cat;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCars.length,
              itemBuilder: (context, index) {
                var car = filteredCars[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  color: const Color(0xFF1E1E1E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: const Icon(Icons.directions_car_filled, color: Colors.amber, size: 36),
                    title: Text(car['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    subtitle: Text('Kategori: ${car['category']}', style: TextStyle(color: Colors.grey[400])),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber, size: 18),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen(car: car)),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> car;

  const DetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    Map<String, String> gears = car['gears'];

    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.speed, color: Colors.amber, size: 40),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Kategori: ${car['category']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Final Drive: ${car['finalDrive']}', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Vites Oranları (Gearbox)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey[800]!),
              children: gears.entries.map((e) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.value, style: const TextStyle(color: Colors.amber)),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text('COG (Ağırlık Merkezi Konumu)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 5),
            Text(car['cog'], style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 20),
            const Text('Süspansiyon & Kamber', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 5),
            Text(car['suspension'], style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 20),
            const Text('Sürüş Taktikleri', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber)),
            const SizedBox(height: 5),
            Text(car['notes'], style: TextStyle(fontSize: 15, color: Colors.grey[300])),
          ],
        ),
      ),
    );
  }
}
