Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FB1EEE6
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103203; cv=none; b=NBthb0u/yOTmtBKwG3ltL1OPDvlWGjt6dns3HjkFOnxjQeQtlUEfzSJtDRP6fZKYZZF0I8GtK1XIy4jCsX1MejYROT0ojlswLukGhOQejoF1ibW2N3Zk7CBGBFh0B1HReVibxVPtwLqm44/nTyre13cpSZtu5vNkspnhKKpBrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103203; c=relaxed/simple;
	bh=0d/4zZbNEuZOBWvAoZOMegqfhfOsNEYU8SLIH6Q2UZg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4f859+BJmeCCWZjqRy9aoZ2qqgEjWTi2pnNVh3S36RWDI51F8vIoXzANFlBVfenHQYjREq++JE/pVQIQn4BqjJ9tRb0jH8M4jOhMNsYlbsLLtpwobVmWZaIFT1sFiZMsXV8G36NCJUxJ0vWfcUKM8EvaOn8pIbX8OJ/OX+Viag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+uHjfOD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+uHjfOD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 190D8C4CEE3
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746103203;
	bh=0d/4zZbNEuZOBWvAoZOMegqfhfOsNEYU8SLIH6Q2UZg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o+uHjfODqao/9vfLNfTY69h6hB10y3WNikXy6lYlRQiTnfbgnyBUMn4kJCs/HFcNx
	 Uh/JVsLmGV93/0mxPJBq3DuyiMAPsSGpdLFoZojj6MkmFuP2Oj4h4t2+EEQWzJqsg2
	 IaFmuapBUKwrE53C4aA9eOPVh8YzPuHLq/xl+eLPoNr9wI/wV/cnfd7f16c4WdzM75
	 Jhc3jKhN7PRZJYzMxuEx4yLNdlx9qofUB2QUH/T/3g1qVLP8s2hxl/BY725qq6kr9W
	 HWylqPllfliiTOLYSdzUXp8MOZ5D1TjYICs9zYCee7kjoME14lQXDyZwJ7QBtsznIS
	 d9DLINjaTAspA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09732C3279F; Thu,  1 May 2025 12:40:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219786] asus-wmi: WLAN is permanently soft-blocked on S5406SA,
 but can still connect to networks
Date: Thu, 01 May 2025 12:40:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lbtowers@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219786-215701-KHONHX11kI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219786-215701@https.bugzilla.kernel.org/>
References: <bug-219786-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219786

--- Comment #12 from lbtowers@proton.me ---
Just built a new kernel (6.14.4-arch1-2) with the patch. Seems to indeed ha=
ve
fixed the issue:

=E2=9D=AF rfkill
ID TYPE      DEVICE              SOFT      HARD
 0 wlan      asus-wlan      unblocked unblocked
 1 bluetooth asus-bluetooth unblocked unblocked
 2 bluetooth hci0           unblocked unblocked
 3 wlan      phy0           unblocked unblocked

I'm not sure if this is solely due to this patch, but Wi-Fi also seems to
automatically be re-enabled after resuming from suspend. I'll have to test =
this
on a clean install some other time.

I had been mucking around the asus-wmi code for a while but couldn't figure=
 out
what was going on such that asus-wlan was being soft-blocked. Turns out it =
was
an issue I had no hope of understanding, way out of my scope of knowledge.

Thank you so much for the fix!

Thank you so much as well, bugreporter23, sorry I couldn't help much further
with debugging, though, lol.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
