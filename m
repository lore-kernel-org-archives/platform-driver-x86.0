Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D3C2F12DA
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787394803; cv=none; b=GdA6L/hoIBGqEoM6WNDeipF+qHu/8sRaHiS76s6zXBbJt6iE0z0OO77tZteYyUdlwQZ4pEF0YD9zUb3uBkYU7FYOJyVfEwMCl4mufbLXLRGjsJlosQuXh1LxVQkZqbXVW8GNi1BoIYxEvxOLfCsBJNARPaYDOjyzZ9VorJgV9fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787394803; c=relaxed/simple;
	bh=lDxuEbfPkBVRK/biPfNIuViF/YeFlgj1LwKLLbKv8gI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n25OqjQWj3HvQ4sxczYN0y53+MYdaPwsDkHGFCaDpsH9mfBJaxsV7LYC4P9UYMfKjGkbdz+APNY58Pmkds5FyW8isu7dwivGh+fGDJDhc6NbfOhsajwALnthEaxmUfjHm/E/1ACWaNRylSxD974CLv7Fy3fw3nDT71zYlRtxKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GosTC8+9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GosTC8+9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53E3BC2BCB3
	for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2026 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787394803;
	bh=lDxuEbfPkBVRK/biPfNIuViF/YeFlgj1LwKLLbKv8gI=;
	h=From:To:Subject:Date:From;
	b=GosTC8+9ASk7iMhq5A8mmj/I+uhBXEDcOI7UEwa5A9tuOPe+/VQSU8nfQUQXpsqpE
	 6397DiL2cC3VpXjB5yEs2ib552A/9r7hKhf0JKTViiu6iwCstNUCC1KQxBH20NhmV5
	 fu+E8IACm9jOLkg+jVy5WLBVlL0DVRxQYB4ecilDC/tUEK0IQwca+Q5h7tZkKpT2uw
	 fWSAL53OSviFotRyJd1lE4It3GW1CD/V6Af9fTTDruIEhOd7CLSRh73BuA3i6vrNMD
	 0U6ZXJiUBMejydrG85y06Xux3Seg3aCjmZ9anYNYi6hf6I7x/rX4TL1nbafth2VLSz
	 jQ5E7xsq0VFVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2998DC433E1; Sat, 22 Aug 2026 10:33:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221908] New: platform/x86: lenovo-wmi-gamezone: EC fallback to
 Quiet (blue LED) desyncs with SMARTFAN_GET (max-power) on AC unplug on Lenovo
 LOQ 15IRH8
Date: Sat, 22 Aug 2026 10:33:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ginebrine@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221908-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221908

            Bug ID: 221908
           Summary: platform/x86: lenovo-wmi-gamezone: EC fallback to
                    Quiet (blue LED) desyncs with SMARTFAN_GET (max-power)
                    on AC unplug on Lenovo LOQ 15IRH8
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ginebrine@gmail.com
        Regression: No

Created attachment 310714
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310714&action=3Dedit
Dmesg delta, DMI status, and decompiled DSDT

Distribution: CachyOS (Arch-based)
Kernel: 7.2.0-1-cachyos
Hardware: Lenovo LOQ 15IRH8 (Model 82XV)
BIOS: LZCN44WW (EC: 1.44)

Description:
On Lenovo LOQ 15IRH8 running kernel 7.2.0 with lenovo-wmi-gamezone, there i=
s a
state desynchronization between the physical EC thermal mode and the state
reported by sysfs / WMI on AC disconnect.

Steps to reproduce:
1. Boot system connected to AC power.
2. Ensure platform_profile is set to 'max-power' (Chassis power button LED =
is
PURPLE / Extreme).
3. Disconnect AC adapter (unplug).

Observed Result:
- Physical power button LED immediately turns BLUE (EC hardware-level fallb=
ack
to Quiet/Low-Power mode).
- /sys/firmware/acpi/platform_profile continues to return 'max-power'.
- power-profiles-daemon remains in 'performance'.
- lenovo-wmi-events generates no LWMI_EVENT_THERMAL_MODE notify because WMI
SMARTFAN_GET internally still reports the logical selected mode (Extreme)
rather than the effective EC state (Quiet).

Expected Result:
- When AC is unplugged, platform_profile should reflect the real effective
thermal mode (or fallback to balanced/low-power), or a thermal-mode WMI eve=
nt
should be raised to notify userspace/PPD of the power limit changes.

Attached:
- lenovo_loq_power_bug.tar.gz (Contains loq_platform_profile_bug.txt and
decompiled ACPI dsdt.dsl)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
