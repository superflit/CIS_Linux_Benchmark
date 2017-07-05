control '1.1.1.1' do
  impact 1.0
  title 'Ensure mounting of cramfs disabled'
  describe command('lsmod | grep cramfs') do
    its('stdout') { should eq '' }
  end
end
control '1.1.1.2' do
  impact 1.0
  title 'Ensure mounting of freevxfs disabled'
  describe command('lsmod | grep freevxfs') do
    its('stdout') { should eq '' }
  end
end
control '1.1.1.3' do
  impact 1.0
  title 'Ensure mounting of jffs2 disabled'
  describe command('lsmod | grep jffs2') do
    its('stdout') { should eq '' }
  end
end
control '1.1.1.4' do
  impact 1.0
  title 'Ensure mounting of hfs disabled'
  describe command('lsmod | grep hfs') do
    its('stdout') { should eq '' }
  end
end

control '1.1.1.5' do
  impact 1.0
  title 'Ensure mounting of hfspls disabled'
  describe command('lsmod | grep hfsplus') do
    its('stdout') { should eq '' }
  end
end

control '1.1.1.6' do
  impact 1.0
  title 'Ensure mounting of squashfs disabled'
  describe command('lsmod | grep squashfs') do
    its('stdout') { should eq '' }
  end
end
control '1.1.1.7' do
  impact 1.0
  title 'Ensure mounting of udf disabled'
  describe command('lsmod | grep udf') do
    its('stdout') { should eq '' }
  end
end
control '1.1.1.8' do
  impact 1.0
  title 'Ensure mounting of FAT disabled'
  describe command('lsmod | grep -i fat') do
    its('stdout') { should eq '' }
  end
end
control '1.1.2' do
  impact 1.0
  title 'Ensure separate partition exists for /tmp'
  describe command('mount | grep tmp') do
    its('stdout') { should match /tmpfs/ }
  end
end
control '1.1.3' do
  impact 1.0
  title 'Ensure nodev option on /tmp partition'
  describe command('mount | grep tmp') do
    its('stdout') { should match /nodev/ }
  end
end

control '1.1.4' do
  impact 1.0
  title 'Ensure nosuid option on /tmp partition'
  describe command('mount | grep tmp') do
    its('stdout') { should match /nosuid/ }
  end
end

control '1.1.5' do
  impact 1.0
  title 'Ensure noexec option on tmp partition'
  describe command('mount | grep tmp') do
    its('stdout') { should match /noexec/ }
  end
end

control '1.1.6' do
  impact 1.0
  title 'Ensure separate partition exists for /var'
  describe command('mount | grep var') do
    its('stdout') { should match /var/ }
  end
end

control '1.1.7' do
  impact 1.0
  title 'Ensure separate partition exists for /var/tmp'
  describe command('mount | grep var/tmp') do
    its('stdout') { should match %r{/var/tmp} }
  end
end

control '1.1.8' do
  impact 1.0
  title 'Ensure nodev option on var/tmp partition'
  describe command('mount | grep var/tmp') do
    its('stdout') { should match /nodev/ }
  end
end

control '1.1.9' do
  impact 1.0
  title 'Ensure nosuid option on var/tmp partition'
  describe command('mount | grep var/tmp') do
    its('stdout') { should match /nosuid/ }
  end
end

control '1.1.10' do
  impact 1.0
  title 'Ensure noexec option on var/tmp partition'
  describe command('mount | grep var/tmp') do
    its('stdout') { should match /noexec/ }
  end
end

control '1.1.11' do
  impact 1.0
  title 'Ensure separate partition exists for /var/log'
  describe command('mount | grep var/log') do
    its('stdout') { should match %r{/var/log} }
  end
end

control '1.1.12' do
  impact 1.0
  title 'Ensure separate partition exists for /var/log/audit'
  describe command('mount | grep var/log/audit') do
    its('stdout') { should match /audit/ }
  end
end

control '1.1.13' do
  impact 1.0
  title 'Ensure separate partition exists for /home'
  describe command('mount | grep home') do
    its('stdout') { should match /\*home\*/ }
  end
end

control '1.1.14' do
  impact 1.0
  title 'Ensure nodev option on /home partition'
  describe command('mount | grep home') do
    its('stdout') { should match /nodev/ }
  end
end

control '1.1.15' do
  impact 1.0
  title 'Ensure nodev option on /dev/shm partition'
  describe command('mount | grep shm') do
    its('stdout') { should match /nodev/ }
  end
end

control '1.1.16' do
  impact 1.0
  title 'Ensure nosuid option on /dev/shm partition'
  describe command('mount | grep shm') do
    its('stdout') { should match /nosuid/ }
  end
end

control '1.1.17' do
  impact 1.0
  title 'Ensure noexec option on /dev/shm partition'
  describe command('mount | grep shm') do
    its('stdout') { should match %r{ noexec } }
  end
end

control '1.5.1' do
  impact 1.0
  title 'Ensure core dumps are restricted'
  describe command('sysctl fs.suid_dumpable') do
    its('stdout') { should match %r{0} }
  end
end

control '1.5.2' do
  impact 1.0
  title 'Ensure XD/NX support is enabled'
  describe command('dmesg | grep NX') do
    its('stdout') { should match %r{active} }
  end
end

control '1.5.3' do
  impact 1.0
  title 'Ensure address space layout randomization (ASLR) is enabled'
  describe command('sysctl kernel.randomize_va_space') do
    its('stdout') { should match %r{2} }
  end
end

control '1.7.1.1' do
  impact 1.0
  title ' Ensure message of the day is configured properly'
  describe command('egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/motd') do
    its('stdout') { should eq '' }
  end
end

control '1.7.1.2' do
  impact 1.0
  title 'Ensure local login banner is configured properly'
  describe command('egrep \'(\\\v|\\\r|\\\m|\\\s)\' /etc/issue') do
    its('stdout') { should eq '' }
  end
end

control '1.7.1.3' do
  impact 1.0
  title 'Ensure remote login banner is configured properly'
  describe command('egrep \'\(\\\v|\\\r|\\\m|\\\s\)\' /etc/issue.net') do
    its('stdout') { should eq '' }
  end
end

control '1.7.1.4' do
  impact 1.0
  title 'Ensure permissions on /etc/motd are configured'
  describe command('stat /etc/motd') do
    its('stdout') { should match  %r{Access: (0644/-rw-r--r--)} }
  end
end

control '1.7.1.5' do
  impact 1.0
  title 'Ensure permissions on /etc/issue are configured'
  describe command('stat /etc/issue') do
    its('stdout') { should match  %r{Access: (0644/-rw-r--r--)} }
  end
end

control '1.7.1.6' do
  impact 1.0
  title 'Ensure permissions on /etc/issue.net are configured'
  describe command('stat /etc/issue.net') do
    its('stdout') { should match %r{Access: (0644/-rw-r--r--)} }
  end
end

control '1.7.2' do
  impact 1.0
  title 'Ensure GDM login banner is configured'
  if File.exist?('/etc/dconf/profile/gdm')
    describe command('cat /etc/dconf/profile/gdm') do
      its('stdout') { should match %r{user-db:user} }
    end
  end
end

control '2.1.1.1' do
  impact 1.0
  title 'Ensure chargen services are not enabled xinetd'
  describe command('grep -R \"^chargen\" /etc/xinetd.d/*') do
    its('stdout') { should eq '' }
  end
  only_if { file('/etc/xinetd.d').exist? }
end

control '2.1.1.2' do
  impact 1.0
  title 'Ensure chargen services are not enabled inetd'
  describe command('grep -R \"^chargen\" /etc/inetd.*') do
      its('stdout') { should eq '' }
  end
  only_if { file('/etc/inted.conf').exist?}
    end
