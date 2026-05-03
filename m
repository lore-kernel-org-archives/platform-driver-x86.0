Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE571A2C04
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832638; cv=none; b=mDb/ybJTLMVan86jqhHPHbTPifzPmrTo7w1Sv7JLhS1PalXRb0Q+7zz8+lCekYDt5d6k8TIq5StWWGO8jJae5VrleIBOvvIaaBGhMFB04CPygVfxgSMHREgoqwRolCudyv2G2ZbVIVWz1/ayiTZUoBOv7fYcImmtXydzD7Nlp+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832638; c=relaxed/simple;
	bh=g7F6xjiBdKN9OAnOn606Nc5xOryP7KsrqaUQP8icceo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9kahWRKE3oZolAEndDVentJO/yEzemJkZgE2b0YA+ZMicduN724cpP67wmc0Ty9rQ9fxupadOLJyzo2Znio+EvG4Ra2swBvkqXmi8oDUx7SYLRYMlByMi53JtJlCx9C8kxHyiUYVDzCJGeMGzBsVjW5ge+3OIfab2LJ4Liwk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYvegKUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYvegKUX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F54C2BCB4
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 May 2026 18:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777832637;
	bh=g7F6xjiBdKN9OAnOn606Nc5xOryP7KsrqaUQP8icceo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GYvegKUXXSKpkCIylLHvRSEattRdH4lAFQCFPh/XPQzHMQuamcke/CevhjgFTxsD3
	 sZMt2KnGr8P2af8pr/GrT9ffEDIZUAb/mCLg1eXQpxshXKgKg44F971XNsR0P3TsGH
	 CgXGNQ65Pi3gpTZf/31W16iPln/rdroSaAPBu/OpjVJLPy0mvZGKjvEsPW/XiLGnXh
	 68IRLho3Hau4jxtLByMiQIo8cHkhn8h299j0r31gAfMW4IO2zN3NaEJ8eag5CL26Yv
	 jwv+8qkZg2WGUGnXGKcwVsDQ9RHCDIg6EKpWOg4nLLiNPdDS+YBL2GJ2wDMrPuyF96
	 z/c6sg3oajjAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0DE9C433E1; Sun,  3 May 2026 18:23:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221419] ideapad-laptop: brightness keys require continuous VPC
 polling to function on IdeaPad 3 15IIL05 (BIOS EMCN60WW)
Date: Sun, 03 May 2026 18:23:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ladha979@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221419-215701-NFBK6ztVd7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221419-215701@https.bugzilla.kernel.org/>
References: <bug-221419-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221419

--- Comment #2 from ladha979@gmail.com ---
(In reply to ladha979 from comment #1)
> It's suddenly working now, but this has happened previously for me on Lin=
ux
> Mint as well where it abruptly started working, and possibly just broke
> again no warning.
>=20
> So i don't know what was causing the bug or what fixed it, but currently =
the
> key presses are registered on evtest, and hopefully it stays that way.

Admittedly I am on an updated kernel version, but I doubt there was a direc=
tly
implemented fix considering this problem has existed for this exact laptop
model for a long time with no concrete fix, and this bug report saw no
activity.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
