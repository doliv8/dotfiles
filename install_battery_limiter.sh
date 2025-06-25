sudo cp battery_limiter/battery_charge_threshold.service /etc/systemd/system/battery_charge_threshold.service
sudo cp battery_limiter/battery_charge_threshold.timer /etc/systemd/system/battery_charge_threshold.timer
sudo systemctl daemon-reload
sudo systemctl enable --now battery_charge_threshold.service
sudo systemctl enable --now battery_charge_threshold.timer
sudo systemctl daemon-reload