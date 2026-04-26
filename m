Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6DB264614
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777226427; cv=none; b=uq+XnwnObVF8Ho25xEdWphjNnY9X5/0MJkU+TP+WhFL6bHScZ5hVSnpSbNBsCfN1eaXkpf9a0GvH4KumdgTI9BZqzyvEDq3QAn1o12wQwLj1oK9iWGqbfpmuLekCTs90udVmPfMrp1teRgPO0Rjh4O6ZLz4Q03sRaabHl0ZLJ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777226427; c=relaxed/simple;
	bh=s9N2WSOm9XS1FKZmdXtmSbzE2rM3hgwiiHMufdPoZ7E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ks6cHzdgVz5Ksw15+11y2qrxFko2N0Oir/d/zbdA9ERyT3Rqxa1Bgl3+F544sIXYkzEEU4VX4xAPUBO93fKnkQ5ugL6mysRvkbS4q85ibpIGCJlnwORYtnR9tX9rn7EPIGnTmlNiJMH9M6itLbXN9QY0oYEi8qVOZ/YJJrb5F6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twizyv+B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twizyv+B"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74F25C2BCAF
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777226427;
	bh=s9N2WSOm9XS1FKZmdXtmSbzE2rM3hgwiiHMufdPoZ7E=;
	h=From:To:Subject:Date:From;
	b=twizyv+B/6n1sGSVMP6vpiqdRCdFE/R6xrtJcDk2bdA3JhvWPbEkwWmjeO4jKuTTH
	 7SScgdZVpOc2YmIuKV+evLzwIKbuWTS1sp2qcWr5ofiAfGBS70uvuJErvAk6I4wOHJ
	 7xWh1PdYy1UNFpY/vho50Ed5S0I83PMPh1mKiVY2RkF1Luep2nutwq2O0HID0Q6bah
	 CovMiVrBH5PEIHLnfXjkso8qUAHSUBc/KrchcGEtKSizab4ECJShf7XqWed5KvbmVW
	 gfOO5A8CjhlTLdtnb9IOcHh4suuoEZFNyb1FmHSe92sVZ7oldPtNWATtIkBSCULQVy
	 ztzrASh4JPLhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 65AE4C433E1; Sun, 26 Apr 2026 18:00:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] New: ideapad-laptop: brightness keys require continuous
 VPC polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Sun, 26 Apr 2026 18:00:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

            Bug ID: 221419
           Summary: ideapad-laptop: brightness keys require continuous VPC
                    polling to function on IdeaPad 3 15IIL05 (BIOS
                    EMCN60WW)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ladha979@gmail.com
        Regression: No

Hardware: Lenovo IdeaPad 3 15IIL05 (Type 81WE), BIOS version EMCN60WW
CPU: Intel Core i5-1035G1 (Ice Lake, 10th Gen)
Kernel: 7.0.1-1-cachyos (based on mainline)
Distribution: CachyOS

Summary:
Brightness keys do not work unless something continuously reads a VPC
register via the ideapad-laptop debugfs interface. This is distinct from
bug 214899, where the fix was incorrect _REG ordering causing EC register
0xA3 to not be set to 0x86. On this machine, 0xA3 is correctly set to 0x86
at boot, confirming the 6.2 ECDT fix is applied, yet the brightness keys
still do not work.

Investigation:
- acpi_listen shows no events when brightness keys are pressed
- evtest shows no events on any input device (AT Translated Set 2 keyboard,
  Video Bus, ideapad extra buttons, or any other device)
- DSDT correctly defines _Q11 (brightness up) and _Q12 (brightness down)
  EC query methods which notify GFX0.DD1F with 0x87/0x86 respectively
- EC register 0xA3 reads as 0x86 (correct value, confirming bug 214899
  fix is applied)
- modprobe -r ideapad_laptop makes no difference =E2=80=94 keys remain sile=
nt
- modprobe -r lenovo_wmi_hotkey_utilities makes no difference

Root cause identified:
The EC queues brightness key events internally but never fires the SCI
interrupt to notify Linux. However, when something continuously reads
VPC registers via /sys/kernel/debug/ideapad/status (which calls
read_ec_data with VPCCMD_R_BL among others), the brightness keys start
working =E2=80=94 the EC flushes its queued events on each VPC read.

Specifically:
- Running: watch -n 1 cat /sys/kernel/debug/ideapad/status
  causes brightness keys to work, with up to ~1 second delay
- Stopping the watch command causes keys to stop working immediately
- Writing 0x86 to EC register 0xA3 via ec0/io flushes pending keypresses
  but does not permanently arm the keys
- The effect is identical to bug 214899's symptom but has a different
  root cause =E2=80=94 the EC is not firing SCI interrupts for these specif=
ic
  keys, rather than _REG not setting the correct OS type

The ideapad-laptop driver has no polling fallback for this case. A
periodic poll of VPCCMD_R_BL or similar VPC register would serve as a
workaround, but a proper fix would investigate why the EC does not assert
SCI for brightness key events on this specific firmware version.

Workaround:
A systemd service continuously reading /sys/kernel/debug/ideapad/status
every 1-5 seconds restores brightness key functionality.

Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
