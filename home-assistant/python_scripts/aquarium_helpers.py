"""
Aquarium Helpers - Home Assistant Python Scripts
Called via: python_script.aquarium_helpers in automations/scripts

These helpers provide utility functions for the aquarium monitoring system.
Enable in configuration.yaml with: python_script:
Copy to: /config/python_scripts/aquarium_helpers.py
"""

# Calculate water quality score from test results
# Usage: python_script.aquarium_helpers with data: { action: "water_score" }
action = data.get("action", "")

if action == "water_score":
    ammonia = float(hass.states.get("sensor.aquarium_ammonia_test").state or 0)
    nitrite = float(hass.states.get("sensor.aquarium_nitrite_test").state or 0)
    nitrate = float(hass.states.get("sensor.aquarium_nitrate_test").state or 0)
    ph = float(hass.states.get("sensor.aquarium_ph_test").state or 7.0)

    score = 100
    # Ammonia penalties
    if ammonia > 0.5:
        score -= 40
    elif ammonia > 0.25:
        score -= 20
    elif ammonia > 0:
        score -= 5

    # Nitrite penalties
    if nitrite > 0.5:
        score -= 30
    elif nitrite > 0.25:
        score -= 15
    elif nitrite > 0:
        score -= 5

    # Nitrate penalties
    if nitrate > 80:
        score -= 20
    elif nitrate > 40:
        score -= 10

    # pH penalties (ideal 6.5-7.5)
    if ph < 6.0 or ph > 8.0:
        score -= 15
    elif ph < 6.5 or ph > 7.5:
        score -= 5

    score = max(0, score)

    hass.states.set("sensor.aquarium_water_quality_score", score, {
        "unit_of_measurement": "/100",
        "friendly_name": "Water Quality Score",
        "icon": "mdi:water-check",
        "ammonia": ammonia,
        "nitrite": nitrite,
        "nitrate": nitrate,
        "ph": ph,
    })
    logger.info(f"Water quality score calculated: {score}")

elif action == "maintenance_check":
    # Check when last maintenance tasks were done
    cleanliness = float(hass.states.get("sensor.tank_cleanliness_score").state or 87)

    if cleanliness < 70:
        status = "overdue"
    elif cleanliness < 85:
        status = "due_soon"
    else:
        status = "ok"

    hass.states.set("sensor.aquarium_maintenance_status", status, {
        "friendly_name": "Maintenance Status",
        "icon": "mdi:wrench-clock",
        "cleanliness_score": cleanliness,
    })
    logger.info(f"Maintenance status: {status}")
