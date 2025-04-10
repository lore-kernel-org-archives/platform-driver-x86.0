Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1B1E8855
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744308953; cv=none; b=g1y8o+/jSz+0V4lMmp5UsZhi+jWT8M39HTbwzxnVDkuYxZHTj+j+OoV1UySSJai+Ojnbj6zji8Ow8QJVt0RnZjZt/vy5hRc7MQurRhlb5i0/Z5JcPV5tcbEB6Zm2SPQ0hLAhTaGiDORBNYhbRPOYZlktvpwAEbMB26sRU3Pcfb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744308953; c=relaxed/simple;
	bh=GYdhjRbMwu2aczY7HY58RLj6oYtd0ioDUNHoldeqF68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agHmsQT8dcPsRcFzzBB3FHWC2jeB5p+Vht8rVsmierp0TIMA5ae7uv3c2C0bO0GPf3x7OSOc5dRFYR8WnpNr24Bs7Ltn9YlwWM7LGMSfeTm4mNZcHn8WLdgX2LRhseoQ1qT46PS3e8MnO8S1gfwdm9Do50ws7GoHmSHqG14Hp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfX8bHwO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfX8bHwO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED3B1C4CEEA
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Apr 2025 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744308953;
	bh=GYdhjRbMwu2aczY7HY58RLj6oYtd0ioDUNHoldeqF68=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mfX8bHwOp+mRvx4d+jkV9hhLaKsX9hv26pLNS5lBLU5suevWkQn/0CxfJWzGJDdOn
	 MLR2OM54qFVY0XyjQt2lXs7ZqUjNJOg4uAZyzOM/G+AVycb6UgsjGSPKvFqTlB1C3H
	 attMgy0JEhGKZEQMIkrBSxVqqmD6Q1bKRniNnz4EIR8W/Qxa+fmWftf3AdFjADJ1Fo
	 p90TqvQifjBn64S0SgDZkCueBF85v0UhBWj5dWdX9vD+zy60hiH/qJvXwKLdbU9+LV
	 yM1XTd13CIHprqapWyOXvBlExxPPFGqkfQe3PAYaVm1+0IZAdSIjT1It44re61PxeK
	 T2jxPqTtg7Dww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DFD2EC41613; Thu, 10 Apr 2025 18:15:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218305] Ryzen 7 7840HS gets stuck at 544MHz frequency after
 resuming after unplugging the power cord during sleep
Date: Thu, 10 Apr 2025 18:15:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mail@dmewes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218305-215701-WdnwgeJNyr@https.bugzilla.kernel.org/>
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

--- Comment #86 from Daniel Mewes (mail@dmewes.com) ---
Wonderful. Based on initial testing, replacing the `usleep_range(10000,
20000);` by `msleep(2500);` also avoids the race condition.

I haven't tested if this causes any regressions elsewhere. Is there anythin=
g I
should be looking out for? Maybe increased battery drain while in sleep? (N=
ot
sure how frequently these "dark screen" wakeups are happening)
I'll keep the msleep(2500) in for the time being and report if I notice any
adverse effects.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
