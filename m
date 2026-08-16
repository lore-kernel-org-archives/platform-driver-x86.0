Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3971396565
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786862432; cv=none; b=MkdDj8qQ6AnpaROpkQcb0lmBCwh2LlVprAI1xS9O3GElIm7NqGEyvK5HA8k0LXKApO9AeBpmBpPAnQG9hiNAjteoOB9IYA1aWeo4/sxgwrFEi/9VAgTuEMq2RU7H0qii6VKvTAhvrY040wtp1J/c+BWCmqK9Ymt2iCRmKbAcod8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786862432; c=relaxed/simple;
	bh=hWhmx6Qy3TBxTVTd+1/Qw5Owce+67VvdslQFBsJ+A6w=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OWONux6iXERYnlGvrKpl8SBCQNisGnLNShImo+cUDvfDEcRWW0++X+GANmmi4cnEBORymlUM2Lza4hNiwjguQ5/8bDCqn5m4lXz2nwgIz5H2eK+sIXPfB7PoX4eJY2kVmxPL7VGaXYjaS56MxwMl4vyypjJn8gTQZIm394uPVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmJ7vevj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmJ7vevj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9ACEC2BCF4
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786862431;
	bh=hWhmx6Qy3TBxTVTd+1/Qw5Owce+67VvdslQFBsJ+A6w=;
	h=From:To:Subject:Date:From;
	b=mmJ7vevjPFYx6fjfGHaQkTvrO3H2mts9z1Ivn1IX50LaEw+ULQ0Ilu7h6PEjrji26
	 s8DQH297VAqqvig0muS9NTGzJoQzcf5hh3ZkQ9+4SAcxu55kC5Y2qIpnszkopw1D3O
	 DXSihLmnP/s8qiRR5x7z+fxgfWKUO40jLPwQw7Z/egr+QX3wBhzLwUKjvKUxhAHOez
	 Epmx075Fo5U+TZru6ZKTk+CSFYiFGVye7S1Xka+CczWx4WIv2mW7ZhDi/B6YaPnBJk
	 lfQilFY7wT8rzrtM3vounGYaulYpbSBgj73g9UHSI1CEfErHOBJgO+aerfW/qtp8di
	 vRNFnHeZjLQ/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3605C3279F; Sun, 16 Aug 2026 06:40:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221893] New: amd_pmc - Last suspend didn't reach deepest state
 on HP ProBook 445 14 G11 (AMD Ryzen 7 7735U)
Date: Sun, 16 Aug 2026 06:40:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rayshuee@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221893-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221893

            Bug ID: 221893
           Summary: amd_pmc - Last suspend didn't reach deepest state on
                    HP ProBook 445 14 G11 (AMD Ryzen 7 7735U)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: rayshuee@gmail.com
        Regression: No

The HP ProBook 445 14 inch G11 Notebook PC (AMD Ryzen 7 7735U / Rembrandt,
board 8C79) fails to reach the deepest s2idle sleep state when the PS/2
keyboard (i8042) is registered as a wakeup source.

Every suspend cycle logs:

  amd_pmc AMDI0007:00: Last suspend didn't reach deepest state

Because the SoC never enters PC10/S0i3, the GPU power domain is not fully
powered down. On resume, the SMU is in an inconsistent state, leading to
a cascade of amdgpu failures:

  amdgpu 0000:05:00.0: failed to write reg 1aa89 wait reg 1aa8a
  amdgpu 0000:05:00.0: SMU is resuming...
  amdgpu 0000:05:00.0: SMU is resumed successfully!
  amdgpu 0000:05:00.0: [drm] *ERROR* IB test failed on gfx_0.0.0 (-110).
  amdgpu 0000:05:00.0: ib ring test failed (-110).
  amdgpu 0000:05:00.0: SMU: No response msg_reg: 1a resp_reg: 0
  amdgpu 0000:05:00.0: Failed to disable gfxoff!
  amdgpu 0000:05:00.0: ring sdma0 timeout
  amdgpu 0000:05:00.0: GPU reset begin!
  amdgpu 0000:05:00.0: GPU Recovery Failed: -62
  amdgpu 0000:05:00.0: ASIC reset failed

The system remains accessible via SSH but the display never recovers,
requiring a hard reboot.


HARDWARE INFORMATION

  CPU: AMD Ryzen 7 7735U with Radeon Graphics (Rembrandt / Zen3+)
  GPU: AMD YELLOW_CARP (DCN 3.1.2, GFX 10.3.x) - integrated
  PMC: amd_pmc AMDI0007:00, SMU firmware 69.71.0 (program 4)
  BIOS: HP W78 Ver. 01.08.01 (03/11/2026) - latest available
  EC firmware: 6.50 - latest available
  Board vendor: HP
  Board name: 8C79
  Product name: HP ProBook 445 14 inch G11 Notebook PC
  Sleep mode: s2idle only (no S3/deep support)


ROOT CAUSE

This is an EC (Embedded Controller) firmware bug. The EC triggers spurious
IRQ1 (PS/2 keyboard) wakeups without any keyboard activity, preventing the
SoC from reaching its deepest sleep state (PC10/S0i3).

This is the same class of bug already handled for many other AMD laptops
in drivers/platform/x86/amd/pmc/pmc-quirks.c:

  - Lenovo ThinkPads (T14/X13/P14s Gen1-2 AMD) - quirk_s2idle_spurious_8042
  - HP Laptop 15s-eq2xxx - quirk_s2idle_spurious_8042
  - Framework Laptop 13 (Phoenix) - quirk_spurious_8042
  - MECHREVO Wujie 14X - quirk_spurious_8042
  - PCSpecialist Lafite Pro V 14M - quirk_spurious_8042 (bugzilla #220116)

The issue persists even with the latest HP firmware (BIOS W78 01.08.01,
EC 6.50), indicating HP has not fixed this in their EC firmware.


WORKAROUND

Disabling i8042 wakeup fully resolves the issue:

  echo disabled | sudo tee /sys/bus/serio/devices/serio0/power/wakeup

After this, suspend reaches deep s2idle, the GPU powers down correctly,
and resume is clean with no amdgpu errors. The keyboard wake-up function
is not affected in practice -- the laptop wakes via lid sensor or power
button, which is the expected behavior on laptop hardware.


PROPOSED FIX

Add the HP ProBook 445 14 G11 (board 8C79) to the fwbug_list in
drivers/platform/x86/amd/pmc/pmc-quirks.c:

  /* HP ProBook 445 14 G11: EC triggers spurious IRQ1, blocking deep s2idle=
 */
  {
      .ident =3D "HP ProBook 445 14 inch G11 Notebook PC",
      .driver_data =3D &quirk_s2idle_spurious_8042,
      .matches =3D {
          DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
          DMI_MATCH(DMI_BOARD_NAME, "8C79"),
      }
  },

This follows the same pattern as the existing HP Laptop 15s-eq2xxx entry
(gitlab drm/amd #2684), which uses quirk_s2idle_spurious_8042 for the
same class of bug on HP hardware.

Patch is attached.


STEPS TO REPRODUCE

1. Boot the system with default configuration (i8042 wakeup enabled)
2. Run: sudo systemctl suspend
3. Wait a few seconds, then wake the system
4. Observe: display remains black, SSH may work but GPU is non-functional
5. Check dmesg: amd_pmc AMDI0007:00: Last suspend didn't reach deepest state
   followed by amdgpu SMU/IB test/GFXOFF errors


STEPS TO VERIFY WORKAROUND

1. Run: echo disabled | sudo tee /sys/bus/serio/devices/serio0/power/wakeup
2. Run: sudo systemctl suspend
3. Wake the system
4. Observe: display recovers normally, system fully functional
5. Check dmesg: no "Last suspend didn't reach deepest state" message,
   no amdgpu errors, SMU resumes cleanly


LOGS

Before workaround (broken):

  PM: suspend entry (s2idle)
  amd_pmc AMDI0007:00: Last suspend didn't reach deepest state
  amdgpu 0000:05:00.0: failed to write reg 1aa89 wait reg 1aa8a
  amdgpu 0000:05:00.0: SMU is resuming...
  amdgpu 0000:05:00.0: SMU is resumed successfully!
  amdgpu 0000:05:00.0: [drm] *ERROR* IB test failed on gfx_0.0.0 (-110).
  amdgpu 0000:05:00.0: ib ring test failed (-110).
  amdgpu 0000:05:00.0: SMU: No response msg_reg: 1a resp_reg: 0
  amdgpu 0000:05:00.0: Failed to disable gfxoff!
  amdgpu 0000:05:00.0: ring sdma0 timeout
  amdgpu 0000:05:00.0: GPU reset begin!
  amdgpu 0000:05:00.0: GPU Recovery Failed: -62

After workaround (working):

  PM: suspend entry (s2idle)
  PM: suspend exit
  amdgpu 0000:05:00.0: SMU is resuming...
  amdgpu 0000:05:00.0: SMU is resumed successfully!
  (no errors, display recovers normally)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
