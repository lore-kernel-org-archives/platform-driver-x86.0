Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2A249E0
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jan 2024 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705520015; cv=none; b=IuK/v7r90uya/Azds2FfJf3HhRyx8tu1hvP+sSe5X5Qpb9NN29pT+w/WwJ4xvVru1K6gpbqrkp46XylPljDHiMG0lnpctsQyhg8Ac8q6y6bKTXAQf8BTN0kubMfVt+AVh1EJTcKeP9ec6jFGGXMiChC41Fi4WtAccef44aSAQ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705520015; c=relaxed/simple;
	bh=W4pyizwyebfW+Aw8yi0skhwKeY1uSC7uO0I+9dz5C+g=;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:
	 MIME-Version; b=EkgCslCI7p0wC1aOXR1tpp96LLrCkrqJmtGsj1bZzExnlU0WKf0uxb5aX7xbHvJ1Lcy0P/nYDOHkxCO0XIKmoEoALMiRkyS1gvvzLjxUqrlZvWtzIlUwDpLGWd5yseod0ZLuuFUGReKTPbcmUiz6uNajxDZOeD4BCI+Y+ICxS2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlfZ3sOX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlfZ3sOX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA8B7C43390
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jan 2024 19:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705520015;
	bh=W4pyizwyebfW+Aw8yi0skhwKeY1uSC7uO0I+9dz5C+g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FlfZ3sOXJicUt4NTY6oaSUM9cAfuMOFbEZAn4GSDqIaWThp0RVSqlWe1GF0aKIZyw
	 wCYow3mU3nLUl2OzNrH+d00SWfwkEOSdAECv5qyCFcnAlX8X6mgkAygp863HsFmaDl
	 a/fuS8dgAFBsOqQUp9SLIu7VbaABDxuSzA/OnL85OOBqUBHLg7grGrVpYLL1nMsiAd
	 W6Xshr2KdU7ML044Q3i4+IdwUX2okCTbaa74R4PqjhwVEdvKaEsk8rpTGuN+SM3XEP
	 xbzA+LFbsACaM6WP0sA98MEMjZ0dpPV/bPSBdSRnXxbhN+YH4z0gF1UQoSpZSNp83e
	 fnCSP8ldkDmow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C604EC4332E; Wed, 17 Jan 2024 19:33:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 17 Jan 2024 19:33:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-4fqrJNxK9G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218305-215701@https.bugzilla.kernel.org/>
References: <bug-218305-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218305

--- Comment #15 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Mario Limonciello (AMD) from comment #14)
> Under the presumption that ryzenadj is actually retrieving the correct
> values for STAPM, PPT FAST, and PPT SLOW I want to ask if this is tied to=
 a
> specific power adapter, or sequence of events.  Like suspend on power,
> resume on battery or suspend on battery resume on power.

My laptop is plugged in 100% of the time.

>=20
> If there is a linkage between any of those, then I think this is "most
> likely" an HP EC bug.

I've given up on reporting bugs to HP. It's a complicated process which tak=
es
forever. I bought this laptop and its maximum CPU frequency was limited to
4.5GHz which took HP over four months to resolve and that was at least
reproducible under Linux and Windows.

This bug seems to affect only Linux or maybe I've not used Windows enough to
face it in the Microsoft OS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
