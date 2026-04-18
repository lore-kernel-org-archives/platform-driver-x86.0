Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A9E26056C
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776519517; cv=none; b=sYPrHU+26/OB2TxTw3S+CZPcZWi99Zdd2RNFSUe+pHuQG9pAX+ddqfZgT1/wjLQrqiC82w8FgwDBp5d/8tHhJm+9aeNJSf2XeF0494fDeX1x99cvaQuauqLM4OXhMzqgL88F8uTNkY/H7OvkTa8JEo8NMp3HAcGpPXcD2OON6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776519517; c=relaxed/simple;
	bh=g4EWhkoV3W6Rnmy7B5NtgcRtpuFDsGR3hCMzbTmC2iw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nVZyqoQKtWU28XALmtuGILMEO3RZmX3R5l2c6gy6kHPn+uCNEqSJN8oRY580T7zkUKUQjYNtVqsa36Dzh3Q7uIqBfcJdnjSKMjtd08HYN/rfUKi/APSp41t2Z6/kdhy73fkD8wUpBlDbJPAG1G6yzsDt7nbTZHYYNH+0NeOJrsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJ2JGuB1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJ2JGuB1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B51DC19424
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Apr 2026 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776519517;
	bh=g4EWhkoV3W6Rnmy7B5NtgcRtpuFDsGR3hCMzbTmC2iw=;
	h=From:To:Subject:Date:From;
	b=sJ2JGuB1kFnsnDvxi3xMN9pRiiVnsCfKZbPXbdOj47hVEqaUO8YwMLQOfTdXuylYx
	 kQ+tkwZFFB5N6teZontcpQPEDZ9rLzHaWP9Vz6UPEyG6kqsuvzhvjP9u07Khu1YqL2
	 nenzipznLf9VKgNp+PWq8RazNi8ue+amMfOMHJRl/Lru1d5LMoQnjVxotDZwO+nzF+
	 sMR3w1ms96Q4yQl6lUbxEm+uhv7+NFZxQ6vbcA5bKYjLUSBTfDdI68qfNrRIsvTj5v
	 sRxgJCROmMgDnb0z5VYQHD4ar0E1zr2X9eJkUdlPFHKSDBaysVRcuCJuqGilaY5o9N
	 PmddLYZcAjFHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EA43C3279F; Sat, 18 Apr 2026 13:38:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] New: ideapad_laptop: Fn hotkeys stop emitting after
 s2idle resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Sat, 18 Apr 2026 13:38:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sindrehenriksen93@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

            Bug ID: 221383
           Summary: ideapad_laptop: Fn hotkeys stop emitting after s2idle
                    resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: sindrehenriksen93@gmail.com
        Regression: No

Created attachment 309895
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309895&action=3Dedit
dmesg after cold boot (working state)

Kernel version: 6.17.0-19-generic (Ubuntu 24.04.4 LTS HWE; upstream 6.17.13)

Hardware:
  Vendor:  LENOVO
  Product: IdeaPad Slim 3 14ARP10 (MTM 83K6 / board LNVNB161216)
  CPU:     AMD Ryzen 7 7735HS (Rembrandt)
  BIOS:    QBCN29WW (2026-01-15, latest available from Lenovo)

Distribution: Ubuntu 24.04.4 LTS

Loaded drivers: ideapad_laptop, lenovo_wmi_other, lenovo_wmi_helpers,
                lenovo_wmi_capdata01, lenovo_wmi_hotkey_utilities,
                sparse_keymap, platform_profile

Background:
  BIOS HotKey Mode is ON =E2=80=94 pressing an Fx key produces the media ac=
tion
  by default; Fn+Fx gives the raw function key. In normal operation,
  the media keys are emitted on multiple input devices depending on the
  function:
    * /dev/input/event2 ("AT Translated Set 2 keyboard"):
        KEY_VOLUMEUP / KEY_VOLUMEDOWN / KEY_MUTE
    * /dev/input/event5 ("Video Bus"):
        KEY_BRIGHTNESSUP / KEY_BRIGHTNESSDOWN
    * /dev/input/event6 ("Ideapad extra buttons"):
        KEY_F20 (mic mute, scancode 0x08), KEY_RFKILL (airplane, 0x0d),
        touchpad toggle, etc.

Steps to reproduce:
  1. Boot. Verify media keys work =E2=80=94 all of brightness, volume, mic-=
mute,
     airplane-mode change system state when their Fx key is pressed.
  2. Suspend (s2idle). Resume after a longer idle period (short
     suspend/resume cycles do not reliably trigger the bug; in my
     experience ~15 min or more does).
  3. Press any media key.

Expected:
  System reacts as before suspend. KEY_* events are emitted on their
  respective input devices.

Actual:
  No media key does anything. Diagnostics:
    * evtest --grab /dev/input/event6: zero KEY events for any Fx press
      (confirmed via exclusive grab).
    * evtest /dev/input/event2: pressing what should be the volume-up
      key (Fx with the volume-up label) emits plain KEY_F3 (scancode
      0x3f). KEY_F1..KEY_F12 emit for the corresponding Fx positions.
      The EC is no longer translating Fx to media keycodes; it is
      forwarding raw scancodes to i8042.
  The Fn modifier is effectively a dead key =E2=80=94 Fn+Fx and Fx produce =
the
  same output.

dmesg observations in broken state (attached):
  * "atkbd serio0: Failed to deactivate keyboard on isa0060/serio0"
    appears on each suspend.
  * ACPI BIOS errors at boot: AE_NOT_FOUND [\_SB.PCI0.GPP7.DEV0],
    AE_ALREADY_EXISTS [\_TZ.TZ01] (possibly unrelated, included for
    completeness).

Does not resolve the issue (all tested on this machine):
  - Writing 0 or 1 to
    /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/fn_lock
    (the fn-lock LED toggles, but event emission is unchanged).
  - rmmod/modprobe of ideapad_laptop and lenovo_wmi_hotkey_utilities.
  - Kernel parameters reported as failing by other affected users on
    the same hardware family: i8042.reset=3D1, i8042.nopnp,
    acpi.prefer_microsoft_guid=3D1.
  - Latest available BIOS (QBCN29WW, 2026-01-15).

Resolves: reboot. EC state re-syncs on cold start and media keys work
again until the next s2idle resume past the threshold.

Related user reports on the IdeaPad Slim 3 Ryzen family with the same
symptom:
  https://bbs.archlinux.org/viewtopic.php?id=3D310124
=20
https://discussion.fedoraproject.org/t/fn-keys-stop-working-after-sleep-on-=
lenovo-ideapad-slim-3/95528
  https://bugs.launchpad.net/ubuntu/+bug/2114256

Attached:
  - fn-broken-dmesg.txt  =E2=80=94 dmesg spanning broken (post-resume) state
  - fn-working-dmesg.txt =E2=80=94 dmesg after cold boot (working state)
  - fn_lock-working.txt  =E2=80=94 fn_lock value in working state
  - evtest-working.txt   =E2=80=94 evtest on /dev/input/event6 showing mic-=
mute
                           (KEY_F20) and airplane (KEY_RFKILL) emitting
                           correctly
  - acpidump.bin         =E2=80=94 ACPI tables (acpica-tools acpidump)

Happy to test patches, bisect, or provide additional logs (e.g.
working-state captures on event2/event5, dynamic_debug traces of
ideapad_laptop suspend/resume paths, dmesg with `no_console_suspend`).
Let me know what's most useful.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
