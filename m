Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAA11A9FA8
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761754689; cv=none; b=WUjrE+T/JaIaOcvDWo/fUknfDq9Kl6b00rYZTvO4R2rPvmvlockygqbBWks2MUaWbrQqYcleV8fUJuzugBdt5s60abR+sdbWu/Tla4iGmZFJFvEAt+NLau8fNi4c1KzeCPTIuppbz1UYq8Hr2YS6t5Zw3UeGpaJTPscYvyOCmjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761754689; c=relaxed/simple;
	bh=A+yTSkxC6qVtJnfPR2Hb1cb+auWoXpY+xPO/lhqlcfI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rov7VNLwWWRjWadslqOpWI/6j3CuLjRL6fHdmqqCFgrL7XmJ5nYjD1pwcWWbdTGKJu9Lkc/+njIhO7fJ3dFj4ZATqsaGblqFG8NCB8Vw+VvBj99PtY/lzylcuo8itLzHFrPkfQFRXAqPF9BEqNHSSMlDjJF/xBWgWL4Qo391JB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDNq37um; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDNq37um"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BBAAC4CEF8
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Oct 2025 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761754689;
	bh=A+yTSkxC6qVtJnfPR2Hb1cb+auWoXpY+xPO/lhqlcfI=;
	h=From:To:Subject:Date:From;
	b=cDNq37umWizYhG44Qm/SLNDJtaiInJxsPCGScDcaTfPzsQScpzSl7yXO+5mTulnzp
	 MTbfVnogplCeI/1zoiDPN1ISup6IB1w3uisdt8UzVBITyflXdyVbnisAC4iJS4Wqdj
	 VJcGs+LgzWxuYQL4GQ9eF6cEia8llIOuQcIg0JItanD4qtaayCxTa3eb8fdf2RUQSu
	 I5r2QSnU9QtK7PDZefTVt7z7IalS53aloy5O+F1E08T6NOFxWrNow2RgJcf7Id3Umk
	 vXQMW6mV64DzIoA6wrolJjdEk3RksMDhdVQdTnEIscZq1TTiy1omUy6qSoQEa9FahU
	 VPxcIvZKX+GYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0F8AAC433E1; Wed, 29 Oct 2025 16:18:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] New: Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Wed, 29 Oct 2025 16:18:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

            Bug ID: 220722
           Summary: Non existent battery reporting for a laptop with
                    touchscreen MSI
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andretiagob@protonmail.com
        Regression: No

Created attachment 308869
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308869&action=3Dedit
Battery charge information

This issue is similar to this bug report:=20
https://bugzilla.kernel.org/show_bug.cgi?id=3D216747

The same issue was filed in the upower gitlab page by another user:
https://gitlab.freedesktop.org/upower/upower/-/issues/197


SUMMARY
The laptop touch screen always reports a non existent battery with a charge
level of 0% (see attachment). I had this issue for a long time and it is al=
ways
present regardless of kernel versions, older and newer, and on different
distributions.=20
The device in question is called: ELAN Touchscreen Stylus.


I first issued this bug on the upower gitlab page:=20
https://gitlab.freedesktop.org/upower/upower/-/issues/329


From what I've been told this might be an issue with some driver in the ker=
nel.
Here's some information that might be useful:


Device:/org/freedesktop/UPower/devices/battery_hid_0003o04F3o2FFAx0001_batt=
ery
  native-path: hid-0003:04F3:2FFA.0001-battery
  model:                ELAN Touchscreen Stylus
  power supply:         no
  updated:              qui 01 jan 1970 01:00:00 (1761601761 seconds ago)
  has history:          yes
  has statistics:       yes
  tablet
    warning-level:       none
    percentage:          0%
    icon-name:          'battery-missing-symbolic'

---------------------------------------------------------------------------=
----

andre@fedora:~$ upower -e
/org/freedesktop/UPower/devices/battery_BAT
/org/freedesktop/UPower/devices/battery_hid_0003o04F3o2FFAx0002_battery
/org/freedesktop/UPower/devices/line_power_ADP1
/org/freedesktop/UPower/devices/DisplayDevice

---------------------------------------------------------------------------=
----

andre@fedora:~$ ls
/sys/devices/pci0000:00/0000:00:14.0/usb3/3-8/3-8:1.0/0003:04F3:2FFA.0002/p=
ower_supply/hid-0003:04F3:2FFA.0002-battery=20
capacity =C2=A0extensions =C2=A0model_name =C2=A0power =C2=A0=C2=A0present =
=C2=A0status =C2=A0=C2=A0=C2=A0=C2=A0type =C2=A0=C2=A0=C2=A0wakeup48=20
device =C2=A0=C2=A0=C2=A0hwmon4 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0online =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0powers =C2=A0scope =C2=A0=C2=A0=C2=A0subsystem =C2=
=A0uevent\

---------------------------------------------------------------------------=
----

andre@fedora:~$ udevadm info
/sys/devices/pci0000:00/0000:00:14.0/usb3/3-8/3-8:1.0/0003:04F3:2FFA.0002/p=
ower_s
upply/hid-0003:04F3:2FFA.0002-battery=20
P:
/devices/pci0000:00/0000:00:14.0/usb3/3-8/3-8:1.0/0003:04F3:2FFA.0002/power=
_supply/hid-0003:04F3:2FFA.0002>=20
M: hid-0003:04F3:2FFA.0002-battery=20
J: +power_supply:hid-0003:04F3:2FFA.0002-battery=20
U: power_supply=20
T: power_supply=20
E:
DEVPATH=3D/devices/pci0000:00/0000:00:14.0/usb3/3-8/3-8:1.0/0003:04F3:2FFA.=
0002/power_supply/hid-0003:04F3:2>=20
E: SUBSYSTEM=3Dpower_supply=20
E: DEVTYPE=3Dpower_supply=20
E: POWER_SUPPLY_NAME=3Dhid-0003:04F3:2FFA.0002-battery=20
E: POWER_SUPPLY_TYPE=3DBattery=20
E: POWER_SUPPLY_STATUS=3DUnknown=20
E: POWER_SUPPLY_PRESENT=3D1=20
E: POWER_SUPPLY_ONLINE=3D1=20
E: POWER_SUPPLY_CAPACITY=3D0=20
E: POWER_SUPPLY_SCOPE=3DDevice=20
E: POWER_SUPPLY_MODEL_NAME=3DELAN Touchscreen


Currently I'm using KDE Linux with kernel version 6.17.5.
This is an MSI Summit E16 laptop with a convertible touch screen (A12UCT mo=
de).
I don't have any stylus pen that could be sending the wrong battery
information.


Any help is appreciated,

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
