Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9514A4F0
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 12:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784980923; cv=none; b=KC/Mug/K0+X5OlUwXAW98pl2tUCHf6M3dy8Q6H36kHJ1ewT3Uj+a1qhgNytK1br+3aNlstLF7cfdXw1WmN0baJCx9d3B9sO79rBvFtCZBnlDk6klIy+eb4f8FErBwcK+gQ3wmib0EVoA6LtViSK2hjZEnw4l4p1fwjM8Ye0B6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784980923; c=relaxed/simple;
	bh=NAYcgTnedQ8veJVLmIuOre9RbHocX4+BZE4jh/fmtug=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gf8fOMlK5YSGNHgv4TstV4J7/Tkt84/qGzrtcwUUVWteKyuJ4g/jhWABlOFj6+eeXXFUy/7qtGYrLZuIlRw42ltKRzJ3PBJOiuY4czMimAHmvBN4TQFEBZjh8EZ8Ej4TNl1s4kusg1FPqIrPjOHknPOJYXfl0R5EBR7L7vf/wtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tl3uU03H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tl3uU03H"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1599C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Jul 2026 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784980923;
	bh=NAYcgTnedQ8veJVLmIuOre9RbHocX4+BZE4jh/fmtug=;
	h=From:To:Subject:Date:From;
	b=Tl3uU03H8iWO9a2T1fCVATmsIHneMpZl28CaMt21fLS3rHXhTqpuqg0Wqg8rvFvmS
	 Z1o4KsaI2Ql0fi7eyWFPE8NMw8MHRHNmdO+KE5/sQOsZ22xIMlrGhicTu7HET2B/uc
	 yJoj7zHZ35caUXmG6gkZ6NzF3BHh05o3pvEpwoswlvQDigQn5NJ60mOVhxmV3LqA9X
	 L19CVUfLADO5KyeZguIreYLJdzP4tfXcM6HGeJdpxi6df76Jt8Y3D00C7w/s9T7ZBQ
	 1R+Z0+d2rfOBDq/5AFTG6m27V1KK3ZWEVJZ8bBZ0USy6MdHSHq1Py2bzu2RvLRtW8j
	 iJP2+0YJJCG9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D6A92C3279F; Sat, 25 Jul 2026 12:02:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221789] New: [BUG] Prestige 16 Flip AI+ C3MTG Panther Lake -
 Tablet Mode Switch SW_TABLET_MODE) Not Detected
Date: Sat, 25 Jul 2026 12:02:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: workspace0001@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221789-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221789

            Bug ID: 221789
           Summary: [BUG] Prestige 16 Flip AI+ C3MTG Panther Lake - Tablet
                    Mode Switch SW_TABLET_MODE) Not Detected
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: workspace0001@outlook.com
        Regression: No

Created attachment 310509
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310509&action=3Dedit
output from  "sudo acpidump -o acpi_table.dat"

Subject: [BUG] Prestige 16 Flip AI+ C3MTG Panther Lake - Tablet Mode Switch
SW_TABLET_MODE) Not Detected

Hardware Model:   Micro-Star International Co., Ltd. Prestige 16 Flip AI+ C=
3MTG
Memory:           32.0=C2=A0GiB
Processor:        Intel=C2=AE Core=E2=84=A2 Ultra X7 358H =C3=97 16
Graphics:         Intel=C2=AE Arc=E2=84=A2 B390 (PTL)
Disk Capacity:             (null)

Software Information:
Firmware Version:                         E2622IMS.117
OS Name:                                  Fedora Linux 44 (Workstation Edit=
ion)
OS Build:                                 (null)
OS Type:                                  64-bit
GNOME Version:                            50
Windowing System:                         Wayland
Kernel Version:                           Linux 7.1.4-202.fc44.x86_64


Problem Description:=C2=A0The physical hinge sensor does not broadcast any =
events to
the Linux kernel when the laptop is folded into 360-degree tablet mode.
Built-in keyboard and trackpad remain active, leading to accidental inputs.
Diagnostic Steps Taken:


    1. Checked 'sudo libinput debug-events', which prints no output or swit=
ch
events when the device is flipped.
    2. Checked raw kernel events using 'sudo evtest'. Tested event node "In=
tel
HID events" and "MSI WMI hotkeys". Neither device lists 'Event code 1
(SW_TABLET_MODE)' under supported events, and zero raw event lines are prin=
ted
to the console during physical screen transformation.
Conclusion:=C2=A0The motherboard's ACPI WMI or Embedded Controller (EC) eve=
nt code
for tablet mode is missing or unmapped in the current kernel drivers (intel=
_hid
/ msi_wmi).
    3. I have attached the raw 'acpi_table.dat' dump generated via acpidump=
 to
help trace the missing WMI/EC physical switch events.


SOME OUTPUT THAT COULD BE HELPFULL


sudo evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event0:      Lid Switch
/dev/input/event1:      Sleep Button
/dev/input/event10:     CUST0000:00 04F3:4516 UNKNOWN
/dev/input/event11:     CUST0000:00 04F3:4516 UNKNOWN
/dev/input/event12:     CUST0000:00 04F3:4516 UNKNOWN
/dev/input/event13:     Video Bus
/dev/input/event14:     Intel HID events
/dev/input/event15:     Intel HID 5 button array
/dev/input/event16:     MSI WMI hotkeys
/dev/input/event17:     PC Speaker
/dev/input/event18:     sof-soundwire Headset Jack
/dev/input/event19:     sof-soundwire HDMI/DP,pcm=3D5
/dev/input/event2:      Power Button
/dev/input/event20:     sof-soundwire HDMI/DP,pcm=3D6
/dev/input/event21:     sof-soundwire HDMI/DP,pcm=3D7
/dev/input/event22:     Galaxy Buds2 (841E) (AVRCP)
/dev/input/event3:      AT Translated Set 2 keyboard
/dev/input/event4:      SYNA1514:00 06CB:D022 Mouse
/dev/input/event5:      SYNA1514:00 06CB:D022 Touchpad
/dev/input/event6:      CUST0000:00 04F3:4516
/dev/input/event7:      CUST0000:00 04F3:4516 UNKNOWN
/dev/input/event8:      CUST0000:00 04F3:4516 Stylus
/dev/input/event9:      CUST0000:00 04F3:4516 UNKNOWN
Select the device event number [0-22]: 14
Input driver version is 1.0.1
Input device ID: bus 0x19 vendor 0x0 product 0x0 version 0x0
Input device name: "Intel HID events"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 69 (KEY_NUMLOCK)
    Event code 102 (KEY_HOME)
    Event code 104 (KEY_PAGEUP)
    Event code 107 (KEY_END)
    Event code 109 (KEY_PAGEDOWN)
    Event code 113 (KEY_MUTE)
    Event code 114 (KEY_VOLUMEDOWN)
    Event code 115 (KEY_VOLUMEUP)
    Event code 116 (KEY_POWER)
    Event code 142 (KEY_SLEEP)
    Event code 164 (KEY_PLAYPAUSE)
    Event code 166 (KEY_STOPCD)
    Event code 224 (KEY_BRIGHTNESSDOWN)
    Event code 225 (KEY_BRIGHTNESSUP)
    Event code 240 (KEY_UNKNOWN)
    Event code 247 (KEY_RFKILL)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)
^C




 sudo libinput debug-events
Please look at the camera
-event6   DEVICE_ADDED                 CUST0000:00 04F3:4516             se=
at0
default group1  cap:t  size 332x223mm ntouches 10 calib
-event8   DEVICE_ADDED                 CUST0000:00 04F3:4516 Stylus      se=
at0
default group1  cap:T  size 343x214mm left calib
-event4   DEVICE_ADDED                 SYNA1514:00 06CB:D022 Mouse       se=
at0
default group2  cap:p left scroll-nat scroll-button
-event5   DEVICE_ADDED                 SYNA1514:00 06CB:D022 Touchpad    se=
at0
default group2  cap:pg  size 157x97mm tap (dl off) left scroll-nat
scroll-2fg-edge click-buttonareas-clickfinger dwt-on dwtp-on
-event0   DEVICE_ADDED                 Lid Switch                        se=
at0
default group3  cap:S
-event18  DEVICE_ADDED                 sof-soundwire Headset Jack        se=
at0
default group4  cap:k
-event13  DEVICE_ADDED                 Video Bus                         se=
at0
default group5  cap:k
-event14  DEVICE_ADDED                 Intel HID events                  se=
at0
default group6  cap:k
-event15  DEVICE_ADDED                 Intel HID 5 button array          se=
at0
default group7  cap:k
-event2   DEVICE_ADDED                 Power Button                      se=
at0
default group8  cap:k
-event1   DEVICE_ADDED                 Sleep Button                      se=
at0
default group9  cap:k
-event3   DEVICE_ADDED                 AT Translated Set 2 keyboard      se=
at0
default group10 cap:k
-event16  DEVICE_ADDED                 MSI WMI hotkeys                   se=
at0
default group11 cap:k
-event22  DEVICE_ADDED                 Galaxy Buds2 (841E) (AVRCP)       se=
at0
default group12 cap:k





$ cat /proc/bus/input/devices
I: Bus=3D0019 Vendor=3D0000 Product=3D0005 Version=3D0000
N: Name=3D"Lid Switch"
P: Phys=3DPNP0C0D/button/input0
S: Sysfs=3D/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/PNP0C0D:00/input/inp=
ut0
U: Uniq=3D
H: Handlers=3Devent0
B: PROP=3D0
B: EV=3D21
B: SW=3D1

I: Bus=3D0019 Vendor=3D0000 Product=3D0003 Version=3D0000
N: Name=3D"Sleep Button"
P: Phys=3DPNP0C0E/button/input0
S: Sysfs=3D/devices/platform/PNP0C0E:00/input/input1
U: Uniq=3D
H: Handlers=3Dkbd event1
B: PROP=3D0
B: EV=3D3
B: KEY=3D4000 0 0

I: Bus=3D0019 Vendor=3D0000 Product=3D0001 Version=3D0000
N: Name=3D"Power Button"
P: Phys=3DPNP0C0C/button/input0
S: Sysfs=3D/devices/platform/PNP0C0C:00/input/input2
U: Uniq=3D
H: Handlers=3Dkbd event2
B: PROP=3D0
B: EV=3D3
B: KEY=3D8000 10000000000000 0

I: Bus=3D0011 Vendor=3D0001 Product=3D0001 Version=3Dab83
N: Name=3D"AT Translated Set 2 keyboard"
P: Phys=3Disa0060/serio0/input0
S: Sysfs=3D/devices/platform/i8042/serio0/input/input3
U: Uniq=3D
H: Handlers=3Dsysrq kbd leds event3 rfkill
B: PROP=3D0
B: EV=3D120013
B: KEY=3D40000 20000 0 0 0 101600702900c03 ff80207af250d001 feffffdfffcfffff
fffffffffffffffe
B: MSC=3D10
B: LED=3D7

I: Bus=3D0018 Vendor=3D06cb Product=3Dd022 Version=3D0100
N: Name=3D"SYNA1514:00 06CB:D022 Mouse"
P: Phys=3Di2c-SYNA1514:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-SYNA151=
4:00/0018:06CB:D022.0002/input/input16
U: Uniq=3D
H: Handlers=3Dmouse0 event4
B: PROP=3D0
B: EV=3D17
B: KEY=3D30000 0 0 0 0
B: REL=3D3
B: MSC=3D10

I: Bus=3D0018 Vendor=3D06cb Product=3Dd022 Version=3D0100
N: Name=3D"SYNA1514:00 06CB:D022 Touchpad"
P: Phys=3Di2c-SYNA1514:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.1/i2c_designware.1/i2c-1/i2c-SYNA151=
4:00/0018:06CB:D022.0002/input/input17
U: Uniq=3D
H: Handlers=3Dmouse1 event5
B: PROP=3D5
B: EV=3D1b
B: KEY=3De520 10000 0 0 0 0
B: ABS=3D2e0800000000003
B: MSC=3D20

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input19
U: Uniq=3D
H: Handlers=3Dmouse2 event6
B: PROP=3D2
B: EV=3D1b
B: KEY=3D400 0 0 0 0 0
B: ABS=3D32f3800000000003
B: MSC=3D20

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 UNKNOWN"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input20
U: Uniq=3D
H: Handlers=3Devent7
B: PROP=3D0
B: EV=3D9
B: ABS=3D10000000000

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 Stylus"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input21
U: Uniq=3D
H: Handlers=3Dmouse3 event8
B: PROP=3D2
B: EV=3D1b
B: KEY=3D1c03 0 0 0 0 0
B: ABS=3D1000d000003
B: MSC=3D11

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 UNKNOWN"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input23
U: Uniq=3D
H: Handlers=3Devent9
B: PROP=3D0
B: EV=3D9
B: ABS=3D10000000000

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 UNKNOWN"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input24
U: Uniq=3D
H: Handlers=3Devent10
B: PROP=3D0
B: EV=3D9
B: ABS=3D10000000000

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 UNKNOWN"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input25
U: Uniq=3D
H: Handlers=3Devent11
B: PROP=3D0
B: EV=3D9
B: ABS=3D10000000000

I: Bus=3D0018 Vendor=3D04f3 Product=3D4516 Version=3D0100
N: Name=3D"CUST0000:00 04F3:4516 UNKNOWN"
P: Phys=3Di2c-CUST0000:00
S:
Sysfs=3D/devices/pci0000:00/0000:00:19.0/i2c_designware.0/i2c-0/i2c-CUST000=
0:00/0018:04F3:4516.0003/input/input26
U: Uniq=3D
H: Handlers=3Devent12
B: PROP=3D0
B: EV=3D1b
B: KEY=3D1 0 0 0 0
B: ABS=3D10000000000
B: MSC=3D10

I: Bus=3D0019 Vendor=3D0000 Product=3D0006 Version=3D0000
N: Name=3D"Video Bus"
P: Phys=3DLNXVIDEO/video/input0
S: Sysfs=3D/devices/pci0000:00/acpi.video_bus.0/input/input28
U: Uniq=3D
H: Handlers=3Dkbd event13
B: PROP=3D0
B: EV=3D3
B: KEY=3D3e000b00000000 0 0 0

I: Bus=3D0019 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"Intel HID events"
P: Phys=3D
S: Sysfs=3D/devices/platform/INTC10CC:00/input/input29
U: Uniq=3D
H: Handlers=3Dkbd event14 rfkill
B: PROP=3D0
B: EV=3D13
B: KEY=3D81000300000000 5000004000 1e294000000020 0
B: MSC=3D10

I: Bus=3D0019 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"Intel HID 5 button array"
P: Phys=3D
S: Sysfs=3D/devices/platform/INTC10CC:00/input/input30
U: Uniq=3D
H: Handlers=3Dkbd event15
B: PROP=3D0
B: EV=3D13
B: KEY=3D2000000000000 0 0 0 0 1000000000000 0 201c000000000000 0
B: MSC=3D10

I: Bus=3D0019 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"MSI WMI hotkeys"
P: Phys=3Dwmi/input0
S: Sysfs=3D/devices/virtual/input/input31
U: Uniq=3D
H: Handlers=3Dkbd event16
B: PROP=3D0
B: EV=3D13
B: KEY=3D1000300000000 300000 e000000000000 0
B: MSC=3D10

I: Bus=3D0010 Vendor=3D001f Product=3D0001 Version=3D0100
N: Name=3D"PC Speaker"
P: Phys=3Disa0061/input0
S: Sysfs=3D/devices/platform/pcspkr/input/input32
U: Uniq=3D
H: Handlers=3Dkbd event17
B: PROP=3D0
B: EV=3D40001
B: SND=3D6

I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"sof-soundwire Headset Jack"
P: Phys=3DALSA
S: Sysfs=3D/devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input33
U: Uniq=3D
H: Handlers=3Dkbd event18
B: PROP=3D0
B: EV=3D23
B: KEY=3D40 0 0 0 0 0 0 1000000000 c000000000000 0
B: SW=3D14

I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"sof-soundwire HDMI/DP,pcm=3D5"
P: Phys=3DALSA
S: Sysfs=3D/devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input34
U: Uniq=3D
H: Handlers=3Devent19
B: PROP=3D0
B: EV=3D21
B: SW=3D140

I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"sof-soundwire HDMI/DP,pcm=3D6"
P: Phys=3DALSA
S: Sysfs=3D/devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input35
U: Uniq=3D
H: Handlers=3Devent20
B: PROP=3D0
B: EV=3D21
B: SW=3D140

I: Bus=3D0000 Vendor=3D0000 Product=3D0000 Version=3D0000
N: Name=3D"sof-soundwire HDMI/DP,pcm=3D7"
P: Phys=3DALSA
S: Sysfs=3D/devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input36
U: Uniq=3D
H: Handlers=3Devent21
B: PROP=3D0
B: EV=3D21
B: SW=3D140

I: Bus=3D0005 Vendor=3D0075 Product=3Da013 Version=3D0001
N: Name=3D"Galaxy Buds2 (841E) (AVRCP)"
P: Phys=3D34:fd:70:38:df:05
S: Sysfs=3D/devices/virtual/input/input41
U: Uniq=3D
H: Handlers=3Dkbd event22
B: PROP=3D0
B: EV=3D3
B: KEY=3D2fc800 145200000000 0 10300 49e800000c00 e16800000000f f8100000100=
00ffc

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
