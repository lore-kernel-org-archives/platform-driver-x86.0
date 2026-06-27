Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70610E555
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782547378; cv=none; b=GAruxejnNCZKtq/W/wJBzhLXTpbxxGADoN51zUQDDQuWIGCav1hduCeaFwBpddKB0ejdjv754aCBHyZLshRU/R9BUb5Zi34Tjai0WTD/IiAzMGvPyHcADU7jMEGrdxEg3W8YQ5tFPkm9O1xscPT4YfEIszxFYiDsMen+u+5H+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782547378; c=relaxed/simple;
	bh=Wd3ggeKSJUYRxo+42RY86Y70kK8ORcT7n1oRrQSBPW0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NUg+pwTXlXJGaVrQuoHpJYbZ4aRn1zEQrADxmk32HUh3JfBZYpmox9DvglqR4l/g1vLeLMTFibkwet/2RT8NJrvtJ5yASop3dNXgeX5NrtpB9NDl7ig8+uQZQ42pzyqLhT/6wgfOu6w9NrPak8ihNXvpecWvJ0sy689cBnkZ+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gl7/QeMm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gl7/QeMm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBDD6C2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jun 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782547378;
	bh=Wd3ggeKSJUYRxo+42RY86Y70kK8ORcT7n1oRrQSBPW0=;
	h=From:To:Subject:Date:From;
	b=Gl7/QeMmRmgy7wnDj21cEEY9H6UWybtjfJyYS4WM4xN16JEnLDEL2w/dhIsXH3IrP
	 i7PM8ev3Qbgwz+adk/KusP90rNnl1l28yNxLsWVitlP47jtj0UOEXMRKwro1uo7cE7
	 PHyrU02X5LUE1EOiyGBs4uTIdpCyumLTzCzJ9hLTHAVI1AmI6hkEaBRWEwZYuEtcz7
	 trsXcGusV8zFMkZdF+KzTgv7xNypmqVc+uRezElxoZ+fNhxjlfdZz8mfCOBax6Z7ql
	 NpSwbD4OZEBurjcGxJYgl+5iwtq38GSGaWPvwd2pibp/tVJ4WE452B5KsmaCKf+u4s
	 SPTVwfKWzpGZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF553C3279F; Sat, 27 Jun 2026 08:02:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221694] New: [regression v7.0->v7.1] AMD Strix Point (Ryzen AI
 9 HX 370) intermittently hangs on resume from s2idle
Date: Sat, 27 Jun 2026 08:02:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hongri.cui@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-221694-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221694

            Bug ID: 221694
           Summary: [regression v7.0->v7.1] AMD Strix Point (Ryzen AI 9 HX
                    370) intermittently hangs on resume from s2idle
           Product: Drivers
           Version: 2.5
    Kernel Version: 7.1.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: hongri.cui@gmail.com
                CC: mario.limonciello@amd.com, shyam-sundar.s-k@amd.com
        Regression: Yes

Created attachment 310380
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310380&action=3Dedit
amd-s2idle 0.2.18 report (7.1.1) =E2=80=94 all prereqs pass, 7 deep-s0i3 cy=
cles then
silent wedge

#regzbot introduced: v7.0..v7.1
#regzbot title: amd s2idle: Strix Point HX 370 silently hangs on resume from
s2idle

Summary
-------
On an AMD Ryzen AI 9 HX 370 (Strix Point) laptop whose only sleep state is
s2idle, resume from suspend-to-idle intermittently never completes (~10-40%
of cycles, no correlation to sleep duration). The machine wedges silently a=
nd
needs a hard power-off. 7.0.x is reliable; the failure appeared with 7.1 and
still reproduces on 7.1.1, so this is a 7.0 -> 7.1 regression, not one bad
point release. No crash: nothing in pstore; the journal simply ends at
"PM: suspend entry (s2idle)" because userspace is frozen and the box never
resumes to flush the ring buffer.

Hardware
--------
- AMD Ryzen AI 9 HX 370 w/ Radeon 890M (Strix Point, family 1ah)
- GPU: AMD Strix [Radeon 880M/890M] 1002:150e rev c1 (gfx1150)
- Wi-Fi: MediaTek MT7925 (14c3:7925, mt7925e)
- PMC: amd_pmc AMDI000A:00, Program 11, SMU firmware 93.4.0
- Board: Minisforum whitebox F8BAC, AMI BIOS 1.02 (2025-03-03, latest
available)
- /sys/power/mem_sleep =3D [s2idle] only (no S3 fallback)

Kernel versions
---------------
Good: 7.0.13  |  Bad: 7.1.0 and 7.1.1  (vanilla mainline-stable, NixOS,
unpatched)

Reproducer
----------
Root rtcwake loop driving real s2idle, with pm_debug_messages on:
    for i in $(seq 1 30); do
        echo "cycle $i PRE-SUSPEND" | tee /dev/kmsg; sync
        rtcwake -m mem -s 30
        sleep 15
    done
30 cycles reliably trips at least one wedge on 7.1.x; 7.0.13 completes 30/3=
0.
AMD's own amd-s2idle (amd-debug-tools 0.2.18) reproduces it identically.

Observed
--------
A/B, identical 30-cycle stress:
- 7.0.13: resumed 30/30, full deep s0i3 every cycle (last_hw_sleep mean
~29.5s).
- 7.1.1: clean for several cycles (full residency) then a silent wedge; the
last
  line persisted for the whole boot is the pre-suspend breadcrumb. Last good
  cycle showed normal "PM: suspend-to-idle" -> "amd_pmc: SMU idlemask s0i3:
  0x7fff1afd" -> "PM: suspend exit".

Ruled out
---------
- Not a crash: no oops/panic in efi_pstore across the reset.
- Not a misconfiguration: amd-s2idle prerequisite checks ALL pass (System
  configured for s2idle, ACPI FADT supports Low-power S0 idle, LPS0 _DSM
  enabled, amd_pmc loaded, amdgpu bound, IOMMU OK, PC6/CC6 enabled). See
attached.
- Not a wake-storm / shallow sleep: successful cycles reach deep s0i3 with =
full
  residency; zero amd_pmc "didn't reach deepest state" warnings, no
AER/MCE/lockup.
- Below the Wi-Fi driver: unloading mt7925e across suspend did not stop the
wedge
  (and caused a separate page_pool_release_retry stall, reverted). MT7925 is
not
  armed as a wake source.
- Not the ISP4 i2c-designware-amdisp resume race: no camera / no amd_isp4 /=
 no
  isp_4_1_0.bin, and that race was fixed before 7.1.

Signature points at a silent PMC/SMU s0i3 entry<->exit handshake.

Not a duplicate of bug 221664 (same iGPU family): that box never reaches s0=
ix
(last_hw_sleep=3D0) due to a broken DSDT \_SB.PEP._DSM and fails on 7.0 alr=
eady.
This box reaches full s0i3 (~76% residency), has a healthy LPS0 _DSM (no
AE_NOT_FOUND), and is a clean 7.0=E2=86=927.1 regression. cf. 221451 (GNOME=
/EC race)
and 220812 (drm/amd VPE commit 31ab31433c9b, fixed pre-7.0) =E2=80=94 neith=
er applies
here.

Can provide
-----------
git bisect v7.0..v7.1 (slow due to intermittency but doable), additional
amd-s2idle runs, serial/netconsole + no_console_suspend capture of the actu=
al
hang point, and full per-cycle logs from both kernels. Please advise which =
is
most useful first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
