Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94886847B
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712604722; cv=none; b=a+hadZCX0ZaVZ51F6z46eyWp/tRb8hy+bJJS08hsXppTGkjrYBQ1Qt3wBbnk7DJB2cIAL5FEZ+OzAcOhIhV61Lx8goxvOJ37rntpX8F+PIEBu5M4+f+1LXnrm/1nuGiRk5g8H97qaKwkdPH5F6MFUZQsMyMGZOSza6YmIwJqNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712604722; c=relaxed/simple;
	bh=upXV+7/BOpEUr2Q0RCJkOGzRyJDXrzvh3Gxio/4TplQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Tj+K1jB/HB0Te3COvDAVOsRLRggO19fPrnYnL+FopDD2U6HAlPc3wxDSa6kxvuZbRHLwhZGH/FekPw6Q72a1moySst/ChMESl5kCgaLF7gxeMBiPfpxEqrd/GFyqJqKtyv4JQp8WeBcMaNVcl6+hxO0Rqi0uMFrp84aJO7vbrlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sY6lrEQO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sY6lrEQO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A7C7C433C7
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712604722;
	bh=upXV+7/BOpEUr2Q0RCJkOGzRyJDXrzvh3Gxio/4TplQ=;
	h=From:To:Subject:Date:From;
	b=sY6lrEQOOCRGJuJncf33aOEdETjfQW07HWugdeRU420sCLM9u+r+CwGEismEoorO3
	 v3shbI4eR0ChFYL+aOoVnrqNLDMDxPUD+2vjuPWlJ4437qTL1aTP0IAqFSyCHHGqKv
	 GTuapicznIcVXADny5bhT4M/1G30g4Noec5eLd16+1Po5p2BeQX5RroPKyHqllIpRF
	 CH5gZpHLAjJuVZBhbnQtnyEGeLxtPHngfJVm6v6bQ4uWnZnLE5Mro4XHPFCKSPyZkT
	 lHkxh7WeH9CVDvaFFSLEr6EaLvqt5r+yZ2UCtIci+ql8hna5Rwhms7xcV9IKhBG3XZ
	 f6thM7hwTSD+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 08D2FC4332E; Mon,  8 Apr 2024 19:32:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218696] New: DYTC frequency scaling deterioration
Date: Mon, 08 Apr 2024 19:32:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lmulling@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218696-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218696

            Bug ID: 218696
           Summary: DYTC frequency scaling deterioration
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: lmulling@proton.me
        Regression: No

Created attachment 306108
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306108&action=3Dedit
ACPI Feilds dump before during and after the problem

Hi,

I'm trying to implement automatic user-space platform profile controls for =
my
ThinkPad and noticed that while under load, i.e. compiling the kernel, the
firmware (I think) will start sending `ibm/hotkey LEN0268:00 00000080 00006=
032`
events non-stop, which causes thinkpad_acpi to update the platform profile.
This happens once every second. However, the profile doe's not change. This
render any userspace tool useless, since we cannot react according to Fn +
[L|M|H] events.

While this is happening, the max frequency scaling will get stuck at a maxi=
mum
of around 2990MHz (78 C). The baseline for this model, from my measurements=
, is
3.400MHz (95 C). This seems to happen only if the GPU is used and DYTC is in
MMC mode.

I can reproduce this reliably by playing a full-screen YouTube video while
compiling the kernel.

Changing platform profile to low-power and then back to performance fixes t=
his
for a while. I've also noticed that leaving the deceive sleeping for long
periods of time fixes this.

I've tried looking at the DYTC implementation but didn't find anything spec=
ial
about going into low-power, I've tried to dump the the ACPI fields using
acpi_dbg, but haven't found anything useful yet.

I've attached the dumps (in the same file), which are:

- before, taken after reboot.
- during, taken while the firmware is sending 6032 events and frequency sca=
ling
is stuck;
- after, taken after changing the platform profile to low-power and back to
performance (this was done using Fn + L then Fn + H)

Bellow, also, is the diff between during and after. But it does not show
anything useful to me.
```
--- during      2024-04-08 15:17:49.998768985 -0300
+++ after       2024-04-08 15:20:56.829128627 -0300
@@ -151,7 +151,7 @@
 \_SB.PCI0.SMB.LRG3 {00000000000000FF}
 \_SB.PCI0.SMB.LHC3 {00000000000000FF}
 \_SB.PCI0.SMB.SEC {0000000000000031}
-\_SB.PCI0.SMB.MIN {0000000000000017}
+\_SB.PCI0.SMB.MIN {0000000000000020}
 \_SB.PCI0.SMB.MX01 {00000000000000FF}
 \_SB.PCI0.SMB.MX07 {00000000000000FF}
 \_SB.PCI0.SMB.MX14 {00000000000000FF}
@@ -191,7 +191,7 @@
 \_SB.PCI0.SMB.MS04 {00000000000000F0}
 \_SB.PCI0.SMB.MS40 {0000000000000042}
 \_SB.PCI0.SMB.ECES {0000000000000000}
-\_SB.PCI0.LPC0.EC0.SBVO {000000000000317B}
+\_SB.PCI0.LPC0.EC0.SBVO {000000000000317A}
 \_SB.PCI0.LPC0.EC0.SBAC {0000000000000000}
 \_SB.PCI0.LPC0.EC0.SBRS {0000000000000064}
 \_SB.PCI0.LPC0.EC0.SBRC {000000000000110A}
@@ -210,7 +210,7 @@
 \_SB.PCI0.LPC0.EC0.SBCH {000000000050694C}
 \_SB.PCI0.LPC0.EC0.SBMN {53 4D 50 00 32 30 32 31 00 00 00 00 00 00 C0 C0 }
 \_SB.PCI0.LPC0.EC0.SBDN {4C 4E 56 2D 35 42 31 31 48 35 36 33 33 39       }
-\_SB.PCI0.LPC0.EC0.TWBT {C0 C0 01 03 E0 41 00 00 00 00 00 00 00 00 00 00 C=
0 C0
20 E0 DC 0B 7B 31 00 00 00 00 64 00 0A 11 C0 C0 0A 11 FF FF FF FF FF FF E0 =
00
0A 00 14 0C C0 C0 68 10 F2 2B 31 00 B4 56 8F 06 EE 12 00 00 C0 C0 53 4D 50 =
00
32 30 32 31 00 00 00 00 00 00 C0 C0 4C 4E 56 2D 35 42 31 31 48 35 36 33 33 =
39
C0 C0 4C 69 50 00 00 00 00 00 00 00 00 00 00 00 C0 C0 58 32 58 50 33 35 4C =
30
31 4C 46 00 00 00 C0 C0 4C 58 C1 41 80 00 05 00 42 05 00 01 06 00 C0 C0 10 =
00
02 00 00 00 00 00 00 00 00 00 00 00 C0 C0 42 01 01 01 00 00 7E 10 7E 10 7E =
10
04 50 C0 C0 B0 01 B6 0A 29 02 00 00 00 00 00 00 00 00 C0 C0 00 07 00 00 00 =
00
00 00 00 00 00 00 00 00 C0 C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 C0 =
C0
00 00 00 00 00 00 00 00 00 00 00 00 00 00 C0 C0 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 }
+\_SB.PCI0.LPC0.EC0.TWBT {C0 C0 01 03 E0 41 00 00 00 00 00 00 00 00 00 00 C=
0 C0
20 E0 DE 0B 7A 31 00 00 00 00 64 00 0A 11 C0 C0 0A 11 FF FF FF FF FF FF E0 =
00
0A 00 0D 0C C0 C0 68 10 F2 2B 31 00 B4 56 8F 06 EE 12 00 00 C0 C0 53 4D 50 =
00
32 30 32 31 00 00 00 00 00 00 C0 C0 4C 4E 56 2D 35 42 31 31 48 35 36 33 33 =
39
C0 C0 4C 69 50 00 00 00 00 00 00 00 00 00 00 00 C0 C0 58 32 58 50 33 35 4C =
30
31 4C 46 00 00 00 C0 C0 4C 58 C1 41 80 00 05 00 42 05 00 01 06 00 C0 C0 10 =
00
02 00 00 00 00 00 00 00 00 00 00 00 C0 C0 42 01 01 01 00 00 7E 10 7E 10 7E =
10
04 50 C0 C0 B0 01 B6 0A 29 02 00 00 00 00 00 00 00 00 C0 C0 00 07 00 00 00 =
00
00 00 00 00 00 00 00 00 C0 C0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 C0 =
C0
00 00 00 00 00 00 00 00 00 00 00 00 00 00 C0 C0 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 }
 \_SB.PCI0.LPC0.EC0.T2BT {00 01 00 00 00 00 00 00 7A 00 00 00 00 00 41 50 5=
0 20
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 1A 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00
00 00 00 00 }
 \_SB.SMIB {00000000000000B0}
 \_SB.PEBA {00000000F8000000}
@@ -903,5 +903,3 @@
 \M414 {0000000000000B00}
 \M444 {00 00 00 00 00 00 00 00 00                      }
 \M449 {00 00 00 00 00 00 00 00 00                      }
```

Tested on:
- Kernel: 6.8.1
- Host: 21C6000UBO
- UEFI: 0.1.30

I'm willing to help debug this in any way I can, though i'm out of ideas ri=
ght
now. I'm also not sure if this is a firmware bug and wanted a second opinion
before sinking more time into this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
