Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A4126C03
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770819186; cv=none; b=qr/iIp6LGohmw+bD3mg5szvyCzr2rlRdWX7AZ2epWPvBTSaiB/7PgNEUxbNGJ+gIhWaGOgZHaKWF1Z7H6LW0Ikq/L4fAbIMzPf416SxPZM+Es6LaM59bbEhGp5MNx0RwFB0vLat28AEy38hlCaWzwh4yiirayEbzQf+CS+lixjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770819186; c=relaxed/simple;
	bh=1pQR9BXpz8z+nBi6ls91rNZ68VbyV52QHLedgXcjWAI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ki81SrEogwXR4772/b2P8iwGwOi4CSEZnNr+aF7mptja59XwhpJc4RgBeTT+MUmLhqovz2bye8DHWM7WFyEuMpl09E28qOX25FWmpIvkYOhNHPCXdVaphn35HECtdTvR9uk9a8IPsr4+zweswJMDb3To7safZ5m1KMcO8qmj+ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG/1RVH2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG/1RVH2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE553C19424
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770819185;
	bh=1pQR9BXpz8z+nBi6ls91rNZ68VbyV52QHLedgXcjWAI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jG/1RVH2zzxqPpr+kYELQUs9vvOgGmo+R3gA7GZom9kpPjZdlzk4/S1RcZlku72RK
	 DHsHZcEvh3sC5BNJMSKQVtk1kjo4tjB908uPJ/aARQLYUDsnYb/UFe+nUGj7nAS5VI
	 A9s0hl9bElys/mspKPfauVl2P2vUGpTMvs7lV2RSc4ALlMsjFy+jQk01jADBiKkNWf
	 G7PyiGMlZXulI3TkMcjmIjgCCWMNEgiEYCYqzzVgMyynL6gHKO9R688yomtQ0vxZj5
	 sAvI5zNcRU7N9/nhl1DqgDqX2VLZBl2Jp6D4u0EDMko9mHbkgm14s+YbsDBpiX83AY
	 hjurB5eoQl2+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD4FDC433E1; Wed, 11 Feb 2026 14:13:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Wed, 11 Feb 2026 14:13:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221065-215701-y45seMKwxR@https.bugzilla.kernel.org/>
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

Rong Zhang (i@rong.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |i@rong.moe,
                   |                            |mpearson-lenovo@squebb.ca

--- Comment #22 from Rong Zhang (i@rong.moe) ---
+CC Mark Pearson.

Thanks for Armin's insight!

Yeah, the root cause should lie in the ACPI table. It's super broken as I e=
ven
found more ECMT issues...

I've noticed these methods are broken while glancing at all occurrences of =
ECMT
in DSDT: WTER, ECCC, _BTP.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
