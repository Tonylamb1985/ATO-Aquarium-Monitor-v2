# 🐠 ATO Aquarium Monitor

**Enterprise-grade Auto Top-Off monitoring and control system for aquariums**

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Python](https://img.shields.io/badge/python-3.7+-blue.svg)
![Platform](https://img.shields.io/badge/platform-Raspberry%20Pi%203-red.svg)
![Home Assistant](https://img.shields.io/badge/Home%20Assistant-compatible-green.svg)

## 🌟 Features

### ATO System (Raspberry Pi)
- ✅ **Auto-Calibration** - Self-calibrates based on refills
- ✅ **Temperature Monitoring** - DS18B20 waterproof sensor with calibration
- ✅ **Pump Control** - Safe relay-based pump activation with timeout
- ✅ **Seasonal Tracking** - Automatic season detection and evaporation analysis
- ✅ **30-Day History** - Persistent data storage across reboots
- ✅ **Multiple Safety Features** - 30s timeout, emergency stop, alerts
- ✅ **MQTT Integration** - Real-time updates and control
- ✅ **Mobile Notifications** - Critical alerts via Home Assistant app

### Full Fish System (Docker AI)
- ✅ **Water Testing** - AI analysis of Seachem badges, API strips, NT Labs tubes
- ✅ **Fish Health Monitoring** - AI-powered health & behavior tracking
- ✅ **Plant Growth Tracking** - Coverage measurement & algae detection (4 types)
- ✅ **Tank Cleanliness** - Automated scoring with component breakdown
- ✅ **Equipment Monitor** - Heater, filter, and light performance tracking
- ✅ **Feeding Verification** - Consumption tracking & response time analysis
- ✅ **GPU Accelerated** - Intel HD 530 OpenCL for fast image processing
- ✅ **17-Tab Dashboard** - Complete Home Assistant interface

## 📊 System Overview

This system monitors and controls an aquarium Auto Top-Off (ATO) system using:
- **Raspberry Pi 3** as the main controller
- **D-D Float Switch** for water level detection
- **8-Channel Relay Module** for pump control
- **DS18B20 Temperature Sensor** for tank monitoring
- **Home Assistant** for visualization and alerts

### Monitoring Capabilities

| Metric | Timeframes | Features |
|--------|-----------|----------|
| Evaporation Rate | 1h, 6h, 24h, 7d, 30d | Auto-calibrating |
| Temperature | Real-time, 24h, 7d stats | ±0.5°C accuracy |
| Pump Performance | Per-cycle tracking | Degradation detection |
| Seasonal Analysis | Spring/Summer/Autumn/Winter | Historical comparison |
| Alerts | Real-time logging | 500 alert history |

## 🚀 Quick Start

### Prerequisites

- Raspberry Pi 3 (or newer)
- Home Assistant with MQTT broker
- Python 3.7+
- Basic electronics skills

### Hardware Required

| Component | Specification | Qty |
|-----------|--------------|-----|
| Raspberry Pi 3 | Model B | 1 |
| 8-Channel Relay Module | 5V with optocouplers | 1 |
| DS18B20 Temp Sensor | Waterproof, digital | 1 |
| 4.7kΩ Resistor | Pull-up for DS18B20 | 1 |
| Float Switch | D-D ATO or compatible | 1 |
| 12V Power Supply | 500mA+ for pump | 1 |

### Installation

```bash
# 1. Clone this repository
git clone https://github.com/tonylamb1985/ato-aquarium-monitor.git
cd ato-aquarium-monitor

# 2. Install dependencies
pip3 install paho-mqtt --break-system-packages
pip3 install RPi.GPIO --break-system-packages

# 3. Enable 1-Wire for DS18B20
sudo nano /boot/config.txt
# Add: dtoverlay=w1-gpio,gpiopin=4
sudo reboot

# 4. Configure the script
cp config.example.py config.py
nano config.py
# Edit MQTT broker IP, credentials, etc.

# 5. Run the script
python3 ato_monitor.py

# 6. Install as service (optional but recommended)
sudo cp ato-monitor.service /etc/systemd/system/
sudo systemctl enable ato-monitor.service
sudo systemctl start ato-monitor.service
```

## 📁 Repository Structure

```
ato-aquarium-monitor/
├── README.md                          # This file
├── LICENSE                            # MIT License
├── CHANGELOG.md                       # Version history
│
│── ── ATO System (Raspberry Pi) ── ──
├── ato_monitor.py                     # Main ATO Python script
├── config.example.py                  # ATO configuration template
├── requirements.txt                   # Python dependencies
├── ato-monitor.service               # Systemd service file
│
│── ── Full Fish System (Docker AI) ── ──
├── FISH_SYSTEM_INSTALLATION.md       # Full fish system setup guide
├── SYSTEM_SUMMARY.md                 # Architecture details
├── FILE_CHECKLIST.md                 # Deployment checklist
├── VERIFY_INSTALLATION.sh            # Post-install verification script
│
├── docker/                            # AI Analyzer (Docker container)
│   ├── Dockerfile                     # Intel HD 530 GPU optimized
│   ├── docker-compose.yml             # Container configuration
│   ├── analyzer/
│   │   └── aquarium_analyzer.py       # Main AI analysis engine
│   └── config/
│       └── analyzer_config.yaml       # Color charts & pixel regions
│
├── docs/                              # ATO documentation
│   ├── INSTALLATION.md               # ATO installation guide
│   ├── WIRING.md                     # Wiring diagrams
│   ├── CALIBRATION.md                # Calibration procedures
│   └── TROUBLESHOOTING.md            # Common issues & solutions
│
├── home-assistant/                    # Home Assistant configs
│   ├── configuration.yaml            # ATO MQTT sensors config
│   ├── configuration-MEGA-COMPLETE.yaml
│   ├── dashboard-complete.yaml       # ATO dashboard (9 tabs)
│   ├── dashboard-MEGA-with-all-9-tabs.yaml
│   ├── INTEGRATION_GUIDE.md          # HA packages guide
│   ├── packages/                      # Fish system HA packages
│   │   ├── aquarium_sensors.yaml     # All MQTT sensor definitions
│   │   ├── aquarium_scripts.yaml     # Phone camera upload scripts
│   │   └── aquarium_automations.yaml # Event handlers & alerts
│   ├── dashboards/                    # Fish system dashboards
│   │   ├── aquarium_dashboard_17_tabs_COMPLETE.yaml
│   │   ├── DASHBOARD_INSTALLATION.md
│   │   └── aquarium-dashboard-17-tabs.tar.gz
│   └── www/
│       └── aquarium_photos/           # Photo storage directory
│
├── home-assistant-3sensors/          # 3-sensor temp upgrade
│   ├── configuration_ADD_THIS.yaml
│   └── dashboard_all_temps_tab.yaml
│
└── documentation/                     # Additional docs (extensible)
```

## 🎛️ Dashboard Preview

The system includes a complete 17-tab dashboard:

**ATO System (Tabs 1-9):**
1. **Overview** - Real-time ATO status, charts, quick actions
2. **Analytics** - Historical trends, usage patterns
3. **Settings** - Configuration, calibration, controls
4. **Calibration** - Auto-calibration status and history
5. **Advanced** - Seasonal stats, alerts history, pump performance
6. **Temperature** - Tank temperature monitoring and trends
7. **All Temperatures** - Multi-sensor temperature displays
8. **Maintenance** - Task tracking, inventory
9. **Environment** - Room monitoring, humidity

**Full Fish System (Tabs 10-17):**
10. **Water Testing** - Seachem badge, API strips, NT Labs tubes
11. **Fish Health** - AI-powered health & behavior tracking
12. **Plant Growth** - Coverage tracking, algae detection
13. **Tank Cleanliness** - Automated scoring & maintenance scheduling
14. **Equipment Monitor** - Heater, filter, light performance
15. **Feeding & Care** - Feeding verification & maintenance tracking
16. **Analytics & Insights** - Long-term trends, cost tracking
17. **Alerts & Status** - Overall tank score, quick actions

## 📈 Auto-Calibration

The system automatically calibrates itself based on your refills:

1. Refill your reservoir and enter the exact amount added
2. System tracks activations between refills
3. Calculates: `Liters per activation = Total liters / Activations`
4. Uses rolling average of last 5 refills for accuracy
5. Confidence increases with each refill (20% per refill)

**Typical Results:**
- After 2 refills: 40% confidence
- After 4 refills: 80% confidence
- After 5 refills: 100% confidence

## 🌡️ Temperature Monitoring

- **Sensor:** DS18B20 waterproof digital temperature sensor
- **Accuracy:** ±0.5°C factory, ±0.1°C after calibration
- **Reading Interval:** Every 30 seconds
- **Calibration:** Manual offset adjustment via Home Assistant
- **Alerts:** Configurable warning and critical thresholds

## 🔔 Alerts & Notifications

The system monitors for:

| Alert Type | Trigger | Action |
|------------|---------|--------|
| Critical Low Temp | <20°C | Immediate notification |
| Critical High Temp | >30°C | Immediate notification |
| Pump Timeout | >30s runtime | Emergency stop + disable |
| Rapid Activations | >3 per hour | Leak warning |
| Reservoir Low | <5L remaining | Refill reminder |
| No Activity | >36 hours | Check pump/float |

## 🛡️ Safety Features

1. **30-Second Timeout** - Pump automatically stops if running too long
2. **Emergency Stop** - MQTT-controlled monitoring disable
3. **Float Switch Independence** - Monitors existing D-D ATO system
4. **Persistent Data** - Survives power outages and reboots
5. **Alert Logging** - Complete history of all alerts
6. **Multiple Thresholds** - Warning and critical levels

## 📊 Seasonal Intelligence

The system automatically detects the current season and tracks:

- Seasonal evaporation patterns
- Temperature variations by season
- Pump performance across seasons
- Year-over-year comparisons

**Supported Seasons:** Spring 🌸, Summer ☀️, Autumn 🍂, Winter ❄️

## 🔧 Configuration

Edit `config.py` to customize:

```python
# Tank Configuration
RESERVOIR_CAPACITY = 23.0      # Liters
LITERS_PER_ACTIVATION = 1.0    # Initial estimate (auto-calibrates)

# Alert Thresholds
MAX_ACTIVATIONS_PER_HOUR = 3
MAX_DAILY_USAGE = 6.0          # Liters
MAX_FILL_DURATION = 30         # Seconds

# Temperature Thresholds (°C)
TEMP_MIN_WARNING = 22.0
TEMP_MAX_WARNING = 28.0
TEMP_MIN_CRITICAL = 20.0
TEMP_MAX_CRITICAL = 30.0
```

## 📡 MQTT API

The system publishes to these MQTT topics:

### Status Topics
- `aquarium/ato/state` - Current state (filling/idle/disabled)
- `aquarium/ato/pump_state` - Pump status (ON/OFF)
- `aquarium/ato/monitoring_enabled` - Monitoring status
- `aquarium/ato/temperature` - Current tank temperature

### Data Topics
- `aquarium/ato/daily_usage` - Water used today (L)
- `aquarium/ato/reservoir_level` - Remaining water (L)
- `aquarium/ato/lph_24h` - 24-hour evaporation rate (L/h)
- `aquarium/ato/calibrated_lph` - Current calibration value

### Control Topics
- `aquarium/ato/enable` - Enable/disable monitoring (ON/OFF)
- `aquarium/ato/refill` - Record reservoir refill (liters)
- `aquarium/ato/temp_calibration_set` - Set temp offset (°C)

See [docs/API.md](docs/API.md) for complete API documentation.

## 🐛 Troubleshooting

Common issues and solutions:

**No temperature readings?**
```bash
ls /sys/bus/w1/devices/
# Should show: 28-xxxxxxxxxxxx
```

**Pump not activating?**
```bash
sudo systemctl status ato-monitor.service
journalctl -u ato-monitor.service -n 50
```

**Script keeps crashing?**
```bash
# Check permissions
sudo usermod -a -G gpio pi
```

See [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) for detailed solutions.

## 📚 Documentation

### ATO System
- [Installation Guide](docs/INSTALLATION.md) - Step-by-step ATO setup
- [Wiring Diagrams](docs/WIRING.md) - Hardware connections
- [Calibration Guide](docs/CALIBRATION.md) - How to calibrate sensors
- [Troubleshooting](docs/TROUBLESHOOTING.md) - Common issues

### Full Fish System
- [Fish System Installation](FISH_SYSTEM_INSTALLATION.md) - Docker + HA setup
- [System Summary](SYSTEM_SUMMARY.md) - Architecture & design details
- [HA Integration Guide](home-assistant/INTEGRATION_GUIDE.md) - Packages setup
- [Dashboard Installation](home-assistant/dashboards/DASHBOARD_INSTALLATION.md) - 17-tab dashboard setup
- [File Checklist](FILE_CHECKLIST.md) - Deployment verification

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report Bugs** - Open an issue with details
2. **Suggest Features** - Share your ideas in discussions
3. **Submit PRs** - Fork, make changes, submit pull request
4. **Improve Docs** - Help make documentation clearer
5. **Share Your Setup** - Post photos/videos of your system

### Development Setup

```bash
git clone https://github.com/tonylamb1985/ato-aquarium-monitor.git
cd ato-aquarium-monitor
# Make your changes
git checkout -b feature/your-feature-name
git commit -am "Add your feature"
git push origin feature/your-feature-name
# Open a Pull Request
```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Raspberry Pi Foundation** - Raspberry Pi hardware
- **Home Assistant** - Open source home automation
- **Mosquitto** - MQTT broker
- **D-D** - ATO system inspiration
- **Community** - All contributors and users

## 📞 Support

- 🐛 **Bug Reports:** [Open an Issue](https://github.com/tonylamb1985/ato-aquarium-monitor/issues)
- 💡 **Feature Requests:** [Start a Discussion](https://github.com/tonylamb1985/ato-aquarium-monitor/discussions)
- 📧 **Email:** your.email@example.com
- 💬 **Discord:** [Join our server](#)

## 🗺️ Roadmap

### Version 1.1 (Planned)
- [ ] Multi-tank support
- [ ] Web interface (no HA required)
- [ ] Additional sensor support (pH, TDS)
- [ ] Automated dosing integration
- [ ] Cloud backup option

### Version 1.2 (Future)
- [ ] Machine learning predictions
- [x] Camera integration (Full Fish System)
- [ ] Voice control (Alexa/Google)
- [ ] Mobile app
- [ ] SMS alerts

## 📊 Stats

- **Lines of Code:** ~1,500
- **Files Created:** 6 data files
- **Storage Used:** ~1MB
- **Update Frequency:** 0.5s (float switch), 30s (temperature)
- **Data Retention:** 30 days (activations), 10,000 readings (temp)

## 🌟 Star History

If you find this project useful, please consider giving it a star! ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=tonylamb1985/ato-aquarium-monitor&type=Date)](https://star-history.com/#tonylamb1985/ato-aquarium-monitor&Date)

## 📸 Gallery

### Hardware Setup
![Hardware Setup](images/hardware-setup.jpg)

### Dashboard
![Dashboard Screenshot](images/dashboard-screenshot.png)

### Wiring Diagram
![Wiring Diagram](images/wiring-diagram.png)

---

**Made with ❤️ for the aquarium community**

*Keep your fish happy and your tank topped off!* 🐠💧
