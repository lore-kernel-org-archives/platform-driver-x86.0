Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B96318A6DB
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 02:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791943968; cv=none; b=KdxMZ5RRo8otX5BnQKc85Z4vyuDEFvGfPtVxeJyV26mampI8bYcQ8IX+xymfRz76rd7ITF6SNvd3NhtUeJGCNjqG417hopEdQVeIJzFH3pDmWkuAJuz08jJz1tomjmP1dZp7hzi0S2IxEEaxLtwVvue1Ocuk7NIq2vHsoD2g7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791943968; c=relaxed/simple;
	bh=LVGO1VzHUivZ1PD1/7ag1yZclc+ovnMZvnzdpEFBl9Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nRqxiuBOu8EVOBnC1o2d3w5EoquVYXbkFliqhgpSM9LbaV5XDOpASSvPvk++zwnooIroT6zLleX5slAP2iOFaPAaH+SdLKxJudxmAJvZDTD40PnB/6d7WZPUT0kW/pL6PUlLccaEZQzLkh+u89LMtdUx+q3Qrg2pr7d8d//3Nfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqMi2ap1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqMi2ap1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F064CC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Oct 2026 02:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791943968;
	bh=LVGO1VzHUivZ1PD1/7ag1yZclc+ovnMZvnzdpEFBl9Q=;
	h=From:To:Subject:Date:From;
	b=XqMi2ap1eoQHd16r/Nf6OkG6xnB4ziixi70NFddSBLqIITkNvCsOfGocP1+WYNLHS
	 JBU5ousDq32rcDadtWIKuaGVep6WgqziKcBWfKeN3HgzmllnRCc7+J9AZWjXV7hy+I
	 zP8wShgRbOZ+8AxaOpHFR+aYlP+onFuYDOCL3K6gm6Kc07uucxCMbxXR4NuvV5S9uf
	 onCDr9vw6yBOMsp8uFc69Ly+6kfLhYiE5yZgcfZDUV06cZKP2jlMcXficKfAt2kR1J
	 q1+dYTS/cMBXAENPiBiMZX3CsJwjdn1Usua44INTqL0LG/ea2HVfnjO2UyBmuw5w6r
	 Hnam8IVOpxfIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CB256C4160E; Wed, 14 Oct 2026 02:12:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222128] New: intel-vbtn: HP EliteBook Revolve 810 G3 side
 buttons ignored - INT33D6 has no VBDL method but firmware sends 0xC0-0xCD
 events
Date: Wed, 14 Oct 2026 02:12:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bmelia@atomicmail.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-222128-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222128

            Bug ID: 222128
           Summary: intel-vbtn: HP EliteBook Revolve 810 G3 side buttons
                    ignored - INT33D6 has no VBDL method but firmware
                    sends 0xC0-0xCD events
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: bmelia@atomicmail.io
        Regression: No

Created attachment 311103
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D311103&action=3Dedit
acpidump (MSDM removed)

Hardware: HP EliteBook Revolve 810 G3 (convertible)
BIOS: M86 Ver. 01.22 (05/08/2020) - latest available from HP
Kernel: 7.0.0-30-generic
Distro: KDE neon

Problem:
The side volume buttons and rotation lock switch and tablet mode auto rotat=
e do
nothing. intel-vbtn fails
to bind at boot with:

  intel-vbtn INT33D6:00: failed to read Intel Virtual Button driver

Updating the BIOS from 01.18 to 01.22 did not change this. Booting with
acpi_osi=3D! acpi_osi=3D"Windows 2015" did not help either.

Cause:
The DSDT defines \_SB.VGBI (_HID "INT33D6") with _STA, VGBS, UPBT and GPBT
methods, but no VBDL method. As a result the driver does not detect buttons,
does not enable switches for this machine either, and gives up.

However, the firmware does send the standard virtual button events to this
device:

  Notify (\_SB.VGBI, 0xC0 ... 0xC9)  power, Windows, volume up/down, rotati=
on
lock
  Notify (\_SB.VGBI, 0xCA / 0xCB)    dock / undock
  Notify (\_SB.VGBI, 0xCC / 0xCD)    tablet / laptop mode

Workaround (confirmed working):
Loading this SSDT override through an early initrd adds an empty VBDL metho=
d.
The driver then binds and the side volume buttons work normally:

  DefinitionBlock ("", "SSDT", 2, "HACK", "VBDL", 0x00000001)
  {
      External (\_SB.VGBI, DeviceObj)
      Scope (\_SB.VGBI)
      {
          Method (VBDL, 0, Serialized) { }
      }
  }

Suggested fix:
A DMI quirk for this model so intel-vbtn treats the device as having buttons
even without VBDL, and possibly adding it to dmi_switches_allow_list so the
tablet-mode events (0xCC/0xCD) are reported as well.

Attachment: acpidump-clean.txt (output of "acpidump"; MSDM table removed).
Note: the dump includes my SSDT override ("HACK VBDL"), which adds the empty
VBDL method used as the workaround.

I'm happy to test patches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
