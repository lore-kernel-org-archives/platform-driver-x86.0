Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFB3D75
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jan 2024 04:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705464655; cv=none; b=PJvlPpYFTVyDcWU07BcfDwgH0CQggxXexysr7ZcwgaROw3WiLmicJXpuC6a07fRLAexc3n5z3p04rTSOrCb0bOuHRo1QT0sR8961xtYhRWAEd0L84pMpSaVi0RlBbJXZ89qN1xe7m5HH4sbi9UDz/hxtCNSdwfsN6fCUmhnJar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705464655; c=relaxed/simple;
	bh=yXSbu7s1e/Xr4IW9Wk0rU1TOusd7NSJFxaYJksdy9W8=;
	h=Received:DKIM-Signature:Received:From:To:Subject:Date:
	 X-Bugzilla-Reason:X-Bugzilla-Type:X-Bugzilla-Watch-Reason:
	 X-Bugzilla-Product:X-Bugzilla-Component:X-Bugzilla-Version:
	 X-Bugzilla-Keywords:X-Bugzilla-Severity:X-Bugzilla-Who:
	 X-Bugzilla-Status:X-Bugzilla-Resolution:X-Bugzilla-Priority:
	 X-Bugzilla-Assigned-To:X-Bugzilla-Flags:X-Bugzilla-Changed-Fields:
	 Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-Bugzilla-URL:Auto-Submitted:
	 MIME-Version; b=dmQlmi55DWraDSVtJXJZCt7zimAScqAoXI6i5KignGDpUnhX0fWhhXKo1ZvbmUdeZ4qEQYtgq9tMldqNtM1ND13lDz5kelgkPx5o6ynYSWU34xwWWj4gxDkpyqYLXLiG4NZ2io0I8j9L8PIxxsy8VCd82gA4qeDrpPfj8DLroAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDBMdTaq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDBMdTaq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3CABC433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jan 2024 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705464655;
	bh=yXSbu7s1e/Xr4IW9Wk0rU1TOusd7NSJFxaYJksdy9W8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cDBMdTaq8XBOZk0tQMy3+c28diVcs71fg70POzLPEs7SGl4+MT4KpmsyIrq0JdocA
	 14XtYUPb+aim1XjDAyuI3KCvpdZp2dk51+PS/PHhxdjZQb0JnnCnNp9QpyRp3mATEK
	 YlEiYYWuDKn+r8Jm8rzJ3/ieeiegYeQgZ13ZiB1Rdb74Qy8qB3LBztg/wlWSJ9v2tw
	 7VlOwqtnXJvQyQt3iCq3fK9hphrDRarMMGDQEmOLWH9OTOAvGkPywqDSF+FW4NNFkc
	 M0IKTzzCIcPvlDof0tv1PsbOm04PSugGw7MXU+jvkLUq6LiGhC2fsvcQDgZlCuYzqS
	 HAKrkgGzt/wuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3F8FC4332E; Wed, 17 Jan 2024 04:10:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after a
 random number of suspend/resume cycles
Date: Wed, 17 Jan 2024 04:10:54 +0000
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
Message-ID: <bug-218305-215701-tNCBQ2oJQR@https.bugzilla.kernel.org/>
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

--- Comment #14 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I read through this thread and I currently think that Artem and Dan have
encountered two separate bugs.

@Artem:

Under the presumption that ryzenadj is actually retrieving the correct valu=
es
for STAPM, PPT FAST, and PPT SLOW I want to ask if this is tied to a specif=
ic
power adapter, or sequence of events.  Like suspend on power, resume on bat=
tery
or suspend on battery resume on power.

If there is a linkage between any of those, then I think this is "most like=
ly"
an HP EC bug.

@Dan,

Can you reproduce this if you manually always set the scaling governor on a=
ll
CPUs to "performance" before you reboot?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
