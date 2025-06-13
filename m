Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE0619CD0B
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825782; cv=none; b=DbbZDrD3AjnICIB8ou4XPPk1xDt2Ax9WwcBVo3T9bJ2UXGCmLbjTrXpqPrBK3cE0REd1yYKzgG0WKjgEYKSf4BeEv+rGd2/x71gF4IcRj/nEDkO+PxW092+saLDjawviu30pF89OP52yHqhxaffHpgr0nYxCePG3ZquF8o9bss8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825782; c=relaxed/simple;
	bh=pK3PQUp9MKauVpG+bWTHrTfRbvv8sIfDiWRynPznwzc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BgpfgCOO/WBE9cIhXIcl1vFpg/6GhJ0OuqC9XNmjqyp/8B5NkPGeODCTk3y9IWIq8Tx3xx8/Rd2WCay7UxiQ+/iTt2lOueDqHBQkzw8e6vUuPUKgYZeqGLxbQzZhliTVkeR8dpMAiBL5Em0m33FRH/Y5onfFTWG7i2nhTOXnIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0+vdrr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0+vdrr1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E62C4CEF1
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jun 2025 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825782;
	bh=pK3PQUp9MKauVpG+bWTHrTfRbvv8sIfDiWRynPznwzc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a0+vdrr1C55ZM7oy27O3mK1KPkq1f5LCIJzjHoaacO4f0bMmicQNJjMHJjSQ1Tf0a
	 fzLKLcO7LSTpQuXcq1DEMakKnGgWW2z6kynOfNjlf5DkO7QFyh/3yKlnA7SxE73es9
	 r3bql8LpkHH47jgGuaxo48dod0dX9I9KeaGmNtyUFVqx30R9/KotvqACunKIGQlDdD
	 nWDmKQQpIuLM2Mg3Qqc9ve/xJ9bPBKm0EqpGRRlHdauWr+8vpD80AncI2fhKJWoEUK
	 nGw4RKcv4FtFjCfXTEd4CjaQ9Z6xuZywTrwNro1xJ7Wn2ZUlXAImieR/0xKWJ3HBMo
	 lUqQvMyUiBWDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A4B8C4160E; Fri, 13 Jun 2025 14:43:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220224] Kernel 6.15 causes crash (general protection fault) due
 to amd_sfh module
Date: Fri, 13 Jun 2025 14:43:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220224-215701-j5GoH2Z7Pg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220224-215701@https.bugzilla.kernel.org/>
References: <bug-220224-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220224

--- Comment #18 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I suspect it's a CachyOS patch.  This sensor doesn't exist upstream today.

giu 13 16:09:57 minos-b5eek kernel: pcie_mp2_amd 0000:08:00.7: sid 0xf
(tablet-mode-switch) status 0x4
giu 13 16:09:57 minos-b5eek kernel: hid-generic 0020:1022:0001.0006: hidraw=
5:
SENSOR HUB HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd

But it was discussed on the mailing list:
https://lore.kernel.org/linux-input/20250309194934.1759953-1-benato.denis96=
@gmail.com/

It's probably that sensor causing the problem, and it would explain why it =
only
happened on CachyOS if they're carrying that patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
