Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938F159212
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748662; cv=none; b=GebNkRJHZqZHAGlCR9TjDvBfr75QROboJAxFqsmWMlbdbsmsRUpaB1MqT3rXEGVxrtf/HqMAgcxUI5qNdcuV4KNaccSiBJjzqbM2roiim5NDS5p8MjQanQqpe1oXIEDIXMSdfohYXBzxpPsnPk/CqiDNqzIa0WKHDysyjS0DMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748662; c=relaxed/simple;
	bh=rQZVO277bXXYrDm//4dnGYuSPt67sa/AxxXHwu7sYnM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mub10ft6byOy9ARfbwBLVAP+Gv7Sh/LAr+TaFRcoS0y/BEzWNkNkWpFcAL+Adf9vazyIO2VVLpX0JIEk57pSSzjLdFYpkB4qeIxs5bQkr8WzOw2jkSOk1PsWviKe26lNf1w4t8QhyIxRIgAvgmvQV2m/JFaJL2hg0U63j4GmU+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG6QHA9M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG6QHA9M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 113B0C433F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712748662;
	bh=rQZVO277bXXYrDm//4dnGYuSPt67sa/AxxXHwu7sYnM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jG6QHA9MYBLR15jMD+aYr5XrOsqJcNKH0eEmgnDtUiU2MmAW8gcHI8tQEQfoJsf6E
	 VWI4u1IVQSy2I+e4VkoC6ko9TMTH8xbdFiP93nZxbnqKtMS7mWNTs0qZYToZTZAnj0
	 MPDIW5kNrlnRQbV6RARCaMVeYKRB1vzo0nq0sixRRWIcu0TapsQkyuSbDRZGLTnI+h
	 Xgd8sBMzN3L3nFqaQs/BeqvEyrHN1uvpPK3jlSNImU0WIsPiC8HKZ9i6Y+BMkDDmGh
	 +vtOxTfBCgGuLfDX4eVFuFozEsrQxX/QffPVRQhObdM0uk714PwcKgEaR34LAxI+Yj
	 0dumt3PATmk/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AA2CC4332E; Wed, 10 Apr 2024 11:31:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 11:31:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-X7l0LFYFB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #27 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Mario Limonciello (AMD) from comment #23)
> Hans - there's a few ways to handle this I can think of.
> 1. Quirk against this system and BIOS to ignore that bit in AMD PMF.
> 2. Allow multiple drivers to register for platform profile.
> 3. Do nothing, let Asus fix in BIOS.
>=20
> What do you want to do?

I wish we could rely on 3. but I don't think it is very likely Asus is actu=
ally
going to fix this and al0uette has just confirmed this still happens with t=
he
latest available BIOS :|

2. seems complicated and will likely be messy, so that leaves 1. I'm afraid.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
