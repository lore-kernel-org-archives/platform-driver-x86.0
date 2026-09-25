Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7943BDC8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374918; cv=none; b=NuWJSTxcfi02FSuuFvJ6ePDhlT7KPeNSVoyGMjPaUlfr2vlW/dTeekUMiQMSAspw0LWfoiP/q290OX+MiDVbGpOYsoqfSXLCgQCbbz1XA+8S7SBDGEu+hwKSNSZg8DTG+z7SRFZ72HctzwPMSEyLaTmEDzapYXHY3KdpvYpxudA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374918; c=relaxed/simple;
	bh=PQZNZqFvnaW2qqDQElgml8haB9KqHt6InJg8zFr09kA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Tza6x6b0vb2PAdjVfqA8vVOXOONmtD7hz+gbQquYLd2YyZ0uboLfFV7JsFb2D1OallPunP+wGkKGYTY8kPbFnK3L7LJ74pOnPLJxnWKbgVON7nNmELdScAdpYWn5pyRhdjPDvXUva/0IZqnB7SecSxs98NZ5CjrDMm3DSoByw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhIihxk7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhIihxk7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36BC1C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 22:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790374918;
	bh=PQZNZqFvnaW2qqDQElgml8haB9KqHt6InJg8zFr09kA=;
	h=From:To:Subject:Date:From;
	b=GhIihxk7MOq6h/thA+ihkNg26mnB2gFaSBrU9bg9u68Q9/IE/EQoPpcKQh/2mA4j1
	 vrwwtIXbvFZFf5WMlqBTIos1WhUbUcgtuuFK4ZkiH1gLr7ymBJxdWCj0XZxVBBJA+J
	 zTUzEYG881mPbrBx0howDu3H8FtdM1BEW0UJCtKUhp8JfO8F/LFVo8S08BiOvl4KZT
	 swG7Wg1YoCOs/9p4ARISb+fv1rcbBaY0MjkfO3xVfK1Fy9vYqUoMr824AtflE3YmKQ
	 ioVLjY3zbifpQ9b3AHsGh213Hry4dwLghUjdvwkLSuqO6EJLLGCc8yNhQtgisrYcVt
	 4hUMG8fWneTjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1D93FC4160E; Fri, 25 Sep 2026 22:21:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222062] New: redmi-wmi: display-switch key (F7) dropped on
 Redmi Book Pro 16 2024 - firmware sends payload 0x00000101, keymap only has
 0x00010101
Date: Fri, 25 Sep 2026 22:21:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: uselessfire@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-222062-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222062

            Bug ID: 222062
           Summary: redmi-wmi: display-switch key (F7) dropped on Redmi
                    Book Pro 16 2024 - firmware sends payload 0x00000101,
                    keymap only has 0x00010101
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.2.7 (also 7.2.2 and 7.2.6; mainline keymap unchanged
                    as of 2026-09-26)
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: uselessfire@gmail.com
        Regression: No

Hardware
--------
Xiaomi Redmi Book Pro 16 2024
DMI: sys_vendor XIAOMI, product_name "Redmi Book Pro 16 2024",
     board_name TM2309, bios_version RMAMT6B0P0B0B, bios_date 06/10/2025
Driver: redmi-wmi (WMI GUID 46C93E13-EE9B-4262-8488-563BCA757FEF)

Problem
-------
The dedicated display-switch key (F7, engraved with the external-display ic=
on)
produces no input event at all. Every other hotkey on the same device works:
the settings key (F9) reports KEY_CONFIG, the screenshot key (F8) reports
KEY_SELECTIVE_SCREENSHOT, the "PC Manager" key reports KEY_ASSISTANT.

The firmware on this model emits payload 0x00000101 for the display-switch =
key,
while redmi_wmi_keymap only contains the long form 0x00010101. As a result
sparse_keymap_entry_from_scancode() returns NULL and redmi_wmi_notify() dro=
ps
the event:

  redmi-wmi 46C93E13-EE9B-4262-8488-563BCA757FEF-0: Unknown WMI event with
payload 257

(257 =3D 0x101; the message is visible after enabling dynamic debug for the
module.)

Note that the keymap already carries both the short and the long form for t=
he
settings key -- 0x00001b01 and 0x00011b01 -- so the two-form behaviour of t=
his
firmware is already known to the driver; the display-switch key simply lacks
its
short variant.

How it was verified
-------------------
1) Dynamic debug on the module prints the dropped payload:

   # echo "module redmi_wmi +p" > /sys/kernel/debug/dynamic_debug/control
   (press F7)
   redmi-wmi ...: Unknown WMI event with payload 257

2) A kprobe on the lookup function confirms that no matching entry is found:
   sparse_keymap_entry_from_scancode() is called with 0x101 and
   sparse_keymap_report_entry() is never reached afterwards.

   # echo "p:redmiscan sparse_keymap_entry_from_scancode payload=3D%si:x32"=
 \
       > /sys/kernel/tracing/kprobe_events
   (press F7)
   redmiscan: (sparse_keymap_entry_from_scancode+0x4/0x40) payload=3D0x101
   (no report_entry event follows)

   For comparison, a working key produces both events:
   redmiscan:  payload=3D0x11601
   redmientry: type=3D0x4 scancode=3D0x11601 keycode=3D0

3) The keymap actually exposed by the device (read back with EVIOCGKEYCODE_=
V2
   over /dev/input/event7) contains 0x10101 -> 227 (KEY_SWITCHVIDEOMODE) an=
d no
   0x101 entry.

Suggested fix
-------------
--- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@
        {KE_KEY, 0x00010101,    {KEY_SWITCHVIDEOMODE}},
+       /* Redmi Book Pro 16 2024 sends the short form */
+       {KE_KEY, 0x00000101,    {KEY_SWITCHVIDEOMODE}},


Second, separate observation: unhandled Caps Lock LED echo
----------------------------------------------------------
While tracing, two more payloads showed up that the driver does not know:
0x00000901 and 0x00010901. They are not key presses. The EC echoes back the
Caps Lock LED state that the host itself has just set -- the third byte car=
ries
the new state (1 =3D on, 0 =3D off), the same scheme the driver already doc=
uments
for the Fn Lock events (0x00000701 / 0x00010701).

Verified by switching between windows with per-window keyboard layouts, whi=
ch
changes the LED without anyone touching the key: the events still arrive,
200-500 ms after the LED change, with 0x00010901 when the LED goes on and
0x00000901 when it goes off. On a system where Caps Lock switches the keybo=
ard
layout this produces a steady stream of dev_dbg lines.

The kernel already knows this state (it set it), so these payloads only nee=
d to
be ignored:

+       /* Caps Lock LED echo: the EC reports back the LED state set by the
+        * host (third byte: 1 =3D on, 0 =3D off). Nothing to do for the ke=
rnel.
+        */
+       {KE_IGNORE, 0x00000901, {}},
+       {KE_IGNORE, 0x00010901, {}},


Third, minor: keyboard backlight comment is wrong for this model
---------------------------------------------------------------
The comment above the backlight entries reads "Off / Auto / Low / High".
On this model the cycle is, verified by pressing the key round the loop:

  0x00000501 -> off
  0x00050501 -> dim, switches itself off on the BIOS timer
  0x000a0501 -> bright, switches itself off on the BIOS timer
  0x00800501 -> bright, stays on permanently   (i.e. NOT "auto")

So 0x80 is the always-on state, and the automatic timeout is what 0x05 and =
0x0a
do. The mapping to KEY_KBDILLUMTOGGLE is correct either way; only the comme=
nt
is
misleading. It may well differ on the Redmi Book Pro 15 2023 the driver was
originally tested on.

Maintainers
-----------
REDMIBOOK WMI DRIVERS
M: Gladyshev Ilya <foxido@foxido.dev>
L: platform-driver-x86@vger.kernel.org
F: drivers/platform/x86/redmi-wmi.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
