Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307823C4E9
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 20:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926729; cv=none; b=JyagK4fMQVd6rLiXs2PT4cnAlzOACfYixxQeR9Q4Z74PN62KYLeO0Decfxj6adaUbH4KJSm+WoZBRc18e3GgcRH8bxB6Eq7TB7PIxsdRCwmREZTxwVZP6WmR2juODdG9gbdSytUYMLim7cDyBE3zsNwLyZGcs0/3YXbcXyJuZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926729; c=relaxed/simple;
	bh=GM4AofaRGK0OTP55gDTdNHzlaTpCJvIULI5FbegJuUg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Va2ykE4nb3bYDZUNiVB0FFL5Gfw9jf3QuKbQf5pJUXsdi32Djd87mVH7HRMZS5k9vSw2t4XAtaxhiTJ7u5u93+uZR4ArMTGEJKxx5iB2e/nVdcVpk6aJAcKJqvbWZ/oYUzEXLNj7klxPQ3YZxXR7eJqchoLidRlXdto/yIU2n7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K224TWwl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K224TWwl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 666D4C19421
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 20:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770926729;
	bh=GM4AofaRGK0OTP55gDTdNHzlaTpCJvIULI5FbegJuUg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K224TWwlwZnhoMVk3hFC35r/4DUId1UFyaeRdc6hNsYsiNgSEnJjx6aVmXC5noB2D
	 d2fBud3gXU8N3Z/5rF1mnKQfqBFvUDrzBI4YyXIOSiZW+vDJc/VjzmHUAsTgxw7MEg
	 w2VyJdAhUDMpH7g/EAzaQ7rLtOylG37yqV/okpv+Qtllu9jPLn7n4u0WZL5cT+1hzV
	 +BV4n6Fqu7YIN6afih8fXV2GGAcoZxRJHR00yfUaAjAV7c7LHz/h0QetPDeXX+3Ehb
	 p+J/intsMtQ4O6wHtxsf6LAwMvsi4SOdDDR+db7Q5A02bIvJKT0Mpv1brCgizI7J1z
	 LZ5ZDfaPA6UcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53E30C3279F; Thu, 12 Feb 2026 20:05:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjA2MzldIFtCVUddIGhwLXdtaTogT01FTiAxNi13ZjB4?=
 =?UTF-8?B?eHggKGJvYXJkIDhCQUIpIOKAkyBmYW5zIHN0dWNrIGF0IDAgUlBNLCBCb29z?=
 =?UTF-8?B?dC9XTUkgcXVlcmllcyByZWplY3RlZCAoaHBfd21pOiBxdWVyeSAweDRjIGVy?=
 =?UTF-8?B?cm9yIDB4Nik=?=
Date: Thu, 12 Feb 2026 20:05:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220639-215701-dVL2lf0VXd@https.bugzilla.kernel.org/>
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

--- Comment #5 from Juan Martin Morales (juanm4morales@gmail.com) ---
Hi, sorry for the delay in responding, here is the output:

$ sudo xxd /sys/kernel/debug/ec/ec0/io

00000000: 0000 0000 0001 4800 0f84 fa71 0ffa 1c01  ......H....q....
00000010: 0114 251e 1400 ffff ffff ffff 40fa ac24  ..%.........@..$
00000020: 0000 0000 0000 f900 350f 2100 4436 4b59  ........5.!.D6KY
00000030: 5844 3049 3831 494f 324c 4500 0100 00ff  XD0I81IO2LE.....
00000040: ffff ff01 00ff ffff ff4c 494f 4e00 0000  .........LION...
00000050: 0001 ffff 3100 000f 4301 2d41 0000 0000  ....1...C.-A....
00000060: 0080 1620 3333 332d 4143 2d31 322d 4100  ... 333-AC-12-A.
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: 0000 0000 0b00 0000 0000 0000 0000 0000  ................
00000090: 3333 332d 4143 2d31 3257 4b30 3630 3833  333-AC-12WK06083
000000a0: 0000 00d8 4100 0037 0000 0008 642a 0078  ....A..7....d*.x
000000b0: 3737 2c3c 2900 2423 0028 0800 c342 1110  77,<).$#.(...B..
000000c0: 0000 6d1e ab0d c232 3c2d 6c20 6d1e 641c  ..m....2<-l m.d.
000000d0: 0000 0000 0000 6d1e 0a03 5b01 0000 e000  ......m...[.....
000000e0: 0000 00ed 10eb 10ea 1000 0087 034f 0081  .............O..
000000f0: 0052 0000 0000 5433 5000 0049 574f 0000  .R....T3P..IWO..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
