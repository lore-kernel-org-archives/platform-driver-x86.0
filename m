Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5EE38A733
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2026 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090639; cv=none; b=OBMHFYRn91yHEk7qsSMcPsjE2mEx9fLukWJreAiWRXKHaWVfVp3UYznN0U/3vppP+GEkiQ9zV9rn8N+h4b3+/5k9gYQ3u05Ahr9e6Vz1vKuR7QP4ZAW1sxiVjAZE5Kkd4Y/39jiou8UIUFCAsL+u+pvj1kyieJYu4xKOYsmOJG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090639; c=relaxed/simple;
	bh=k9USkNmVGSoCODr28JmMXE7WT+zVoaOYxJj8X0RX+m8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRQ/RjSPs71cHsK+V+t1kmm807DcSY9qGzqcJAPDbxZnWWG0EPXL+xMr5Ov9PlDsZ0zXbCT8rk/VWvzMbNAV69OAtdg+0ClWP1BmLEtOiAJ8kW1L7q3WXK7WtKWftpYxfYfMha+txBVe1ZlgGSzS1/xizDc7b7+WnBVT15RndY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5AQ+cRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5AQ+cRX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D13BC19424
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Feb 2026 07:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772090639;
	bh=k9USkNmVGSoCODr28JmMXE7WT+zVoaOYxJj8X0RX+m8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i5AQ+cRXbN+UDZvB6qof5lfqSZks3emOS25TFXOPhMybStiGC3dJ3K2lJxBcchMPF
	 IG93ERzZOlir8LgQWsEfJXhRpY0R8SRHkhbN2GBV2AJqabpFPJy/XjnEmcnbE8dfTg
	 eWg7gx8PhvcLbdZ1f+dqvKCCPT+G0+uoClm3KdbpiDczbeKInmUzSCG/P5SPY1bDWC
	 Ji7rSaDVpmqs2GGQ5EOl+3XqB4M7bbzrcpCou8y1RGmAedes13S/eD41GhLAyDelNG
	 PXk8DGUxzu6RW2acGMrryA/k0RTMsCKhDskoS4+uCrs3ugZkknRJQgP+0Y6O7hPhdW
	 okCIDXe+bXz8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28931C41612; Thu, 26 Feb 2026 07:23:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Thu, 26 Feb 2026 07:23:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Jie7172585@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220639-215701-omNzyKMctU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220639-215701@https.bugzilla.kernel.org/>
References: <bug-220639-215701@https.bugzilla.kernel.org/>
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

Jie7172585@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Jie7172585@gmail.com

--- Comment #15 from Jie7172585@gmail.com ---
Hi,

I am testing the Linux 7.0-rc1 kernel on my HP OMEN 16-wf1xxx and noticed t=
hat
the fan control and thermal profile features do not work.

When attempting to change the platform profile or fan speed, nothing happens
physically, and dmesg outputs the following errors:
  hp_wmi: query 0x4c returned error 0x6
  ACPI BIOS Error (bug): Attempt to CreateField of length zero
  ACPI Error: Aborting method \_SB.WMID.WMAA

I saw that Krishna recently added support for the OMEN 16-wf0xxx (Board 8BA=
B)
via a DMI quirk list. It appears my specific board ID (8C76) is also missing
from the victus_s_thermal_profile_boards list, causing the driver to use the
wrong fallback thermal parameters.

Hardware Info:
- Laptop: OMEN by HP Gaming Laptop 16-wf1xxx
- DMI Board ID: 8C76

Following the debugging steps from Bugzilla, here is the EC register dump f=
or
my 8C76 board. As you can see, register 0x59 is also holding the thermal
profile state:

$ sudo modprobe ec_sys
$ sudo xxd /sys/kernel/debug/ec/ec0/io
00000000: 0000 0000 0001 48aa 0f84 fa71 0ffa 1c01  ......H....q....
00000010: 0129 251e ff00 ffff ffff ffff 00fa ac24  .)%............$
00000020: 0000 0000 0000 f900 350f 2000 0036 4b59  ........5. ..6KY
00000030: 5844 304b 3831 4a38 324a 5400 0100 00ff  XD0K81J82JT.....
00000040: ffff ff01 00ff ffff ff4c 494f 4e00 0000  .........LION...
00000050: 0009 ffff 3100 000f 4301 2d41 0000 0000  ....1...C.-A....
00000060: 0080 1620 3333 332d 4143 2d31 322d 4100  ... 333-AC-12-A.
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0b00 0000 0000 0000 0000 0000  ................
00000090: 3333 332d 4143 2d31 3257 4b30 3630 3833  333-AC-12WK06083
000000a0: 0001 00d8 4500 004c 0000 0008 642a 0078  ....E..L....d*.x
000000b0: 4d4d 3c5b 4100 3232 008c 0800 f242 1111  MM<[A.22.....B..
000000c0: 0000 7e1b 8505 0c32 3c2d 6c20 7e1b 6421  ..~....2<-l ~.d!
000000d0: 0000 0000 0000 7e1b bf02 5b11 0000 e000  ......~...[.....
000000e0: 0000 00af 10ad 10af 1000 0083 430b 0080  ............C...
000000f0: 0009 0200 0000 0000 5000 0061 580b 0000  ........P..aX...

Could you please consider adding the "8C76" board ID to the quirk list in y=
our
upcoming patches? I am already on the 7.0-rc1 kernel and am fully available=
 to
test any patches you send my way.

Thanks for your work!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
