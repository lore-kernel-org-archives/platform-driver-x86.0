Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B302749E0
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345695; cv=none; b=aWlTihDE9fNSQKA73Zxfh4wBUIVCBFVDeDSWDjaVofgsNgxMJjuzXzJe+5qILnYsWmIHROB16XtFCTTL9oc+/raqBcrchTBdtxjOsySvpR0dJ0YC5kx65gmmKSIFxnOuBJh2Td3btwdNv0XtKg84nezTg3AYKPLGaKo8WhEL7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345695; c=relaxed/simple;
	bh=J7QmFBB8Lh4YfdWP+sHitwK+YXx+e+shV1L0XzXZBQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d2L2E4WCPr+HbeHlKNWLoWg5V7k9sRF95qMxtvvEAf3Qi1GcXt19IqibgobXlM4taLO9Rw4BAHEU5G2SWW8jO+HrjjJuJ0a2vZ8Frq7YdqmnpZLWMVBGYnuzTKgPz7URDianGasBJIugrIKK32zG9ewC5bfDVj2TdBdZkDi8ets=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my60w9cJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="my60w9cJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD774C19424
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771345694;
	bh=J7QmFBB8Lh4YfdWP+sHitwK+YXx+e+shV1L0XzXZBQo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=my60w9cJ5lRErb2I1b6eY2iQ/8CdONO8tSGlg3Kbw59tM7kV7Ng5HcMzZuLxzXKkI
	 CtOakiEj8xhtRShB8z7d3cfwtgMbulJZUhzymUvYZTr7xvUbs2aktHDhCcQ/YLzZGB
	 4sbqotedOI1ucrj6XmK8RrVOHD20RV7LLlbxSQvFMq6QJY6U+N9UPexrGvWb0Luksm
	 64ufK03+yFw/c2bDIRfLOqGm5rN98An3o5PwkruxO9EgXamn+sBSGOB/jgwCCGNKdy
	 hUWDvrHVxwnJlPJiQDRDxWFzvQfTGYtqjGDpY3rqOJx57qjD33nPmn0ivUfJGJ0O+9
	 Uomnr5Nm88CQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE7DAC4160E; Tue, 17 Feb 2026 16:28:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Tue, 17 Feb 2026 16:28:14 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-VW4g8xWyrS@https.bugzilla.kernel.org/>
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

--- Comment #41 from Rong Zhang (i@rong.moe) ---
(In reply to Avraham Hollander from comment #36)
> I don't *seem* to be getting the mutex error with it blacklisted. However,
> I'm still getting the original error from ideapad_acpi.

That should be a good sign.

Not making the ideapad-laptop error disappear hints that there must be other
methods holding the ECMT mutex for too long after resuming from s2idle.
Debugging with https://docs.kernel.org/firmware-guide/acpi/debug.html may
reveal more details.

(In reply to Avraham Hollander from comment #39)
> Question: If the problem lies purely in the DSDT, would it not be possible
> to test a fix with a DSDT override? I am open to doing that.
>=20
> I think it should also be possible to fix these errors with a DSDT patch?

From my perspective, everything built around ECMT is broken. Fixing ECCC, W=
TER,
and _BTP by overriding DSDT only resolves #2 (see comment #33).

To resolve #1, every method that relies on ECMT must explicitly check the
helper functions' return values and must stop propagating nonsense on error.

Of course, you may lengthen the timeouts of acquiring ECMT and pray for
success...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
