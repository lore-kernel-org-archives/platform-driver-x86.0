Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4943A186A
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773573332; cv=none; b=p9c323SLeptUJShbs1h8+rla9S7YrHPLjr3Jz3Vykc973PVVXfPgNalCNv+kFZWonOXgtjAVjKJZjNnFmhh4T4PN+fZcnyCsMfvXH4FmS0aYKPUOMniaTYVIKxqAbK7Eix3GJ3rPzQ1v6PnU2Woy2LoYJHvY3qYb3yobrL/fAJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773573332; c=relaxed/simple;
	bh=oVr2ayL7OOF9/3MekrOBLxJ1wzdx5ZAU4TKbMBjcl7M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=g9bslP4BBOvjkPpekln8lyUUK/cf6ErxBOCMP+qSnDfKGL+3cuNV8o2zUVXSi8WBDN5j1eofTWb7wnmFNm+mLK9pKlmf5/OoZh23xN0xSJFjJFlswZ9vnyRiTiX9ESjKqPX67I9KLwmqKhTD1WLb18VXtCf3c1jaV93fWtrBNRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdN9GsfB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdN9GsfB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB488C4CEF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773573332;
	bh=oVr2ayL7OOF9/3MekrOBLxJ1wzdx5ZAU4TKbMBjcl7M=;
	h=From:To:Subject:Date:From;
	b=FdN9GsfBquN/I88ogMjVTTvmQyupP/Vmciw2Lyt/LQQEdfaVpXYNfcPQmRDM6SMXz
	 BYMYEl54JoTt5waNiPEg3oVOAAuQPWWyfVCfSonBRwbu9B8Nmpc4armYD+1uVYkKlh
	 O6PxlgCU9041vu2MbnFMRlg214RYK6a6t9vlZTU5uLTMLv2OkNSRm05vJJIuojxNYX
	 3JQumA/vA74oryCHWqUV1mPsFgXBEcciduWH7R/HIqYgHNUtEBcRaEuUQ01eVg1oW6
	 rtnVmwN9k1jqmODTACxyc/lCsbB/KiGa6BM1zuBV06M0Nz+tH1FcnNgAwbtTUwoD/j
	 0UhIrMsguV51A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB0DCC3279F; Sun, 15 Mar 2026 11:15:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221238] New: lg-laptop: Spurious ACK and dropped keystrokes due
 to unprotected i8042 port access
Date: Sun, 15 Mar 2026 11:15:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alfonso.garcia.frey@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221238-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221238

            Bug ID: 221238
           Summary: lg-laptop: Spurious ACK and dropped keystrokes due to
                    unprotected i8042 port access
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: alfonso.garcia.frey@gmail.com
        Regression: No

The lg-laptop driver (drivers/platform/x86/lg-laptop.c) communicates with t=
he
LG embedded controller using raw inb()/outb() on i8042 ports 0x60/0x64,
completely bypassing the kernel's i8042 driver and its locking (i8042_mutex=
 /
i8042_lock). This causes a race condition between lg-laptop EC transactions=
 and
the atkbd driver's interrupt handling, resulting in:

  1. atkbd serio0: Spurious ACK on isa0060/serio0. Some program might be tr=
ying
to access hardware directly.
  2. Intermittent key drops =E2=80=94 keys (particularly on the left side o=
f the
keyboard matrix: s, w, left Ctrl) stop responding for several seconds.
  3. Occasional phantom or misinterpreted scancodes.

The problem has worsened significantly since battery_hook_register() was ad=
ded
to the driver (commit 822933b1b29), which causes periodic EC access in the
background on every battery status poll =E2=80=94 independent of any user F=
n-key
interaction.

Steps to reproduce:

  1. Boot any LG Gram laptop (tested on 16Z90Q-G.AD76F, 2022 model) with the
lg_laptop module loaded.
  2. Use the keyboard normally for 10-30 minutes.
  3. Observe dmesg | grep "Spurious ACK" =E2=80=94 messages accumulate over=
 time.
  4. Keys intermittently stop registering input.

Frequency:

  - Kernel 6.8.0-101 (with battery_hook_register): ~28 spurious ACKs/day,
frequent key drops
  - Kernel 5.15.0-171 (without battery hook): ~7 spurious ACKs/day, less
frequent key drops
  - Blacklisting lg_laptop: 0 spurious ACKs, no key drops (confirms the dri=
ver
as the cause)

Hardware:

  - LG Gram 16Z90Q-G.AD76F (2022)
  - Built-in PS/2 keyboard: AT Translated Set 2 keyboard (i8042,
isa0060/serio0)

Affected kernel versions:

  - 5.15.0-171-generic (Ubuntu/Mint)
  - 6.8.0-101-generic (Ubuntu HWE)
  - Likely all versions since driver inclusion (4.14+), worsened after batt=
ery
hook addition

Proposed fix:

Wrap the raw port I/O sequences in lg-laptop.c with i8042_lock_chip() /
i8042_unlock_chip() to serialize access with the kernel's i8042 interrupt
handler:

  #include <linux/i8042.h>

  static int lg_ec_read(unsigned char addr, unsigned char *val)
  {
      int ret;

      ret =3D i8042_lock_chip();
      if (ret)
          return ret;

      /* existing inb/outb sequence */

      i8042_unlock_chip();
      return 0;
  }

This is the same approach used by other drivers that need direct EC port
access. All functionality is preserved.

Current workaround:

  echo "blacklist lg_laptop" | sudo tee
/etc/modprobe.d/blacklist-lg-laptop.conf

This eliminates the issue but disables keyboard backlight, fan mode, battery
care, and Fn-key hotkey support.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
