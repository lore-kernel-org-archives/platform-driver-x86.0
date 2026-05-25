Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5E318B9D
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779730211; cv=none; b=oREd6tPMmOLI+8JJWrWqQXuUHa8qUw0NcM6pX1ELvPe7clcZ/tBdWSML4C49RkEgS+Sh1e44sroIgYIGuKjuSTMu/2mC0QF/bv6GP1PdKHOSsksHrSmNFU2gSXHJmKl5oR1l1Neu6Q9zWn8D7vk9dojGaGe92a8pedaldu3mxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779730211; c=relaxed/simple;
	bh=/yU0AGJ19ifHUfKY/XYWrN9L3yl7SExompKBSoCIDHQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A/bT9Q6UzF/EvvZqN8Ge/PMHzfmd1AmW/qdymWc1hwbk+2TJfe+rh0mViqzQrzXu9Osa/gcV4zFA+2cqWYkgkA4kJMnRZ2Kpgz3d6gG2Y0k/+23LACVAcEwYT7wWe9ZHdN5R75RzWDT53pEXjcjV59t5ljBSdyOgOzzeqTvMfs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNgJK9T1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNgJK9T1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9716AC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 17:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779730210;
	bh=/yU0AGJ19ifHUfKY/XYWrN9L3yl7SExompKBSoCIDHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DNgJK9T1hMsInIqOn+WytDHo7yJhQnQDAcu1otToDwgSVPX2kcvWhMUhVwxU4Gk0s
	 5700/wKGn7yVjPCLK4m9US4MuoLtKWyewo93KwaroOnUpokZIbY4zfjC0D7l/86TvX
	 rcaW5G3IyTI6Rq0eqy7tZmXSq5QqVgNveH+2UPnyvkbtkM8z6ssUrsonxwIIRh49po
	 y4PF5G+Rra2JdI9KrI5nyygu2FmxA7mnwq0TVEZyNBYBI1LHUowzSk9YoDTv9w+fLU
	 Voz87Nl+iZ9+kO24iu/8SqD3jUPZvZioZf6OMJ4uH74tjNAHEACfuq0cMFpba/APvl
	 Oz4Bm4epJ4vZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E6DDC4160E; Mon, 25 May 2026 17:30:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Mon, 25 May 2026 17:30:09 +0000
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
Message-ID: <bug-221065-215701-HzBHTkX5gT@https.bugzilla.kernel.org/>
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

--- Comment #94 from Rong Zhang (i@rong.moe) ---
(In reply to jeffrey from comment #93)
> I've been testing this patch with v7.1-rc4 for a few days. The warnings in
> the journal are not completely gone, but they have been reduced a lot to =
2-3
> every few hours, maybe. The freezing is definitely noticeably better, I
> can't say, whether it is completely fixed, since the errors are so rare n=
ow,
> but it's not a hassle here any more.
>=20
> Thanks for the work!

Thanks for testing! Since it helped fix the issue to a certain extent, I pl=
an
to submit it soon. Could I have your Tested-by: tag? If so, please leave yo=
ur
name in reply (I can only see your email address).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
