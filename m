Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93019481A82
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 18:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054189; cv=none; b=BC//9z0h0LnJwU+KxKX025ONALklNyCypOQHklPzixewwJxGSlUKFEWw6hAbZ5Zm2NqOAG6dzArLxxc3L1w4e7CxHQLZi1WdJ5i4wwSfGqhQsMKqGr0a2d0HxPqBbNILLQqTkPMxawLdEnqFJvQxziQJlkbclaQ3TKmHygINc9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054189; c=relaxed/simple;
	bh=w73Y5PnzVO+PWSIM6FKTbE3fZmEZ29Q8LH2i7VELi/k=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NpJgXyBjwCv+6fMsTgbbCd11jZoaykGmcWfFV81bauW02IWVmPkXoWyTHdMIsX9B/f+74V+lcscIfcSnT/cDhJJ+FyZ45Bhd3Vy9HTUSmG9L7xoZnk0pFjsp7KLFKJb8KPxSRTast3McEhS0hvaQBsjoDT7am82C6ePfLJxMFZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK9Mw4yn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK9Mw4yn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89268C2BCC9
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784054188;
	bh=w73Y5PnzVO+PWSIM6FKTbE3fZmEZ29Q8LH2i7VELi/k=;
	h=From:To:Subject:Date:From;
	b=dK9Mw4ynh816gw+QmKjCJxcWLWXhyQWHr2ilWGB6+plqrO+MY1HoeM6kUZAgOO55O
	 MjGTJeUxW5XhCgh8Fsa5m0rv5q7SjoGZIsoA4YDjrPdcFrWZGPK38DkxrmOMnsSuL4
	 +j1zvzzLtL7iGA/kV2c5hWisUi4ryWPsaBaJy0oOj8FIHHPQdbXt5QIo5j+4w5hzne
	 tl6UTb5ZKHg23DU+4EslMU6Mno5T++lQ0KhW45fZwjx2rUFxh1z02FOZue+hnLLked
	 SKq3DR3y7dpjfilQ3nzoPD9kiWpA6ZYfPGvRlxO8UwuAp7KLAjrVGJKJ6kZpGmr6FO
	 e0/FvpvjHZRxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FB2FC4160E; Tue, 14 Jul 2026 18:36:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221752] New: asus-wmi: no camera LED classdev registered on
 Zenbook S 14 UX5406SA (micmute LED works)
Date: Tue, 14 Jul 2026 18:36:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plattform@roninmail.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221752-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221752

            Bug ID: 221752
           Summary: asus-wmi: no camera LED classdev registered on Zenbook
                    S 14 UX5406SA (micmute LED works)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: plattform@roninmail.cc
        Regression: No

Created attachment 310450
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310450&action=3Dedit
CLI with information I guessed you might need.

Hardware
ASUS Zenbook S 14, UX5406SA_UX5406SA
BIOS UX5406SA.303, 11/08/2024
Fedora 44, kernel 7.1.3-200.fc44.x86_64, KDE Plasma (Wayland)
Secure Boot enabled (kernel lockdown active)
Description
The Fn camera key correctly toggles the internal camera at the firmware lev=
el:
when disabled, /dev/video0 cannot be opened; when enabled, it streams norma=
lly.
The keypress is delivered to userspace.
However, the camera indicator LED is never driven under Linux. It remains d=
ark
regardless of camera state. The user therefore has a functional privacy tog=
gle
with no working indicator.
Key observation
asus-wmi registers and correctly drives a LED classdev for micmute on this
machine, but registers nothing for the camera:
$ ls /sys/class/leds/
asus::kbd_backlight  platform::micmute  phy0-led
input2::capslock  input2::numlock  input2::scrolllock
input25::*  input28::*  input29::*
Same driver, same EC, same machine =E2=80=94 one indicator is wired up, the=
 other is
not.
Additional data

/sys/class/firmware-attributes/asus-armoury/attributes/ contains only
charge_mode and pending_reboot.
asus-wmi debugfs is unavailable under Secure Boot (lockdown), so
ASUS_WMI_DEVID_CAMERA (0x00060013) could not be probed via DSTS/DEVS.
v4l2-ctl -d /dev/video0 -L reports privacy with flags=3Dread-only, value=3D=
0 =E2=80=94 the
UVC privacy control is not the mechanism in use.

dmesg (asus)
asus_wmi: Initialization: 0x1
asus_wmi: BIOS WMI version: 9.4
asus_wmi: SFUN value: 0x21
asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input15
asus_armoury: No matching power limits found for this system
asus_wmi: fan_curve_get_factory_default (0x00110024) failed: -19
Note: the LED was previously stuck permanently lit; a cold boot cleared it =
and
it has not lit since. This is consistent with a latched EC state and no
kernel-driven LED path in either direction.
Possibly related: the S5406SA (same generation) has a reported asus-wmi iss=
ue
traced to missing LED plumbing (Launchpad #2092283).
Request: register a camera LED classdev for this model, as is done for micm=
ute,
so the camera privacy indicator reflects actual camera state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
