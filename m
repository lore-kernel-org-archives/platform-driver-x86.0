Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B055360ED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767240; cv=none; b=ijqqQtZ7VBHelKBucGVWrd5T1hFkGbmTuPTUJRSUiNJUqE7vPfAGxRzMtHpiO9nYyDhJwS7sLhkNqmNu05PchwgWDoBHWLWnmXNIcB7Pvk43LCD+p7jGNTnYU5HfPLRQI7/W4Pfg/THNSY33B4RSeHFtK8EiXDWamvHHqlzMC30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767240; c=relaxed/simple;
	bh=GSlF5PGmk3QvyB0kKPCIFgY0EZoZnB5hwT1yPIBA34g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZHKvNE8rKp+4Y1SngMDOu5+mDW2O4VNOQXGOU5e/x0pBd8SyXfntvwO13LRg14WRbc1PxuCqxskIqthkSWQXVwUzloZGm2fU+0TEr1XVaJmCIANjBFFktBqcpCk3q0K5/XFvQWbx7rUyFOhQCw7O65Xed5MeCL4LpPdRTafNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pA4mysYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pA4mysYN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03C76C2BCC6
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 21:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782767240;
	bh=GSlF5PGmk3QvyB0kKPCIFgY0EZoZnB5hwT1yPIBA34g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pA4mysYNUkdgBQL1dG3/tIX73gOMWLFRhJ21dhD5OymqOGbO4gHfGtyhdZn60F4Jt
	 1BEx2fmZ8mSLy3wmk+uF8+3dmKANWRX5t2JDlN7XseqVKvrnRsjgOaWgCnDchGEcLJ
	 Eg58taTXz0jW+Qjl1z7t69nCLp3YCQPoGF+tWo59UhEGadMO1rgNAjdXxalmYoLpIy
	 y/Dsdn5A/YoxwVnnB9U8gaEHZcCK9xH5TsvJcNlMrke06cLX6jpk+icdCuqvgf69Qx
	 hYu8WNQ5d1vrKuwqxbym6H/bWfrtDML7HrXTVW6xrwutQYr36Um5XRkDo6nsSzqq3w
	 B4HMSuJhMGbng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BEE3EC3279F; Mon, 29 Jun 2026 21:07:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221694] [regression v7.0->v7.1] AMD Strix Point (Ryzen AI 9 HX
 370) intermittently hangs on resume from s2idle
Date: Mon, 29 Jun 2026 21:07:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221694-215701-23zDByT7Ux@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221694-215701@https.bugzilla.kernel.org/>
References: <bug-221694-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221694

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I bet it's this.

https://lore.kernel.org/stable/20260628140148.59923-1-admin@ptr1337.dev/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
