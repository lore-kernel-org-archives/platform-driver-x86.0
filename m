Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB03223708
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 05:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777268538; cv=none; b=sUahU/CKGQqn9wEAO4v0V3LaUDjdPfCei8587zteaWmtpcx9B97V0xfeFbEzRqltelSrAG515Eg5NL8yL/vx1zn0L82nrWRy5ME+zfeteYYHKEh/Tj2YdnodTXR0jHNKMWRYF33561w1ugush1kQgjBcf0P7PYjNdh/jVXROpyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777268538; c=relaxed/simple;
	bh=LkfP1/v4lIMRs2lqaSHrnxz6tSy0fsICV/XxjejLOLg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k9oBXTWu4qMGYA58T8WP5jZn4YR11XUUI1JqetMFUEWPOY/jOpzW4K/CZ208B+Ddui6hWogmPhWMvEj78DZl5Z2Lmx8DPkm6nXPwCudFgIT0QZLVVIRmv3Ec1f09kC+nlCSIRkEeO0aAaMghUtfxWNOhbaySDGfcb7I3HR/hS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cbr5Ym87; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cbr5Ym87"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E7FC2BCC9
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 05:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777268537;
	bh=LkfP1/v4lIMRs2lqaSHrnxz6tSy0fsICV/XxjejLOLg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cbr5Ym87E7XCq5daqZU3A81gOnF/pJUkfmQdx1Vk1283nXUeCogNpaTFaexjT/0w7
	 Z4HiBc4d+7MyLLuPhfCTz2ijgrYC8wBlF+MoOk+3CPcQAoz3RjvEy6nxcnr/Loavt/
	 9JhztDDyNElkbSsKk6PcDMZucXGPNlnemTVClpTW5tsjXefZL147Zcv4NjQYgU27qk
	 AuNNPsXyL1PDoIc1g67IJHmB5Nk784D00t4dsSJ1uwPbmpzeeKhOF2ACThegWCrpBM
	 a1RElY8+gUPDR0cbPtFtpJXXdFX81xeokiDCQ0BJYNE3WrgWqxySteSo371vFv7n99
	 K6fyHm19CjWuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DBF5AC41614; Mon, 27 Apr 2026 05:42:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 27 Apr 2026 05:42:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: boite.pour.spam@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-hqhG9iVc3C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #67 from boite.pour.spam@gmail.com ---
I've read all the comments above and I'm trying to understand how the broken
ACPI tables would work on Windows. If there's a "deadlock" in the ACPI
implementation, how does Windows works around it?=20
If I understand correctly, the solving options are:
1. Have Lenovo to fix the ACPI tables (which is very unlikely)
2. Implement a "live" ACPI fix with a DSDT override but it won't fix the bad
releasing of the ACPI's mutex (but we can probably live with it, since, exc=
ept
for the dmesg noise, doesn't break anything)
3. Blacklist both usci_acpi and ideapad-laptop, so that there aren't any
contender on the mutex anymore, but I'm not clear about what's lost when we=
 do
so?

Am I right?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
