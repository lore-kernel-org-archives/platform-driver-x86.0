Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D72163A6
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734703576; cv=none; b=lmH1q5OGk26B/Z/jsd4kpE0nPBeNIQdquEGQ7Z3bIXlMSGhq8gQqsdVGPkdmw0WvitZ6zA/RE1MjJDiDtGX+zavl1SGpfkQP8ZejII+vNVLmr2Hbz+m80RLEJsMkO+mFUhc4LAyiE3cRI+MwdcO58CEg5+vjGlXWsYclKChdF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734703576; c=relaxed/simple;
	bh=4zuqlDY39FPnL0EkGaTCdsv+Q6Xns12cSwWaf3iC7BY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YFIkUVJefpi3G+TCxFoVEr37tvo5ID2oq7Wc50AOT8Z2iDRpoOp3LD771z6sYLVCCs73rqD7tE7vy1gHwX2xGjAYCpEdOvCFpYJaScdlcIqg/3/yryvA6w/3WkDKEoFICASugOTA2CPTXSLsTMxVzkCCf3yVc/K3ljtVq2a5M2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkDJum9N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkDJum9N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B939C4CECD
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Dec 2024 14:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734703576;
	bh=4zuqlDY39FPnL0EkGaTCdsv+Q6Xns12cSwWaf3iC7BY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NkDJum9NrzHG6og5yd9E/dxJ6RWW37MHP0J92CnFtPPK2K4hPoXRU0nIMINqo7Ykw
	 i7lL1APlJrhft9Wx2L14MztQ7cESp0UzHnqIvW8Jq6CBTrrfgz1TKiqbQkEE0EiGcJ
	 bQpalm03WEjIkgQl9L5lbRlN78H1CJWIHyJW2wL3O12y6uaEtisy+lXZ2d//a8f1aS
	 OntYzj7iLo5KAcfl5GTm4q+cJV2B9I9YfgDbGGEoUE2IYtDngegJlZdOEWSzi5j0zY
	 9Bcu5I0HfFuljXBZVp81eC1LmuRtGk++CoW5HCfvinjVA1RZGUWwIj6c327bVpbjp5
	 7HXbz8etlwCxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 023F2C4160E; Fri, 20 Dec 2024 14:06:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Fri, 20 Dec 2024 14:06:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarkko@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-DhFFo4E8Ss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #31 from jarkko@kernel.org ---
OK, I somehow managed to miss it as it had different naming convention sorr=
y.

Anywhow, I see this:

[   10.693310][    T1] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-id 0)
[   10.848132][    T1] ------------[ cut here ]------------
[   10.853559][    T1] WARNING: CPU: 59 PID: 1 at mm/page_alloc.c:4727
__alloc_pages_noprof+0x2ca/0x330
[   10.862827][    T1] Modules linked in:
[   10.866671][    T1] CPU: 59 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.12.0-lp155.2.g52785e2-default #1 openSUSE Tumbleweed (unreleased)
588cd98293a7c9eba9013378d807364c088c9375
[   10.882741][    T1] Hardware name: HPE ProLiant DL320 Gen12/ProLiant DL3=
20
Gen12, BIOS 1.20 10/28/2024
[   10.892170][    T1] RIP: 0010:__alloc_pages_noprof+0x2ca/0x330
[   10.898103][    T1] Code: 24 08 e9 4a fe ff ff e8 34 36 fa ff e9 88 fe f=
f ff
83 fe 0a 0f 86 b3 fd ff ff 80 3d 01 e7 ce 01 00 75 09 c6 05 f8 e6 ce 01 01 =
<0f>
0b 45 31 ff e9 e5 fe ff ff f7 c2 00 00 08 00 75 42 89 d9 80 e1
[   10.917750][    T1] RSP: 0000:ffffb7cf40077980 EFLAGS: 00010246
[   10.923777][    T1] RAX: 0000000000000000 RBX: 0000000000040cc0 RCX:
0000000000000000
[   10.931727][    T1] RDX: 0000000000000000 RSI: 000000000000000c RDI:
0000000000040cc0
[   10.939678][    T1] RBP: 000000000000000c R08: ffffffffbb6fdc67 R09:
0000000000000000
[   10.947626][    T1] R10: ffffb7cf40077ac8 R11: 0000000000000000 R12:
0000000000000000
[   10.955560][    T1] R13: 00000000ffffffff R14: 0000000000000cc0 R15:
ffff9a5c051cc000
[   10.963507][    T1] FS:  0000000000000000(0000) GS:ffff9a6348780000(0000)
knlGS:0000000000000000
[   10.972405][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.978944][    T1] CR2: 0000000000000000 CR3: 0000000184638001 CR4:
0000000000f70ef0
[   10.986891][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   10.994837][    T1] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
0000000000000400
[   11.002770][    T1] PKRU: 55555554
[   11.006256][    T1] Call Trace:
[   11.009479][    T1]  <TASK>
[   11.012352][    T1]  ? __alloc_pages_noprof+0x2ca/0x330


RSI=3D0x0c, which maps to the parameter 'order' in __alloc_pages_noprof(), =
which
allocates=20
4096*2**0xc =3D 16777216 =3D 16 MiB of memory. This means that memory consu=
med by
the log is in the range 8 MiB < N <=3D 16 MiB.

It's a huge buffer to bind. Are you sure that there is no BIOS bug and what=
 is
the exact target hardware, BIOS type and version etc. Have you reported to =
the
vendor? This definitely is not normal.

And I don't understand where Stefan got his size figures, which are complet=
ely
different...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
