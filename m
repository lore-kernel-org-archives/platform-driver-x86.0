Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B84131A813
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 01:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768960218; cv=none; b=iqsSzvPXBNzzRb85ABl17UcvRxBxof1rUxVzvlkVABiLvqOMmyhdrBfz5vqKudCO1Ki6F+3VdGIppJFroyKwiV764a3rtE/Y3REU/hH3JYWHeqq5hAvEMGileIqFZjyheya5CX62hPnhpDapwxO3Y0eZVWARWx2ovviUvbxSNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768960218; c=relaxed/simple;
	bh=Thfnk7hhLKAH4QnFmRTMBcAqf5B0i4FHVNL/1qlV5+g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YQwamSa15cXXVrfy4Q2ns3lRMqmmmqdZL5Fx6erVhpuxtMrU1A72GpNUmftyn676V6G1ZGc5ihbyocJliBqOXZZG+W3962GSrQ4Ifr1rTzFwVuTyv/ZHGhHYT1oCz/wPntUZ6sHPEMnu0+MSsaQoGfNoIybGpKMJRYx5atrWCVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYKVkAtY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYKVkAtY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB8CEC19425
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jan 2026 01:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768960217;
	bh=Thfnk7hhLKAH4QnFmRTMBcAqf5B0i4FHVNL/1qlV5+g=;
	h=From:To:Subject:Date:From;
	b=eYKVkAtY8mePPRb2yw9nIX1RmpNhod9owXG2+aXHMuJmEk/CRz2cZKGe7UKmPNfCD
	 THu/y0ygViM9cIWoJv8YQu/wKsKOLqnLvU3RNQHkyV5VBCNR77icFYGuP+PGkHybKM
	 7Z+BrlTZjk6AKD6OXYHAoO5CYYdAbzgROSWNtTrr6ImmT947/AMwDRCnGzN7VAQTbI
	 btkzOr4CX1qWh8bxqPOH2/79jONSWWJwaMY2riP//BGxF6z/9UMP/UxtZxoAnp7KuX
	 tcOXf75YHgBqO4AhqyCfOPi5YBSt66CoyZDDrHDUVV7Mg/VWp2m4nRYIwuCCrFEMnt
	 R6orDud57noog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C21F1C41616; Wed, 21 Jan 2026 01:50:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220999] New: ASUS ExpertBook B1402CVA: Keyboard backlight
 brightness range incorrect (max=3, dim light)
Date: Wed, 21 Jan 2026 01:50:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: stefano.pascale04@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220999-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220999

            Bug ID: 220999
           Summary: ASUS ExpertBook B1402CVA: Keyboard backlight
                    brightness range incorrect (max=3D3, dim light)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: stefano.pascale04@gmail.com
        Regression: No

Created attachment 309219
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309219&action=3Dedit
output of `dmidecode`

Hardware: ASUS ExpertBook B1402CVA
Kernel Version: 6.18.5-200.fc43.x86_64 (Fedora Rawhide)
CPU: 12 =C3=97 13th Gen Intel=C2=AE Core=E2=84=A2 i5-1335U

Description:
The keyboard backlight on this laptop is not working correctly with the
asus-wmi driver.
The system detects a `max_brightness` of 3. When setting brightness to 3, t=
he
keyboard lights up but only at a very dim level (barely visible). Setting i=
t to
1 or 2 turns it off completely.

It appears the hardware expects a range of 0-255 (or similar high value), b=
ut
the driver is limiting it to 0-3, possibly due to a missing quirk for this
specific model ID in the WMI driver.

Here is the sysfs output confirming the issue:

$ grep . /sys/class/leds/asus::kbd_backlight/*
/sys/class/leds/asus::kbd_backlight/brightness:0
/sys/class/leds/asus::kbd_backlight/brightness_hw_changed:0
/sys/class/leds/asus::kbd_backlight/max_brightness:3
/sys/class/leds/asus::kbd_backlight/trigger:[none] usb-gadget usb-host
rc-feedback kbd-scrolllock kbd-numlock kbd-capslock ... (truncated)

Steps to reproduce:
1. Boot Fedora 43 (Kernel 6.18).
2. Check /sys/class/leds/asus::kbd_backlight/max_brightness (Output is 3).
3. Set brightness to 3 (echo 3 | sudo tee ...). Result: Very dim light.

Troubleshooting attempted:
1. Tried boot param `acpi_osi=3D` and `acpi_osi=3D"Windows 2020"` -> No cha=
nge.
2. Tried `acpi_backlight=3Dnative` -> No interface created.
3. Tried `asusctl` -> Failed to set higher values.
4. Manually echoing values > 3 into 'brightness' -> No change.

Attached is the output of `dmidecode`.

I suspect this model needs a quirk in `drivers/platform/x86/asus-wmi.c` to
enable the correct brightness range.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
