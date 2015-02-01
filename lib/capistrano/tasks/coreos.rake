namespace :coreos do
  desc "List CoreOS machine"
  task :machines do
    machines = {}

    on roles(:all) do |m|
      machines[m.hostname] = {
        state:    capture("systemctl status | head -n4 | grep State: | sed 's/State: //'"),
        version:  capture("cat /etc/os-release | grep VERSION= | sed s/VERSION=// "),
        channel:  capture("cat /etc/coreos/update.conf | grep GROUP= | sed s/GROUP=// "),
        strategy: capture("cat /etc/coreos/update.conf | grep REBOOT_STRATEGY= | sed s/REBOOT_STRATEGY=// "),
      }
    end

    outputs = [["MACHINE", "SYSTEMD", "VERSION", "CHANNEL", "STRATEGY"]]
    machines.each do |k,v|
      outputs << [k, v[:state], v[:version], v[:channel], v[:strategy]]
    end
    outputs.each do |o|
      puts o[0].ljust(15) + o[1].ljust(10) + o[2].ljust(10) + o[3].ljust(10) + o[4].ljust(10)
    end
  end

  desc "Update CoreOS"
  task :update do
    on roles(:all) do |m|
      #sudo update_engine_client -update
    end
  end

  desc "Reboot CoreOS"
  task :reboot do
    on roles(:all) do |m|
      #reboot
    end
  end
end
