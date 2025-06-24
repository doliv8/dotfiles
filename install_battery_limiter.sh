sudo cp battery_limiter/battery_charge_threshold.service /etc/systemd/system/
sudo cp battery_limiter/battery_charge_threshold.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now my-service.timer