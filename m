Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478580;
	b=vjqKnJ3h8RVse2kp6z2oxTAnnduM77ucNnOyyt8SLQP90fqCQQGxgFwgqv67avivAjse
	 B8ViTPVdsMGK5k3pSp4BMOwh8wi/T+DPiVqxJgtU57aWEDQl7REEpxl+Fyi7lCdPmSrYv
	 Ft+M+4giPgbYkDp4Pi0hRnIWchgPgrKJpTgVPOLdb5xfu2sqRV8ysLeF9/ZQ5B2AcY5eD
	 7T6bH2BSZIY58wFYCRzrHhk4JVmND01L2e9XCxUP/GkTX5lttOA8sskq/KT6qU1w8nTTi
	 L9MoA9KgKag4WvJkrT3yV+Bkoa+jyvIaHzv55nqsceybdJNAbV0x7lqWBfhqR0M12+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478580;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:Content-Type:Content-Transfer-Encoding:X-Bugzilla-URL:
	 Auto-Submitted:MIME-Version;
	bh=HBPbhtlfTNVpITUv7ukalxovhnHnaZIDKTAsvOtWTcI=;
	b=PON9y48EWQMMS4XxEPAHTi4i6VsnP8m7w+/XAqBDee9+TS7AIoTl3Sp81UFFld2flHHr
	 ybJ0Ywi7grmz189AG9nxnhF11O4AhXawcnPZJygDOGbuH36g3wAQFZh7LadtIYjPUivo9
	 XdnSBxpY+b1KDihPEWEYWDvPiPUKOxAxka6/QJYYsZ9e9EREOBQbg0kcZLdKZsO052Z9V
	 pYrzr0/NHiidl4TiUfXfBKD9aj+cmSy5EJFXMsStr1fGHRkaazSTTLVHNlHvj7xL5PfU4
	 TdXPnXXHsjzRrsRLsxAo4cnxUmNW+4FsfdIlHxA9Uus6cd7AIomG/xNp8oBGX8v0koA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNZ2KJlZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97ACE606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNZ2KJlZ
Received: by smtp.kernel.org (Postfix) with ESMTPS id 187241F000EC
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795478580;
	bh=HBPbhtlfTNVpITUv7ukalxovhnHnaZIDKTAsvOtWTcI=;
	h=From:To:Subject:Date;
	b=iNZ2KJlZloLnqvC6yTBzJ22834f/ibYFaKzB2InywMXj3is9+w/Y8G+eE3BTT5a5v
	 tkHp5GuHmYejczhnpRPnsxUcZ7yNWoVMNfsLmdYKzcRgwlUpJTVb3W4palHZ/CMHmn
	 3uSb7AC/2A32nm00HOwXHC27nTT8i1Zq/r3xkxwhdSoqqSu2eg2aOEtGw8QVCNaw5d
	 jdPU09qUpoDoIfUouX9lbaDVi/W+2U4DHqqU/oZ0TMyCZpiG/cP3cEqassfInwTTlH
	 Uc6QSJKvcnCm3K4c2Omfd+HPZDG3xxyW+7hiQbGQMmxXLcZPL6dPHMflUDNS7LFBIv
	 QDd7m05HVWrEw==
Received: by aws-us-west-2-korg-bugzilla-alma10-1.codeaurora.org (Postfix, from userid 48)
	id 12C9B240040D; Tue, 24 Nov 2026 00:03:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222323] New: acer-wmi: WMID set_function_mode(devices=0xFFFF)
 powers off the Atheros AR3012 Bluetooth controller on Acer Extensa 2511G
 before ath3k can upload firmware
Date: Tue, 24 Nov 2026 00:02:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: arthurstarkit@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222323-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D222323

            Bug ID: 222323
           Summary: acer-wmi: WMID set_function_mode(devices=3D0xFFFF)
                    powers off the Atheros AR3012 Bluetooth controller on
                    Acer Extensa 2511G before ath3k can upload firmware
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: arthurstarkit@gmail.com
        Regression: No

Created attachment 311571
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311571&action=3Dedit
Before/after data set: dmesg from the broken boot (acer_wmi loaded - AR3012
disconnects right after "Function bitmap for Communication Button") and from
the working boot (acer_wmi blacklisted - ath3k

luetooth controller on Acer Extensa 2511G before ath3k can upload firmware

Summary
-------
On Acer Extensa 2511G (board BA50_BH) loading acer_wmi removes the on-board
Bluetooth USB device (Foxconn/Atheros AR3012, USB ID 0489:e095) from the USB
bus
within 0.1-2 ms after the "Function bitmap for Communication Button" messag=
e.
At that moment the controller is still in DFU/bootloader mode (bcdDevice 0.=
01,
no USB strings) and ath3k has not been autoloaded yet, so the firmware is n=
ever
uploaded and the machine ends up with no Bluetooth controller at all
(/sys/class/bluetooth is empty, bluetoothctl list is empty, rfkill has no
bluetooth entry). Blacklisting acer_wmi makes Bluetooth work.

Environment
-----------
Distribution:     Linux Mint 22.1 (Ubuntu 24.04 base)
Kernel:           6.8.0-151-generic (Ubuntu)
Machine:          Acer Extensa 2511G, BIOS V1.37 (02/16/2016)
DMI:
  sys_vendor        Acer
  product_name      Extensa 2511G
  product_version   V3.72
  board_name        BA50_BH
  board_vendor      Acer
  bios_version      V1.37
  bios_date         02/16/2016
Wi-Fi (same combo card): Qualcomm Atheros QCA9565/AR9565, PCI 168c:0036
Bluetooth:               USB 0489:e095 on xHCI 0000:00:14.0, port 5
bluez 5.72
linux-firmware 20240318.git3b128b60-0ubuntu3.5 (ar3k/AthrBT_0x*.dfu present)
CONFIG_FW_LOADER_COMPRESS_ZSTD=3Dy

Steps to reproduce
------------------
1. Boot the machine with acer_wmi autoloaded (default; the module matches t=
he
   WMI GUIDs present in ACPI).
2. Observe the kernel log (dmesg):

   [    5.402775] usb 2-5: New USB device found, idVendor=3D0489, idProduct=
=3De095,
bcdDevice=3D 0.01
   [    5.402791] usb 2-5: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D0
   [   21.799726] acer_wmi: Acer Laptop ACPI-WMI Extras
   [   21.799794] acer_wmi: Function bitmap for Communication Button: 0x1
   [   21.856170] usb 2-5: USB disconnect, device number 2

3. Result: no HCI device. lsusb no longer shows 0489:e095, /sys/class/bluet=
ooth
   is empty, "rfkill list" has only acer-wireless and phy0 (WLAN), and
   bluetooth.service is running fine. The Bluetooth controller stays absent=
 for
   the whole uptime, no power cycle of the port brings it back.

Reproduced on every boot since at least 2026-10-28 (5 consecutive boots
checked). Boot-to-boot delay between USB enumeration and the disconnect var=
ies
(9-16 s) but always ends immediately after acer_wmi initializes.

Causality (measured)
--------------------
journalctl -b <n> -k -o short-precise, four different boots:

  boot   acer_wmi: Function bitmap ...      usb 2-5: USB disconnect    delta
  -1     03:43:59.347386                    03:43:59.349530            2.1 =
ms
  -2     03:15:00.769601                    03:15:00.769759            0.16=
 ms
  -3     15:42:23.747630                    15:42:23.747710            0.08=
 ms
  -5     05:38:41.090665                    05:38:41.090854            0.19=
 ms

The printk is the last message of acer_wmi_init() before the driver starts
talking to the EC, and the USB disconnect follows within milliseconds every
single time.


Root cause analysis
-------------------
Relevant code: drivers/platform/x86/acer-wmi.c (v6.8)

1) dmi_walk(type_aa_dmi_decode) reads the OEM DMI type 0xAA structure and
prints
   the bitmap:

       pr_info("Function bitmap for Communication Button: 0x%x\n",
               type_aa->commun_func_bitmap);

   On this machine the bitmap is 0x1, i.e. only ACER_WMID3_GDS_WIRELESS.
   ACER_CAP_BLUETOOTH is therefore not set, no "acer-bluetooth" rfkill is
   registered, and acer_wmi does not consider Bluetooth to exist at all.
   (Consequence: BlueZ has nothing to unblock, and the driver never restores
   the radio state.)

2) Because the WMI GUID 61EF69EA-865C-4BC3-A502-A0DEBA0CB531 (WMID_GUID3) is
   present in /sys/bus/wmi/devices, acer_wmi_init() sets
   ACER_CAP_SET_FUNCTION_MODE and calls acer_wmi_enable_rf_button(), then
   acer_wmi_enable_lm():

       struct func_input_params params =3D {
               .function_num   =3D 0x1,
               .commun_devices =3D 0xFFFF,
               .devices        =3D 0xFFFF,
               .app_status     =3D 0x10,
               .app_mask       =3D 0x10,
       };
       wmid3_set_function_mode(&params, &return_value);  /* GUID3 method 0x=
1 */

   On this firmware/EC that ACPI call makes the EC cut power to the Bluetoo=
th
   part of the AR9565 combo card: the USB device is disconnected immediatel=
y.

3) Race with the Bluetooth driver stack: the AR3012 enumerates in DFU mode
   (bcdDevice 0.01, empty strings) and needs ath3k to upload
   ar3k/AthrBT_0x*.dfu, after which it re-enumerates as bcdDevice 0.02.
   In the broken case ath3k is autoloaded only ~1.2 s after acer_wmi already
   killed the device (dmesg: "usbcore: registered new interface driver ath3=
k"
   comes after the disconnect), so firmware upload never happens.

Note that devices=3D0xFFFF contradicts the DMI type 0xAA bitmap of 0x1 that=
 the
driver itself parsed a few lines earlier.

Possibly related observation: the same machine under Windows 10 also lost
Bluetooth after resume from sleep, and only a full power cycle (battery out)
brought it back - this also points at EC/Bluetooth power handling rather th=
an
at the USB controller or the driver stack.

Workaround (verified)
---------------------
/etc/modprobe.d/acer-wmi-bt-fix.conf:
    blacklist acer_wmi
    install acer_wmi /bin/false
(or: options acer_wmi force_caps=3D0x6 - clears ACER_CAP_SET_FUNCTION_MODE,=
 so
acer_wmi_enable_rf_button()/acer_wmi_enable_lm() are not called, while the
module still loads.)

With acer_wmi not loaded, the same boot sequence becomes:

  [    5.402775] usb 2-5: New USB device found, idVendor=3D0489, idProduct=
=3De095,
bcdDevice=3D 0.01
  [   21.994836] usb 2-5: USB disconnect, device number 2      <- DFU reset=
 by
ath3k
  [   21.995820] usbcore: registered new interface driver ath3k
  [   22.245551] usb 2-5: new full-speed USB device number 5 using xhci_hcd
  [   27.864877] usb 2-5: New USB device found, idVendor=3D0489, idProduct=
=3De095,
bcdDevice=3D 0.02

and the result is a working controller:

  Bus 002 Device 005: ID 0489:e095 Foxconn / Hon Hai
  /sys/class/bluetooth/hci0
  rfkill: 1: hci0: Bluetooth  ("Soft blocked: no / Hard blocked: no")
  bluetoothctl list -> Controller XX:XX:XX:XX:XX:XX <hostname> [default]=20=
=20
(address redacted)

The cost of the workaround is the loss of the acer-wmi extras: the
"acer-wireless" rfkill, the Acer WMI input device (Fn hotkeys such as
KEY_WLAN/KEY_BLUETOOTH) and other acer-wmi functionality.

Suggested fix
-------------
1) Preferred: stop passing 0xFFFF for devices acer_wmi already knows are not
   present. acer-wmi.c keeps the parsed DMI type 0xAA bitmap in
   commun_func_bitmap (0x1 on this machine). Using it instead of 0xFFFF for
   .commun_devices/.devices would restrict the EC write to the devices decl=
ared
   by the firmware; needs confirmation of the EC semantics (the register ma=
y be
   an enable mask, a disable mask, or a "device status" mask).

2) Alternative: a DMI quirk for Acer Extensa 2511G / BA50_BH that clears
   ACER_CAP_SET_FUNCTION_MODE, i.e. skips acer_wmi_enable_rf_button() and
   acer_wmi_enable_lm(). This is exactly what "options acer_wmi force_caps=
=3D0x6"
   does, and it was verified to keep Bluetooth alive on this unit. The modu=
le
   then loads normally and still provides the "acer-wireless" rfkill.
   Caveat: the hotkey/LM side effects of skipping those two calls have to be
   evaluated. On this machine acer_wmi has no other useful capabilities any=
way
   (bitmap 0x1, no platform_profile, backlight handled by i915).

3) Long-term: if the EC can be told to keep BT powered, setting
   ACER_CAP_BLUETOOTH and registering "acer-bluetooth" rfkill would let Blu=
eZ
   re-enable the radio. On this unit the DMI bitmap declares Bluetooth abse=
nt,
   so the EC status register would have to be queried/forced instead.

Other Acer models based on the same board (BA50_BH) or shipped with the AR9=
565
combo card are likely affected by the same EC behaviour; searching for
"Function bitmap for Communication Button: 0x1" + missing Bluetooth may find
more reports.

Attachments (can be provided on request)
----------------------------------------
- dmesg from a broken boot (acer_wmi loaded) and from a working boot
  (acer_wmi blacklisted)
- lsusb -v -d 0489:e095, before and after the firmware upload
- dmidecode output
- DSDT / full ACPI dump - needed to inspect the EC method behind
  WMID GUID3 method 0x1
- kernel .config

Reporter note
-------------
This report comes from a user, not a kernel developer: the root cause was
derived by comparing five boot logs and reading acer-wmi.c, so the proposed=
 fix
should be treated as a hypothesis. The measured part (USB disconnect < 2 ms
after acer_wmi init, on every boot, 100% reproducible) is reliable, and I am
happy to test patches or provide any additional data.

--=20
You are receiving this mail because:
You are watching the assignee of the bug.=
