Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1E1CEADB
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 00:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767574138; cv=none; b=I33czvBg2w8VySgd3oGqqkF73nkZkSxfeZhmPcBrLpCEWMlCFuQZZFTWjA8Bfogb51O7+ooDzyc+Q3aJR4uBgFcqnKH5IkUnuzRnRYRXaEtQ6gGN0gTMN0hP8/BuvEvKufYVfp/hidBoAKU8nqDMrIK/wkJUs54fvBT63+5JAm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767574138; c=relaxed/simple;
	bh=JfU3CvaEacRIbgBSBFuor8g9DGHKh1t1BN0LrbYQZQQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=M9SDSsr3reFQzKagr994rfWNLNGTXt3+gpXzmN9PC11a0FZ/9MTy9YXohMB1kh2feBFy+jA93aFP04vIW2QvhoOcDQRWuP8D397RMQOooi/0oIbZZ34YQh5FnnuGej2/zLTEugLxOtKtUgG/dghMdmxy/Xl/8hMhriIcjLc2LQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT12jIxx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT12jIxx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 980F5C19424
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 00:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767574137;
	bh=JfU3CvaEacRIbgBSBFuor8g9DGHKh1t1BN0LrbYQZQQ=;
	h=From:To:Subject:Date:From;
	b=YT12jIxxYrSmWRQ/bgQGucNf+VcCviJmxw2K1iuhvB9t33+6Ew1txJ8QRzTF+JsmX
	 zp4ThXVR+wTSCCcHW/1lZLQF9m2AvxmqkMcll/wk/BXTe9wvWajNA+Zz5q0Pgr+HYc
	 oefT8oMMtgXChUmJXnUjkhSo7MCX2ESm9FLeLOxuPgUmnMjX2hAmtMPC5O6GJV3wKZ
	 2YyYlyPPbD2r23WhoBksxdHIaOtJ1htzjuEapR9Vd38+tVEKhSISigvqvMUW28G2Bb
	 nNDyqWa1tNUO0rQekeUvo+C1ZULmiOikggPt8EUzGqXHurKLho5ynZzWem7XMdwCIN
	 HZB729EnEpk1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8C7A4C41614; Mon,  5 Jan 2026 00:48:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220945] New: ASUS Q405UA requires tablet_mode_sw=2 for proper
 tablet mode detection
Date: Mon, 05 Jan 2026 00:48:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.r.blank@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-220945-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220945

            Bug ID: 220945
           Summary: ASUS Q405UA requires tablet_mode_sw=3D2 for proper
                    tablet mode detection
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.17.12-300.fc43.x86_64
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andy.r.blank@gmail.com
        Regression: No

Created attachment 309126
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309126&action=3Dedit
Terminal output for uname, dmidecode, dmesg, input devices, & evtest

The ASUS Q405UA 2-in-1 convertible laptop does not properly expose the
SW_TABLET_MODE switch with the default tablet_mode_sw=3D-1 (auto-detect) se=
tting
in the asus-nb-wmi driver.
DMI Information: Product Q405UA, Board Q405UA, BIOS Q405UA.308, Chassis Typ=
e 31
(Convertible)
CURRENT BEHAVIOR: With default settings (tablet_mode_sw=3D-1), no SW_TABLET=
_MODE
switch is exposed. The Embedded Controller (EC) correctly disables the keyb=
oard
when folding past 180 degrees. KEY_PROG2 events are generated on hinge
transitions via /dev/input/event14 (Asus WMI hotkeys). Touchpad remains act=
ive
in tablet mode because no tablet mode switch is available for userspace.
EXPECTED BEHAVIOR: SW_TABLET_MODE switch should be automatically exposed.
Tablet mode state should change when laptop is folded past 180 degrees.
Userspace (libinput/KDE/GNOME) should be able to automatically disable touc=
hpad
in tablet mode.
WORKAROUND: Setting tablet_mode_sw=3D2 (lid-flip detection) in the asus-nb-=
wmi
module parameters properly exposes the SW_TABLET_MODE switch and resolves t=
he
issue. Create /etc/modprobe.d/asus-nb-wmi.conf with: options asus_nb_wmi
tablet_mode_sw=3D2
PROPOSED SOLUTION: Add a DMI quirk for the ASUS Q405UA to automatically set
tablet_mode_sw=3D2, similar to other models in the asus-nb-wmi driver
(drivers/platform/x86/asus-nb-wmi.c).
SYSTEM INFORMATION: Model ASUS Q405UA, Kernel 6.17.12-300.fc43.x86_64,
Distribution Fedora 43
DRIVER MESSAGES (from dmesg): asus_wmi: ASUS WMI generic driver loaded,
asus_wmi: Initialization: 0x1, asus_wmi: BIOS WMI version: 9.0, asus_wmi: S=
FUN
value: 0x21, asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS,
input: Asus WMI hotkeys as /devices/platform/asus-nb-wmi/input/input20
TESTING RESULTS: With tablet_mode_sw=3D2 configured, evtest shows Event cod=
e 1
(SW_TABLET_MODE) is present. Switch state correctly toggles between 0 (lapt=
op)
and 1 (tablet) when folding. libinput debug-events shows proper SWITCH_TOGG=
LE
events. Touchpad automatically disables in tablet mode as expected.
ADDITIONAL NOTES: The EC already tracks hinge position (evidenced by automa=
tic
keyboard disabling). KEY_PROG2 events fire on hinge transitions but are
insufficient for userspace to properly detect tablet mode. Other ASUS 2-in-1
models with similar behavior may also benefit from this quirk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
