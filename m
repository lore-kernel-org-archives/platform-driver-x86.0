Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F36AD2C
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771865031; cv=none; b=G1I6l+60BDgc/0LuUI+ZOAox7uPXfbcnJgT0pCwPo1GsMW0KGMkkl2y/c+i+99JEmrEqvq5q1MeggyOZkXOOORfXa2OKiRNT9N0R/QBZHEzinnexgr/ER0eWKWNt4tddc7E3BBq8zWWD3EXMvvVvPPoclUOJHHBwrjjj8FPBhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771865031; c=relaxed/simple;
	bh=Z0MQ3wzWndLpJauF6cvPnDMpSolTKTQ0iTjnFSsmi3g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ecakVpSO5vUNcQPQLRe5AlukVm211BhqaILhcydKXNL9SxlCIk2VkKeM5uhn+YXyKk9fK/7pWDnjPXI5ygt3ITPn8TxxZNoTazHUd+TezNIVuprFvLFpr6wSUxoFOiQh7XkCPu4PwGlsYFddY4NF83B5ybelUbrUaEHrLo3f12Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdsQLgmG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdsQLgmG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613EBC116D0
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771865031;
	bh=Z0MQ3wzWndLpJauF6cvPnDMpSolTKTQ0iTjnFSsmi3g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rdsQLgmGGlIB0VJzhM3nlU3f8QxnH43wVOVbi/XyeS5RQiXnMgxj99BctNN3szTfH
	 6DQJ4gFSbAxXxeXYmun7QlIv88VeFmUNJc+u8jnGmILZi0YU8sxzgqp/fR6rTiOTJ6
	 E74EAH8tgi0MjTPyLXohzX6Fhhu4HNGJp8yzTNQxiyEKmC8pWiwt8ID6CuDBQ8NEWX
	 lbZhKIbeBl5PwIJ5X6WSCzDPzr/UdCBtPhJJCsTdMIyU2jWiiJIpKXTV4G9UvD9dlQ
	 JSHNNLSrZiiSIho6IgRsRLd4BeKiuqr6j6VfE2w51PY5ksCT9A+Da49fonq4l8AOrq
	 mXU+YGa+5Y2ww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AD49C3279F; Mon, 23 Feb 2026 16:43:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 220722] Non existent battery reporting for a laptop with
 touchscreen MSI
Date: Mon, 23 Feb 2026 16:43:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ggrundik@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220722-215701-8mvpdiGdKy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220722-215701@https.bugzilla.kernel.org/>
References: <bug-220722-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220722

--- Comment #12 from ggrundik@gmail.com ---
Isn't this a GNOME problem, not a kernel one?

Current PCs can have quite a lot of battery-powered devices, apart of PC
itself: wireless controllers, mices, keyboards, pens, VR headsets, headphon=
es,
etc. Most of them can report their battery status. If a desktop environment
cant separate them apart, and dont understand which is PC itself and which =
is
not... Its clearly fault of desktop environment, since its quite a common c=
ase.
KDE, for example, has no problems with that. This bug should be reported in
GNOME, not in kernel.

Blocking some device metrics in a kernel, just because some specific usersp=
ace
program incorrectly handles that in a weird way does not seems like a wise
solution. It is a perfectly functional, correct and useful metric.

This touchscreen is has two sensor layers: one for fingers plus one for sty=
lus,
and it does report battery status of stylus. Communications between stylus =
and
the drawing surface can happen only when stylus is in range of touchscreen,=
 its
a hardware limitation. So touchscreen does not have any information about
stylus until this communication happens at least once, but this does not me=
ans
that there are no stylus at all, or it is never in use. But after this
communication happens, touchscreen remembers last known status, and its
correctly shown as a battery level.

Before this change was made, this touchscreen was working as good as hardwa=
re
could. Now there are no pen battery status not only in GNOME, but nowhere.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
