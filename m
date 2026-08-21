Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE75C469851
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309744; cv=none; b=bMl92KaATBIaA1Jz/iTJMNjHOyCyCda/2YEY/U5eDt5StrVcDQyOaeRN1qdHDN+UiWFBIHpxtcjzrVE1F+gZ7KSI06BvLDpBvexYw7yk9e2o9ifScYB05Vii3PYE/ypIrsKA8AaiOcEQa0AueNXxbwqv+R7ZcgxyHTsELTlR5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309744; c=relaxed/simple;
	bh=+Y5KPZbKIIiImxX7aIFIVXnQ23qJK2eJu5jCA9CBj+s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f7Birvo1BtdOdxgMiOwjRYZcFx5cQfn9e9JKr2pQzLgq/A8HqysRbmGEtAAoHEpO78hIZ5oTywZHAl96KzhUqxDq7qpLqRmPTYEX7uKxdSw6oHDX2uPWPygrWqV47EQyew5vaPfJdPVlIaM6XLIqmrp3kPI/x6Fr6FK/fOg+U5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ru2IQVUS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ru2IQVUS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA22C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Aug 2026 10:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787309743;
	bh=+Y5KPZbKIIiImxX7aIFIVXnQ23qJK2eJu5jCA9CBj+s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ru2IQVUSgNPe97mraw5U/kzhHoCO3iRRrtLLupGkqVswl6Xf9y/+cTqvrEqk2RXvX
	 mas6VFgfW4GRWtXxS1wuFCT6OfkPAV/EkEH0EXvaesRMr6hMzC5AIcCGXT3Zb3Jxt7
	 XyWDTAQBYFHqLmz1USIrn71srX/xzsXfKYElmh/cTA4KXDtRLaVm5WCAXw+To1jYi5
	 FfzKlVrkkq7CZPn0aHy8kXXlqp95gPJq+WuPL1uesS4gVMqDcuEc9xXw8sYT+Uqnmi
	 D0bVz3/HHBclq/6BdU6hJUQDEvFx4uIVlEoc6WscGjz2jRr6JyJ6LiS8jTWcc/V+nm
	 l7JUgSmwFLY9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B504C41614; Fri, 21 Aug 2026 10:55:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220926] HP ENVY 16-h1xxx (Hayden): hp_wmi platform_profile
 fails to read/write
Date: Fri, 21 Aug 2026 10:55:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gibs23@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220926-215701-9dR898cuW9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220926-215701@https.bugzilla.kernel.org/>
References: <bug-220926-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220926

--- Comment #15 from Gibs (gibs23@proton.me) ---
Forgot to mention a detail, some data is missing when battery is disconnect=
ed
from laptop:

```
sudo dd if=3D/dev/mem bs=3D1 skip=3D$((0xFE0B0800)) count=3D512 2>/dev/null=
 | hexdump
-C
00000000  00 00 00 00 00 00 40 00  00 00 00 00 00 00 1a 01  |......@.......=
..|
00000010  01 00 32 1b ff 00 ff ff  ff ff ff ff 00 00 00 e4  |..2...........=
..|
00000020  00 00 00 00 1e 00 02 02  06 01 00 00 52 00 00 00  |............R.=
..|
00000030  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000050  00 00 00 00 00 00 00 00  63 05 00 00 00 00 00 00  |........c.....=
..|
00000060  00 80 16 20 33 33 33 2d  32 44 2d 32 37 2d 41 00  |... 333-2D-27-=
A.|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
00000080  00 00 00 00 0b 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
000000a0  00 00 00 d8 41 00 00 36  00 00 00 08 64 2a 00 78  |....A..6....d*=
.x|
000000b0  37 37 00 00 00 00 00 01  00 00 08 00 cb 02 00 00  |77............=
..|
000000c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
000000d0  00 00 00 00 00 00 00 00  00 00 00 01 00 00 00 00  |..............=
..|
000000e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000100  00 00 00 03 00 06 05 00  39 00 37 3b 1b 39 60 21  |........9.7;.9=
`!|
00000110  4e 61 22 4f 62 2a 50 63  32 50 64 32 50 64 32 50  |Na"Ob*Pc2Pd2Pd=
2P|
00000120  64 32 50 64 32 00 00 00  00 00 03 00 06 00 00 39  |d2Pd2.........=
.9|
00000130  00 37 3b 22 39 60 24 4e  61 25 4f 62 2d 50 63 35  |.7;"9`$Na%Ob-P=
c5|
00000140  50 64 35 50 64 35 50 64  35 50 64 35 00 00 00 00  |Pd5Pd5Pd5Pd5..=
..|
00000150  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000200
```

Both in ec dump or /dev/mem one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
