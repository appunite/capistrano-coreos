namespace :systemd do
  desc "Show systemd status summary"
  task "status" do
    machines = {}

    on roles(:all) do |m|
      machines[m.hostname] = {
        state:  capture("systemctl status | head -n4 | grep State:  | sed 's/State: //'"),
        jobs:   capture("systemctl status | head -n4 | grep Jobs:   | sed 's/Jobs: //'"),
        failed: capture("systemctl status | head -n4 | grep Failed: | sed 's/Failed: //'"),
      }
    end

    outputs = [["MACHINE", "STATE", "JOBS", "FAILED"]]
    machines.each do |k,v|
      outputs << [k, v[:state], v[:jobs], v[:failed]]
    end
    outputs.each do |o|
      puts o[0].ljust(15) + o[1].ljust(10) + o[2].ljust(10) + o[3].ljust(10)
    end
  end
end
