Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AA2BD5AF
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 04:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759897813; cv=none; b=Kxh7k/j1HchBZz1e6uQ0rsn2wjGLYMdyxV3fQR30Ipz6FMCLBuXdgYevIj+dm42Yma8pLhkFfZAmRwZt+OwtUpweUtJQs7+Dpuc7QCrl3ibx4uK33cy4c5vkKTN1rfJCD3JeqN5LgtT69HhFaO4B4AjgyP/x/XvKWJ9M+oSDdNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759897813; c=relaxed/simple;
	bh=P3iVPXTdZ8CkxV2YB+TJkGgwL2yXml8ljCpnc3qzvDk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gLzdT1G6qlFZeaK1MHYvtO3holhlrZ/Uhk3POSixXd/7KpGjdb3FyEos0CjVAWYovMTu5YmB1EwR3GHbKDMs8cXoJV6dVV2NH3lfcWp4ItBEh2kBn5qTXv15nz9/G3w/ge/DtkOVJlJYQzuJHUN0xB8uCWMbtp6Uvt5r6jkuPig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCsuIJRm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCsuIJRm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0BE0C113D0
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Oct 2025 04:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759897811;
	bh=P3iVPXTdZ8CkxV2YB+TJkGgwL2yXml8ljCpnc3qzvDk=;
	h=From:To:Subject:Date:From;
	b=LCsuIJRmt7O095qI4SBVIUc8XDHH6Ni8MNGSJG13nFQjpZ9pvEeWPzErpR21bhCXe
	 aNhQwHD1n8HP3p5Ns0fzWgpbixUwbABGAM15+LZz7a3BlzuyJJzMuqea6TmGKGjWKb
	 ryr1cILInpvtR7hUQ3hOTXOG98b9MVNdqPjPRdL7SakVGvBFpLEJ3jn6MUxnuRfCNn
	 unS4lotaaJoxacPgeq0tgXfsch8Ys53AFmzoyZT4RexzyrKpNXO46Q5bdhPuGGHds5
	 pecWfbJidTuF4gaC1sCZ2OPQ+FI6K5lSRvTy3ugFk2r4Jdu7mXqk/aX8bmhk2wE/rD
	 M4DDExQH7wqMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0A0DC53BBF; Wed,  8 Oct 2025 04:30:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIE5ldzogW0JVR10gaHAtd21pOiBPTUVOIDE2?=
 =?UTF-8?B?LXdmMHh4eCAoYm9hcmQgOEJBQikg4oCTIGZhbnMgc3R1Y2sgYXQgMCBSUE0s?=
 =?UTF-8?B?IEJvb3N0L1dNSSBxdWVyaWVzIHJlamVjdGVkIChocF93bWk6IHF1ZXJ5IDB4?=
 =?UTF-8?B?NGMgZXJyb3IgMHg2KQ==?=
Date: Wed, 08 Oct 2025 04:30:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: juanm4morales@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-220639-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220639

            Bug ID: 220639
           Summary: [BUG] hp-wmi: OMEN 16-wf0xxx (board 8BAB) =E2=80=93 fan=
s stuck
                    at 0 RPM, Boost/WMI queries rejected (hp_wmi: query
                    0x4c error 0x6)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.16.10-arch1-1
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: juanm4morales@gmail.com
        Regression: No

Created attachment 308774
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308774&action=3Dedit
hp-wmi diagnostics: logs + ACPI tables (OMEN 16-wf0xxx, board 8BAB)

Hardware:
  =E2=80=A2 Laptop: =E2=80=9COMEN by HP Gaming Laptop 16-wf0xxx=E2=80=9D
  =E2=80=A2 DMI board-id: 8BAB
  =E2=80=A2 BIOS: F.28 (2025-07-16)

Software:
  =E2=80=A2 Distro: Arch Linux (Hyprland)
  =E2=80=A2 Kernel: 6.16.10-arch1-1
  =E2=80=A2 power-profiles-daemon installed; platform_profile set to =E2=80=
=9Cperformance=E2=80=9D has
no effect on fans

Problem summary:
  =E2=80=A2 The hp-wmi driver exposes hwmon nodes (name=3Dhp, fan1_input, f=
an2_input,
pwm1_enable) but fans remain at 0 RPM and the =E2=80=9CBoost=E2=80=9D write=
 does nothing.
  =E2=80=A2 Writing =E2=80=9C0=E2=80=9D to pwm1_enable (Boost) immediately =
reverts to =E2=80=9C2=E2=80=9D (auto). No
audible fan ramp; RPMs remain 0.
  =E2=80=A2 dmesg shows: =E2=80=9Chp_wmi: query 0x4c returned error 0x6=E2=
=80=9D.
  =E2=80=A2 /sys/class/thermal/cooling_device[0-4]: type=3DFan, max_state=
=3D1, cur_state
stays at 0.

Expected behavior:
  =E2=80=A2 On HP Omen models with working hp-wmi, =E2=80=9CBoost=E2=80=9D =
(pwm1_enable=3D0) briefly
ramps fans and RPM becomes non-zero; rpm values are readable via sensors
hp-isa-0000. (ArchWiki documents this expected behavior for Omen 16 models.=
)=20

Reproducer:
  1) Boot into 6.16.10 (Arch kernel).
  2) sensors: fan1/fan2 show 0 RPM.
  3) echo 0 > /sys/devices/platform/hp-wmi/hwmon/hwmon*/pwm1_enable
     =E2=86=92 value reverts to 2; no fan ramp; dmesg logs =E2=80=9Chp_wmi:=
 query 0x4c error
0x6=E2=80=9D.
  4) cooling_device[0..4] report Fan (max_state=3D1) but cur_state stays 0.

What I tried:
  =E2=80=A2 Verified AC adapter online.
  =E2=80=A2 Tried platform_profile=3Dperformance and power-profiles-daemon.
  =E2=80=A2 Collected ACPI tables (acpidump -b) and full logs.

Hypothesis:
  =E2=80=A2 This board-id (8BAB) might not be covered by current hp-wmi DMI=
 allow-lists
or uses different HPWMI method IDs on newer firmwares; the firmware rejects
0x4c here. Guidance on traces/patch to test alternate query paths would be
appreciated.

Attachments:
  =E2=80=A2 Tarball with: dmesg, journalctl -b, lsmod, modinfo hp_wmi, sens=
ors, hp-wmi
hwmon listings, cooling devices/thermal zones, dmidecode (serial/UUID
redacted), ACPI tables (acpidump -b).

I=E2=80=99m happy to run debug builds, provide disassembled DSDT/SSDT snipp=
ets around
WMI devices, and test patches. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
