Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3AA312819
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777068553; cv=none; b=WEgxPL6YLkQ6n4DZGhrVsAKNc76SUFH9ztd0bnNyS2U4fIqHB1sQx+TGrvBwSlfQmu1ThzWQejkp0LQJo0d1tf2fewGD0EUcey9rnQr94gOrzv6IT2HuEM/neGTpY0yKfOYeE5f116cxYfz42D2a5dVs9F45L20ckWawGApOlyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777068553; c=relaxed/simple;
	bh=6HfBFEkqh3p4GfSteFg0wS3dVbnjGD90Pz5NT1D5SoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b81ankmY62nCRieWTcBS2HyXbdrxzMkShRbGhwom7qT4T9aaID7B0WONqsg60VRJfgWzt9VKUXORjHHz+873z/xLKXN51awnMJHFhITUVbDI4rQVLS1yRlRxeFUV8THud0xFY0CtjSNO922afwXyi2xiRa5NQEVIzOUpo2p5zv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR/lR3C1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR/lR3C1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D599C19425
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777068553;
	bh=6HfBFEkqh3p4GfSteFg0wS3dVbnjGD90Pz5NT1D5SoY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sR/lR3C1Eyk5pQ9btcwmM14/l/H5gtVfwiPTwB8F1zb7MAcifxhP/hHV18QmOHy8B
	 NviOzh/KjUSeVJAJj5iJRbtSc6LM2d5SD6IKH5QAN17PCOnaNyoXkSy4btapZKCD+o
	 wyVHZTjGVz4ySiIxBo0i7sLXujmFqXSMmLBYBOq7BZc4kVmZAVK+HaIkIY0DipukZ5
	 cx0mxGEKo9yzcGp3hpXWYU1CdE/4p/bzmlv1NhIOtZ6VNqASHWTQUr2cWI6ZJ2ZEQf
	 dtYZIZ2Gp0HGO7L9rCw0OI3l7RICJTBDp0FRVUqlJow6xk/o1F7id0ReeD806uS81x
	 FGRBVBXqMBlDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 76C00C4160E; Fri, 24 Apr 2026 22:09:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Fri, 24 Apr 2026 22:09:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-I6QHNpWyaG@https.bugzilla.kernel.org/>
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

Rick (rickk1166@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rickk1166@gmail.com

--- Comment #60 from Rick (rickk1166@gmail.com) ---
I also have the Lenovo Yoga 7 2-in-1 14AKP10 (specifically Model #: 83JR000=
2US
which is AMD Ryzen AI 5 340).

Running Linux Mint 22.3 using Kernel 7.0.1 from Mainline (but same effect w=
ith
earlier kernels starting somewhere after 6.14)

I found this bug trying to track down a system (GUI?) pause every 7 minutes=
 or
so which seems to correlate with the event discussed in this bug (as seen u=
sing
"dmesg -w").  The pause is around a second in duration and oddly the mouse
cursor will still move but everything else stops.=20=20

If this is the cause of my pauses then at least I can stop looking and wait=
 for
either a bug fix here or in the Lenovo BIOS.

Can someone confirm that this event correlates with a system GUI pause?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
