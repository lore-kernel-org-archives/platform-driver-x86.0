Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669C286410
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773493062; cv=none; b=pz3mTm0XEeOMuFGZRG+otDO5mHnmGUkHkOqqgbJOyNvHVeN163m/MThq5kzZVIaMV+aQYmm79c6sXLbUZhDNcgQLjK8zFDvzosz0K7aJksdmKti4UM7xhyIhjcL6C2oFk+UCk/1mSSNcc3n4Z4j9yc6qaP0HDKfoU37Vcqjdh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773493062; c=relaxed/simple;
	bh=0/jA4H03GGn6R0nuYoVTIkife+6XYViCeRF0j8slkpk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lXltW9xNyfFQo+yPU3ius/Ew/uL/C3DKw/vKz2Y7Wo86rPtpB0+Fclhf3SNImVeOWaTtdPHlPyZXO7et++k6iwX8XAxX+0Qg9OZkyeuMaX8bcBVF//FnNJW45G/C/DE4J3BZtpF/3K7wXewXeDliIqEGhDXS/zeKrAg9cKZwM7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMgpqlGe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMgpqlGe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A57DC19425
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773493062;
	bh=0/jA4H03GGn6R0nuYoVTIkife+6XYViCeRF0j8slkpk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fMgpqlGeKJYsJE/xrRBNxVHpky/NctILrVUSZGHZ7ZZEwG5fsxcjMfRVQIW2a1Qek
	 XWD1+8wx+hKlquM+cUu63EJ4ZpGBDc8ZjdzECTNQNhw+oRp+uyc2lPgSRqKZ2D4ty2
	 u6/zzFPvgqvlubI3C/4i/gPkHztKDHp8hHMM6kkOOA5PFQQ1WY5lUMVgdLNHiMaeWB
	 yNhAj0sxke+4biahcNjBzmzz0SvRy4OTBlsLAteYIzuERBZMrrb5jTebAVgQW7/bdf
	 B6ytxnj58KUGEG52Bn9hHi5Klkvle3B6l4WmaFhdZ3CSjuVCFakYWzVni+CN2c6360
	 IVqCO5D38gosg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3467DC41612; Sat, 14 Mar 2026 12:57:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date: Sat, 14 Mar 2026 12:57:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ptscheepers@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-1eHUW2SnSu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Theunis Scheepers (ptscheepers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ptscheepers@gmail.com

--- Comment #351 from Theunis Scheepers (ptscheepers@gmail.com) ---
Requesting addition of ROG STRIX X870E-E GAMING WIFI to the nct6775-platfor=
m.c
ASUS WMI board allowlist for stable fan PWM control under Linux.

BACKGROUND
----------
The asus-ec-sensors driver already supports this board for temperature read=
ings
(CPU, CPU Package, Motherboard, VRM) and the CPU_Opt fan tachometer. Howeve=
r,
persistent fan speed control via PWM is not possible because the board is
missing from the nct6775 WMI platform allowlist.

The nct6799 Super-I/O chip (NCT6796D-S/NCT6799D-R) is detected at 0x2e:0x290
and exposes pwm1-pwm7 via direct ISA access through the nct6775 driver. Wri=
ting
PWM values via ISA succeeds momentarily, but the ASUS EC/ACPI firmware does=
 not
cooperate with direct ISA writes and overrides the control mode within seco=
nds.
The board needs the WMI cooperative path for stable fan control.

PWM OVERRIDE TEST (ISA writes don't persist)
---------------------------------------------
I tested writing to pwm2 (which controls fan2, the only case fan currently
connected to the nct6799 channels):

  Before:   fan2=3D473 RPM, pwm2_enable=3D5, pwm2=3D82
    (set pwm2_enable=3D1, pwm2=3D255)
  After 1s:  fan2=3D474 RPM, pwm2_enable=3D0, pwm2=3D255
  After 6s:  fan2=3D1433 RPM, pwm2_enable=3D0, pwm2=3D255
  After 11s: fan2=3D1470 RPM, pwm2_enable=3D0, pwm2=3D255
  Restored pwm2_enable to 5 (BIOS Q-Fan)

The firmware immediately changed pwm2_enable from 1 (manual) to 0 (full spe=
ed)
rather than respecting the manual control mode. The fan did ramp up because=
 the
PWM duty was set to 255, but the control mode was overridden. This confirms=
 the
hardware supports PWM control but requires the WMI path to cooperate with t=
he
ASUS firmware rather than fighting it via direct ISA writes.

All seven PWM channels default to pwm_enable=3D5 (SmartFan/BIOS-controlled):

  fan1: 0 RPM,   pwm1_enable: 5, pwm1: 255
  fan2: 473 RPM, pwm2_enable: 5, pwm2: 82
  fan3: 0 RPM,   pwm3_enable: 5, pwm3: 255
  fan4: 0 RPM,   pwm4_enable: 5, pwm4: 255
  fan5: 543 RPM, pwm5_enable: 5, pwm5: 86
  fan6: 0 RPM,   pwm6_enable: 5, pwm6: 255
  fan7: 0 RPM,   pwm7_enable: 5, pwm7: 210

RELATION TO X870E-H
-------------------
The closely related ROG STRIX X870E-H GAMING WIFI7 was recently added to the
allowlist. The patch description notes it "has a similar sensor configurati=
on
as the ROG STRIX X870E-E GAMING WIFI", so adding the X870E-E variant should=
 be
straightforward.

DSDT WMI METHODS
----------------
The decompiled DSDT confirms the WMI interface is present:

  WMBD (WMI method dispatch) at line 8377
  BREC (read EC) at line 9261
  BWEC (write EC) at line 9267
  \_SB.PCI0.SBRG.SIO1 (Super-I/O device) referenced throughout

SYSTEM INFO
-----------
  Board:     ASUSTeK COMPUTER INC. ROG STRIX X870E-E GAMING WIFI (Rev 1.xx)
  BIOS:      2004
  Kernel:    6.19.6-2-cachyos (x86_64, CachyOS/Arch)
  Super-I/O: NCT6796D-S/NCT6799D-R at 0x2e:0x290
  CPU:       AMD Ryzen 7 9800X3D

Loaded hwmon-related modules:
  asus_ec_sensors - provides CPU, CPU Package, Motherboard, VRM temps and
CPU_Opt fan
  asus_wmi (via eeepc_wmi)
  nct6775 + nct6775_core - ISA access to nct6799, detects fans and PWM but =
no
stable write path
  k10temp - CPU thermal
  amdgpu - GPU thermal

No ACPI resource conflicts were found in dmesg.

COLLECTED DATA
--------------
A full data tarball (DSDT binary + decompiled, sensors-detect, dmesg, PWM
override test, hwmon drivers list) is attached to:
https://github.com/zeule/asus-ec-sensors/issues/100

USE CASE
--------
I want to run GPU-temperature-driven case fan curves via CoolerControl, whi=
ch
requires stable writable PWM interfaces. The nct6799 PWM channels are the o=
nly
path to the motherboard fan headers, and they need the WMI allowlist entry =
to
work reliably without firmware conflict.

Happy to test patches. Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
