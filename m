Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DB73F3278
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791357151; cv=none; b=dvLNuZQJ7pIyWC7JdwMCJexA9Gp6OKN3kLEkP8f9t4caBirMTBhx2in/dgGtNeHI7RKuXHFwL6eRfQTY3HTM1W92wxLZPdTFuOi2HNvfv7VrXW93sGSmC/i1YIBcyhQ+msQG8nyeN21y3nZIG3I/HJtdWpANJ9z6H+TELMAEkpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791357151; c=relaxed/simple;
	bh=XAVugU7tRo9hg5c/OnW4d/nEGtrr5ltVRgi7L7rH4SY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rzhLL+ADYE8lBbfJ2P8TrD3NDQy+LXqs3CEgIgED9wBabWhXF0YqGI6IDxSfa8A8jrU6ubcRZHJN9LqZ2CZLRe4WpSc5Fib162tG0ngzAl5Z0HRfTIHd1e4CfCoCHHLsacsthqOborCKyWXegpVNbA3KZk7l4Gp4Rd25RXslYVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/NL91oJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/NL91oJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D15BFC2BCC7
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 07:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791357150;
	bh=XAVugU7tRo9hg5c/OnW4d/nEGtrr5ltVRgi7L7rH4SY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e/NL91oJ6pDAWUGYuDsaCkVinkfk5oK19j9Me6Sjauij8KSEDGB/TTh24vVPJkdmu
	 uB64Koew7yFVltsrULfexjNrLgsz7yWVOxSFVhdHNLFEehNhfYW3TWR9OCMDU5d9Jd
	 hlL6ndAF5+9B9Krtb/s+bHor2qvJ3MPHEeT4FcWFOMTRK4OX1Aeb/X6ptMuOKO8ZZT
	 aLEOniACdUaKKV59RUXS/ZRuBVhJTu0yzz37AS9bWWOK8iDEoaMv/RjrM0qLNMdGLa
	 8FvwuvnWVyeC9whuBU0EPs6jJMXV158DS2qkVCag/jWlBa52yJE2l03N0uqHnJ8D1y
	 4H5c4RqBHzZJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1B24C4160E; Wed,  7 Oct 2026 07:12:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 222044] hp-wmi: Mute and mic-mute LEDs not supported on HP
 Laptop 15-fc0xxx (board 8DC9)
Date: Wed, 07 Oct 2026 07:12:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: neonblade018@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform
Message-ID: <bug-222044-215701-3umrtj4oRh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-222044-215701@https.bugzilla.kernel.org/>
References: <bug-222044-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D222044

Piyush (neonblade018@proton.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|AMD                         |All

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
