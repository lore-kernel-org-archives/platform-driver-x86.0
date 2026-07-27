Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F422EEE9F
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785166825; cv=none; b=NTN3+BrE+9bkz9TgWQ9tGayRb6T9d/PvhRCmIbbf31wzVlskW3TgpG24HxLilUzR6vGbsvWAnnzQgW7pjnOTORmLkPF4e5V2J+jF7jZHCy3OcpAdPY/mt8pf63p9cv7Iohokg7XzlK8e9wA8+Y0wdBYQOLYwtCy3k3C9x9iX1MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785166825; c=relaxed/simple;
	bh=NZau28087hQh0ag26LhBGCa5yW+B8puMTMp7jVd8cpQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ewqelW5fOHDTXtXe5GHOBsvLAwSFmjpNIQsC+ZVkWcElb7jU4BDeWwZ5KPx04n3xGeNqmnWiD/spsfjjX50XiZt66A1CWbanr3WwngFK/89HTvxrI+yOm+ueY3VeDjkUFK6cHRi4qYfbD19eNcsFpfKAio208mKBkW0B0SKms+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rj87iWWX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rj87iWWX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77D7BC19425
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 15:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785166824;
	bh=NZau28087hQh0ag26LhBGCa5yW+B8puMTMp7jVd8cpQ=;
	h=From:To:Subject:Date:From;
	b=rj87iWWXnrgnlVpGJyN0VIHFsCVAyyedorKnbo4DNqbKT/hTbe8/MH3+FIll2Atk1
	 fAIzg7yhVwQoVwxtAom45rPeSZ+dPxo/veNLTtwtAey8LU+NxJ4KCpxNuTFpXCe9CY
	 0IfbH7iUMNCWyy3yzId59vSbM+KFMCS9KmI+TzCACQwsZcDslLt/H+/3utf5cHuuo7
	 nnzYFd+bOclthc+ytas2pVaAWTTVxU4xAzzxidq655SRJNrwc3btdHH9RaHAbP6xwA
	 UhzPyEsJ9fGmEvmGsnNVLIQD4w48zTsFBoXLSTFvIOzDrnzqlpcETl0rSKZRVjvCnd
	 vdEckFjPgAlEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 522D5C433E1; Mon, 27 Jul 2026 15:40:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221800] New: HP ProBook 445 G9: keyboard backlight hotkey no
 longer works after upgrade to Linux 7.1.4
Date: Mon, 27 Jul 2026 15:40:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bread708kms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221800-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221800

            Bug ID: 221800
           Summary: HP ProBook 445 G9: keyboard backlight hotkey no longer
                    works after upgrade to Linux 7.1.4
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: bread708kms@gmail.com
        Regression: No

Created attachment 310526
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D310526&action=3Dedit
Diagnostic logs from the working kernel (Linux 7.1.3-arch1-2), including dm=
esg,
kernel journal, input device information, hardware information, evtest outp=
ut,
and system configuration for comparison w

Overview

After upgrading from Linux 7.1.3-arch1-2 to Linux 7.1.4-arch1-1, the keyboa=
rd
backlight hotkey on my HP ProBook 445 G9 stopped working.

This is a regression, as downgrading only the Linux kernel back to
7.1.3-arch1-2 immediately restores the functionality.

No BIOS changes or userspace changes were made between the working and brok=
en
tests.

Steps to Reproduce
Boot Linux 7.1.4-arch1-1 on an HP ProBook 445 G9.
Log into the system.
Press the keyboard backlight hotkey.
Optionally monitor /dev/input/event4 using evtest while pressing the key.
Actual Results

The keyboard backlight does not toggle.

evtest reports only the following when the key is pressed:

Event: type 4 (EV_MSC), code 4 (MSC_SCAN), value 43

No corresponding EV_KEY event is generated.

Other function keys (brightness, volume, etc.) continue to function normall=
y.

The keyboard backlight hardware itself is functional, as it turns on after a
cold boot.

Expected Results

Pressing the keyboard backlight hotkey should generate the appropriate key
event and toggle the keyboard backlight, as it does on Linux 7.1.3-arch1-2.

Regression Information

Working kernel

Linux 7.1.3-arch1-2

Broken kernel

Linux 7.1.4-arch1-1

The issue is completely reproducible.

Downgrading only the kernel from 7.1.4 to 7.1.3 restores the keyboard backl=
ight
hotkey functionality immediately.

Hardware

Laptop:

HP ProBook 445 G9

BIOS Version:

U88 Ver. 01.22.01

BIOS Date:

2026-05-04

Distribution:

Arch Linux
Additional Information

The hp_wmi driver is loaded.

dmesg contains:

hp_wmi: query 0x4 returned error 0x5

The system does not expose a keyboard backlight LED interface under
/sys/class/leds.

/proc/bus/input/devices identifies the internal keyboard as AT Translated S=
et 2
keyboard and the HP WMI device as HP WMI hotkeys.

If additional logs or testing are required, I would be happy to provide the=
m.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
