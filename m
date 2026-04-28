Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB0272801
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388458; cv=none; b=LUxJnmIOU452mF3r3dTIKy5X5zJydmyL+VwRCom0Szvkser8W17zQ4yXIn/WhzBUJIlXKkve4hmlQMJNfhNcTEu7l1VbzgXVtGfXoNByx11Pu1u9QGNpVbcRTb/sOe0gLGnnNzbFHLI7L35fo+A5RV6JHUCE76Xp84dul7u4qg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388458; c=relaxed/simple;
	bh=3vshxGpAWZeBFToG7yDkIPTcCYrUT+/Hmg22Lv+aPzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J7QFfUUrHKOVF3MAEEcYzYePJMAAeHtyHytijC7W4PDN8CB/oLP56isxdq7roWnS2ajFnTW1Bt9ngz/UzVsOMHa3rqAQ4oYoM0Sza/gthdDVw/lud76dHde7SL6JRk1hUj2G6JJPsoBVu5lXd9shUX0w1odABwk6hP4c/Y+Lw5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S27daKiX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S27daKiX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8BEEC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777388457;
	bh=3vshxGpAWZeBFToG7yDkIPTcCYrUT+/Hmg22Lv+aPzo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S27daKiXsSp3Vr7mM65+hee8cSZ9nJ+4q7i0/UdwWGqR6QGVz83REc7TQ+7E2AQJD
	 0MAM1YN9/z9hk2RXJEbkgVD5+qloWzZWhba+WMrNES4ZvP8I6rX3FTJ/+GRNEoUL5p
	 hLNlxULX8HItY/74/cBckQsNltQ4SfMXS9xJeEE89tUuYFtjGf2nRtvJni5sk+sWWs
	 SmyWZ6nUiREHlTBws0SR3t+r3KI3WFLkEejdaWSuhn15E/dtLhr22s64HYw5tl12f1
	 tN5z/WhnH6Ng2Pjo0gHwRirnODLNHvGCDw+fPAVukIh+ZZUublWv3WXFevlGBc2fYW
	 jFpWZOkXkShUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B18D9C433E1; Tue, 28 Apr 2026 15:00:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221383] ideapad_laptop: Fn hotkeys stop emitting after s2idle
 resume on IdeaPad Slim 3   14ARP10 (Ryzen 7735HS)
Date: Tue, 28 Apr 2026 15:00:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221383-215701-E4WfC7WiLM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221383-215701@https.bugzilla.kernel.org/>
References: <bug-221383-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221383

--- Comment #57 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Yeah; It's hard to know if people just haven't tested those systems with Li=
nux
or if they don't have the bug.

Good point it's only 2.5s and you won't notice unless you're looking for it=
.  I
can be convinced either way here, you can make the call when you submit the
patch.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
