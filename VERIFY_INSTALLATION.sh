#!/bin/bash
# Combined Aquarium System Installation Verification

echo "==================================="
echo "Aquarium System Verification"
echo "==================================="
echo ""

# Check ATO system files
echo "Checking ATO system files..."
[ -f ato_monitor.py ] && echo "  ✓ ato_monitor.py" || echo "  ✗ ato_monitor.py MISSING"
[ -f config.example.py ] && echo "  ✓ config.example.py" || echo "  ✗ config.example.py MISSING"
[ -f requirements.txt ] && echo "  ✓ requirements.txt" || echo "  ✗ requirements.txt MISSING"
[ -f ato-monitor.service ] && echo "  ✓ ato-monitor.service" || echo "  ✗ ato-monitor.service MISSING"

echo ""
echo "Checking ATO documentation..."
[ -f docs/INSTALLATION.md ] && echo "  ✓ docs/INSTALLATION.md" || echo "  ✗ docs/INSTALLATION.md MISSING"
[ -f docs/WIRING.md ] && echo "  ✓ docs/WIRING.md" || echo "  ✗ docs/WIRING.md MISSING"
[ -f docs/CALIBRATION.md ] && echo "  ✓ docs/CALIBRATION.md" || echo "  ✗ docs/CALIBRATION.md MISSING"

echo ""
echo "Checking Docker files..."
[ -f docker/Dockerfile ] && echo "  ✓ Dockerfile" || echo "  ✗ Dockerfile MISSING"
[ -f docker/docker-compose.yml ] && echo "  ✓ docker-compose.yml" || echo "  ✗ docker-compose.yml MISSING"
[ -f docker/analyzer/aquarium_analyzer.py ] && echo "  ✓ aquarium_analyzer.py" || echo "  ✗ aquarium_analyzer.py MISSING"
[ -f docker/config/analyzer_config.yaml ] && echo "  ✓ analyzer_config.yaml" || echo "  ✗ analyzer_config.yaml MISSING"

echo ""
echo "Checking HA configuration..."
[ -f home-assistant/configuration.yaml ] && echo "  ✓ configuration.yaml (ATO)" || echo "  ✗ configuration.yaml MISSING"

echo ""
echo "Checking HA packages..."
[ -f home-assistant/packages/aquarium_sensors.yaml ] && echo "  ✓ aquarium_sensors.yaml" || echo "  ✗ aquarium_sensors.yaml MISSING"
[ -f home-assistant/packages/aquarium_scripts.yaml ] && echo "  ✓ aquarium_scripts.yaml" || echo "  ✗ aquarium_scripts.yaml MISSING"
[ -f home-assistant/packages/aquarium_automations.yaml ] && echo "  ✓ aquarium_automations.yaml" || echo "  ✗ aquarium_automations.yaml MISSING"

echo ""
echo "Checking dashboards..."
[ -f home-assistant/dashboards/aquarium_dashboard_17_tabs_COMPLETE.yaml ] && echo "  ✓ 17-tab dashboard" || echo "  ✗ 17-tab dashboard MISSING"
[ -f home-assistant/dashboard-complete.yaml ] && echo "  ✓ ATO dashboard" || echo "  ✗ ATO dashboard MISSING"

echo ""
echo "Checking documentation..."
[ -f README.md ] && echo "  ✓ README.md" || echo "  ✗ README.md MISSING"
[ -f FISH_SYSTEM_INSTALLATION.md ] && echo "  ✓ FISH_SYSTEM_INSTALLATION.md" || echo "  ✗ FISH_SYSTEM_INSTALLATION.md MISSING"
[ -f SYSTEM_SUMMARY.md ] && echo "  ✓ SYSTEM_SUMMARY.md" || echo "  ✗ SYSTEM_SUMMARY.md MISSING"

echo ""
echo "==================================="
echo "File check complete!"
echo "==================================="
